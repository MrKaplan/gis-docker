# 00 - VISÃO GERAL DO PROJECTO

## Índice
1. [Contexto e Motivação](#1-contexto-e-motivação)
2. [Objectivos](#2-objectivos)
3. [Infraestrutura Base](#3-infraestrutura-base)
4. [Conceito de Área de Estudo](#4-conceito-de-área-de-estudo)
5. [Organização por Núcleos de Análise](#5-organização-por-núcleos-de-análise)
6. [Anchor Projects](#6-anchor-projects)
7. [Resumo das Decisões Principais](#7-resumo-das-decisões-principais)
8. [Portfolio e Comunicação](#8-portfolio-e-comunicação)
9. [Fluxo de Trabalho](#9-fluxo-de-trabalho)
10. [Documentos Relacionados](#10-documentos-relacionados)

---

## 1. Contexto e Motivação

### 1.1. Perfil Profissional

O autor deste projecto é um **profissional freelance de SIG **, com foco em projectos nas áreas:
- Ordenamento do Território
- Avaliação de Impacto Ambiental
- Análise de Condicionantes Legais
- Análise de Riscos Naturais e Ambientais

### 1.2. Motivação

Este projecto serve múltiplos propósitos:

| Objectivo | Descrição |
|-----------|-----------|
| **Capacitação técnica** | Familiarização com stack tecnológico moderno (Docker, APIs, cloud) |
| **Portfolio profissional** | Demonstração de capacidades através de projectos concretos |
| **Aprendizagem contínua** | Domínio de processos de análise espacial avançada |
| **Visibilidade profissional** | Produção de conteúdo para blog, LinkedIn e GitHub |

### 1.3. Princípios Orientadores

| Princípio | Descrição |
|-----------|-----------|
| **Custo zero** | Uso exclusivo de software e plataformas free/open source |
| **Reprodutibilidade** | Tudo versionado em Git, scripts parametrizáveis |
| **Open Data** | Disponibilização de alguns elementos de dados e código para a comunidade |
| **Documentação** | Processo completamente documentado |
| **Qualidade > Quantidade** | Menos projectos, mas bem trabalhados |

---

## 2. Objectivos

### 2.1. Objectivos Técnicos

1. **Montar infraestrutura GIS completa** em cloud (Oracle Free Tier)
2. **Desenvolver competências** em Docker, Python, PostGIS, APIs
3. **Criar pipeline reproduzível** de análise espacial
4. **Publicar resultados** via WebGIS interactivo

### 2.2. Objectivos de Conteúdo

1. **Produzir análises territoriais** para a região do Médio Tejo
2. **Criar projectos demonstrativos** de diferentes técnicas GIS
3. **Gerar conteúdo** para portfolio, blog e redes sociais
4. **Contribuir com open data** da região

### 2.3. Objectivos de Aprendizagem

1. Processamento raster (NDVI, NDWI, índices espectrais, etc)
2. Análise hidrológica (bacias, flow accumulation, TWI, etc)
3. Análise de redes (isócronas, routing, acessibilidadem etc)
4. Séries temporais (monitorização, change detection, etc)
5. Publicação web (vector tiles, WMS, APIs)

---

## 3. Infraestrutura Base

### 3.1. Hardware e Virtualização

| Componente | Especificação |
|------------|---------------|
| **Plataforma** | Oracle Cloud Free Tier (Pay as You Go configurado para €0) |
| **Arquitectura** | ARM64 (Ampere) |
| **CPU** | 2 OCPUs |
| **RAM** | 12 GB |
| **Disco** | 50 GB (expansível até 100 GB) |

### 3.2. Stack de Software (Containers Docker)

| Container | Imagem Base | Função | Obrigatório |
|-----------|-------------|--------|-------------|
| **postgis** | postgres:16 + postgis | Base de dados espacial | ✅ Sim |
| **qgis-server** | ubuntu:24.04 | WMS/WFS/WCS | ✅ Sim |
| **martin** | ghcr.io/maplibre/martin | Vector tiles MVT | ✅ Sim |
| **pg-tileserv** | pramsey/pg_tileserv | Tiles + funções SQL | ⚠️ Opcional |
| **titiler** | python:3.12-slim | Raster tiles COG/STAC | ✅ Sim |
| **python-api** | python:3.12-slim | FastAPI custom | ✅ Sim |
| **jupyter** | jupyter/minimal | Análise e prototipagem | ✅ Sim |
| **nginx** | nginx:alpine | Reverse proxy + SSL | ✅ Sim |
| **cron** | alpine:latest | Tarefas agendadas | ✅ Sim |
| **redis** | redis:alpine | Cache | ⚠️ Opcional |

**Princípio fundamental:** 1 serviço = 1 container

> Ver `01_STACK_TECNICO.md` para detalhes completos de cada container.

### 3.3. Diagrama de Arquitectura

```
                                    ┌─────────────────┐
                                    │    INTERNET     │
                                    └────────┬────────┘
                                             │
                                    ┌────────▼────────┐
                                    │      NGINX      │
                                    │  (reverse proxy │
                                    │   + SSL + cache)│
                                    └────────┬────────┘
                                             │
                    ┌────────────────────────┼────────────────────────┐
                    │                        │                        │
           ┌────────▼────────┐     ┌────────▼────────┐     ┌────────▼────────┐
           │   QGIS SERVER   │     │   PYTHON API    │     │     MARTIN      │
           │   (WMS/WFS)     │     │   (FastAPI)     │     │  (vector tiles) │
           └────────┬────────┘     └────────┬────────┘     └────────┬────────┘
                    │                        │                        │
                    │              ┌────────▼────────┐               │
                    │              │    TITILER      │               │
                    │              │  (raster tiles) │               │
                    │              └────────┬────────┘               │
                    │                        │                        │
                    └────────────────────────┼────────────────────────┘
                                             │
                                    ┌────────▼────────┐
                                    │     POSTGIS     │
                                    │  (+ pgRouting)  │
                                    └────────┬────────┘
                                             │
                              ┌──────────────┼──────────────┐
                              │              │              │
                     ┌────────▼────┐  ┌──────▼──────┐ ┌────▼────────┐
                     │  JUPYTER    │  │    CRON     │ │    REDIS    │
                     │  (análise)  │  │  (scheduler)│ │   (cache)   │
                     └─────────────┘  └─────────────┘ └─────────────┘
```

### 3.4. Bibliotecas Python Principais

```
GDAL/OGR          # Processamento raster/vector
Rasterio/Fiona    # Interfaces Python para GDAL
NumPy/Pandas      # Análise de dados
GeoPandas         # Dados espaciais em Python
Shapely           # Geometrias
FastAPI/Uvicorn   # API web
pystac-client     # Acesso a catálogos STAC
earthengine-api   # Google Earth Engine
richdem/pysheds   # Análise hidrológica
```

### 3.5. Extensões PostGIS

```sql
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_raster;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pgrouting;
CREATE EXTENSION pg_cron;
```

### 3.6. Considerações de Performance

| Aspecto | Consideração | Mitigação |
|---------|--------------|-----------|
| **RAM** | QGIS Server e Jupyter podem ser exigentes | Usar Docker Compose Profiles para levantar apenas o necessário |
| **Disco** | 50GB desaparecem rápido com raster | Processar via STAC/COG on-the-fly, não armazenar dados brutos |
| **IOPS** | Armazenamento Oracle tem limites | Usar índices GiST, CLUSTER, cache no Nginx |
| **Conexões** | Pool de conexões PostgreSQL (limite 100) | Gerir bem conexões com FastAPI assíncrono |

### 3.7. Recomendações Técnicas

- **Tiles**: Preferir MVT (Martin) sobre WMS (QGIS Server) — mais leve
- **SSL**: Usar Certbot ou Nginx Proxy Manager para Let's Encrypt automático
- **Monitorização**: Adicionar Netdata ou Portainer para observabilidade
- **CI/CD**: GitHub Actions para deployment automático
- **Manutenção BD**: pg_cron para VACUUM e refresh de Materialized Views

---

## 4. Conceito de Área de Estudo

### 4.1. Delimitação Geográfica

| Campo | Valor |
|-------|-------|
| **Região** | Médio Tejo, Portugal |
| **Critério principal** | Bacias hidrográficas completas |
| **Bacias incluídas** | Almonda + Alviela |
| **Área aproximada** | ~800 km² |

### 4.2. Limites Aproximados

- **Norte**: Ligeiramente acima de Tomar
- **Este**: Albufeira de Castelo de Bode
- **Sul**: Abrantes, Polje de Minde, Paul do Boquilobo
- **Oeste**: Definido pelas bacias hidrográficas

### 4.3. Diversidade Territorial

| Elemento | Localização | Potencial |
|----------|-------------|-----------|
| **Urbano** | Tomar, Abrantes | Urbanismo, acessibilidade |
| **Turismo** | Convento de Cristo, Castelo de Bode | Património, rotas |
| **Água** | Albufeira, Paul do Boquilobo (RAMSAR) | Hidrologia, qualidade água |
| **Geomorfologia** | Polje de Minde | Carso, inundações |
| **Agricultura** | Golegã, Boquilobo | Uso do solo, monitorização |
| **Riscos** | Toda a área | Erosão, cheias, incêndios |

### 4.4. Justificação das Escolhas

| Razão | Explicação |
|-------|------------|
| **Conhecimento local** | Área familiar, facilita validação e trabalho de campo |
| **Diversidade** | Urbano + rural + natural + água em área compacta |
| **Dados disponíveis** | Boa cobertura de dados abertos |
| **Relevância profissional** | Alinhado com trabalho em ordenamento do território |
| **Potencial de comunicação** | Projectos com interesse visual e narrativo |

---

## 5. Organização por Núcleos de Análise

### 5.1. Conceito

Em vez de analisar todo o território de forma homogénea, a área de estudo é organizada em **Núcleos de Análise** — zonas geográficas e temáticas onde as análises fazem mais sentido.

### 5.2. Núcleos Definidos

| Núcleo | Prefixo | Área Geográfica | Temas Principais |
|--------|---------|-----------------|------------------|
| 🌾 **Agrícola** | NA- | Golegã / Paul do Boquilobo | Agricultura, poluição difusa, biodiversidade |
| 💧 **Hídrico** | NH- | Bacias Almonda + Alviela + Castelo de Bode | Hidrologia, qualidade água, clima |
| 🏙️ **Urbano** | NU- | Tomar / Abrantes | Urbanismo, mobilidade, economia |
| 🕳️ **Cársico** | NC- | Polje de Minde | Geomorfologia, aquíferos, inundação |
| 🌲 **Florestal/Riscos** | NF- | Toda a área | Floresta, incêndios, erosão, riscos naturais |
| 🏛️ **Turismo/Património** | NT- | Toda a área | Percursos, miradouros, modelos 3D |

### 5.3. Nomenclatura de IDs

| Prefixo | Significado | Exemplo |
|---------|-------------|---------|
| `NA-` | Núcleo Agrícola | NA-01 |
| `NH-` | Núcleo Hídrico | NH-01 |
| `NU-` | Núcleo Urbano | NU-01 |
| `NC-` | Núcleo Cársico | NC-01 |
| `NF-` | Núcleo Florestal/Riscos | NF-01 |
| `NT-` | Núcleo Turismo/Património | NT-01 |
| `PS-` | Projecto Standalone | PS-01 |
| `PB-` | Projecto Base | PB-01 |

### 5.4. Estatísticas do Backlog

| Categoria | Quantidade |
|-----------|------------|
| Anchor Projects | 5 |
| Projectos Base | 1 (PB-00) |
| Projectos Standalone | 5 |
| Camadas/Análises por Núcleo | ~80 |
| **Total** | ~90 projectos |

---

## 6. Anchor Projects

Os **Anchor Projects** são os projectos âncora do portfolio — os mais completos, diferenciadores e com maior potencial de comunicação.

| # | ID | Nome | Núcleo | Justificação |
|---|-----|------|--------|--------------|
| ⭐1 | **PS-07** | **Regeneração Pós-Fogo (Tese Mestrado)** | Florestal | Tese pessoal, série temporal 10 anos, análise multifactorial |
| ⭐2 | **PB-00** | **Caracterização Biofísica** | Base | Alimenta todos os outros, open data, GitHub, reproduzível |
| ⭐3 | **NU-00** | **Atlas Urbano Interactivo** | Urbano | Integra walkability, isócronas, viewshed, 3D |
| ⭐4 | **NA-00** | **Observatório Agrícola + RAMSAR** | Agrícola | Agricultura + conservação + água, dashboard |
| ⭐5 | **NF-00** | **Índice de Vulnerabilidade Global** | Riscos | Integra derrocadas, cheias, incêndios, erosão |

**Ver documento:** `12_ANCHOR_PROJECTS.md` para descrição completa.

---

## 7. Resumo das Decisões Principais

### 7.1. Stack Técnico

| Decisão | Escolha | Alternativas Rejeitadas |
|---------|---------|-------------------------|
| Base de dados | PostGIS | MongoDB, GeoServer |
| Vector tiles | Martin | pg_tileserv |
| Raster tiles | TiTiler | QGIS Server |
| API | FastAPI | Flask, Django |
| Análise hidrológica | richdem + pysheds | GRASS GIS |
| Séries temporais | Google Earth Engine | SNAP local |

### 7.2. Área de Estudo

| Decisão | Escolha | Razão |
|---------|---------|-------|
| Limite principal | Bacias hidrográficas | Análise hidrológica fechada |
| Organização | Núcleos de Análise | Foco onde faz sentido |
| Prioridade | PB-00 primeiro | Base para tudo o resto |

### 7.3. Comunicação

| Decisão | Escolha | Razão |
|---------|---------|-------|
| Site estático | Hugo | Rápido, Markdown, themes |
| Língua | Português (código inglês) | Público local, SEO |
| Domínio | Pessoal (nome.pt) | Versátil a longo prazo |
| Frequência | 1-2 posts/semana | Consistência sem burnout |
| Licença dados | CC BY 4.0 | Uso livre com atribuição |
| Licença código | MIT | Permissiva, standard |

---

## 8. Portfolio e Comunicação

### 8.1. Objectivo

Transformar **trabalho técnico em visibilidade profissional**, criando uma presença online coerente que demonstre competências e atraia oportunidades.

### 8.2. Princípios de Comunicação

| Princípio | Descrição |
|-----------|-----------|
| **Consistência** | Publicar regularmente, não em rajadas |
| **Qualidade > Quantidade** | Menos posts, mas bem trabalhados |
| **Storytelling** | Contar histórias, não só mostrar mapas |
| **Valor primeiro** | Dar antes de pedir (dados abertos, tutoriais) |
| **Autenticidade** | Mostrar processo, incluindo dificuldades |

### 8.3. Públicos-Alvo

| Público | Onde está | O que quer ver |
|---------|-----------|----------------|
| **Recrutadores** | LinkedIn | Portfolio, competências, projectos |
| **Técnicos GIS** | LinkedIn, blogs | Tutoriais, código, metodologias |
| **Investigadores** | ResearchGate, blogs | Dados abertos, metodologias |
| **Autarquias** | Email, LinkedIn | Soluções práticas, demonstrações |
| **Público geral** | Redes sociais | Mapas bonitos, histórias locais |

### 8.4. Arquitectura de Presença Online

```
meudominio.pt/
│
├── /                    Landing page (Hugo)
│   ├── Quem sou
│   ├── O que faço
│   └── Links para secções
│
├── /blog                Artigos técnicos (Hugo)
│   ├── Tutoriais
│   ├── Projectos explicados
│   └── Reflexões
│
├── /portfolio           Showcase de projectos (Hugo)
│   ├── Lista de projectos
│   ├── Screenshots/vídeos
│   └── Links para demos
│
├── /webgis              Aplicações interactivas
│   ├── /hidrologia
│   ├── /agricultura
│   └── /acessibilidade
│
└── /cv                  CV interactivo ou PDF
```

### 8.5. Tecnologias de Comunicação

| Componente | Tecnologia | Razão |
|------------|------------|-------|
| Site estático | Hugo | Rápido, Markdown, themes bonitos |
| Theme Hugo | PaperMod / Stack / Congo | Clean, profissional |
| Hosting | GitHub Pages ou Netlify | Grátis, fácil deploy |
| WebGIS | Leaflet + HTML/JS | Simples, leve |
| Mapas no blog | Screenshots + links | Não sobrecarregar |

### 8.6. LinkedIn - Optimização

**Headline sugerido:**
```
GIS Analyst | Spatial Data | Python | Remote Sensing | Open Data
```

**Featured section:**
- Link para portfolio
- Post com mais engagement
- Artigo mais relevante

### 8.7. Métricas de Sucesso (6-12 meses)

| Canal | Métrica | Objectivo |
|-------|---------|-----------|
| **LinkedIn** | Seguidores | +500 |
| **LinkedIn** | Impressões/post | >1000 |
| **Blog** | Visitas/mês | >500 |
| **Blog** | Artigos publicados | >15 |
| **Portfolio** | Projectos | >10 |
| **GitHub** | Stars (total) | >50 |
| **Profissional** | Contactos recrutadores | >5 |
| **Profissional** | Colaborações autarquias | >1 |

---

## 9. Fluxo de Trabalho

### 9.1. Fluxo por Projecto Concluído

```
┌─────────────────┐
│    PROJECTO     │
│    CONCLUÍDO    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐     
│    LinkedIn     │ ←── Dia 1: Resumo visual, 1-2 imagens
│    Post         │     
└────────┬────────┘     
         │
         │ 2-3 dias depois
         ▼
┌─────────────────┐
│    Artigo       │ ←── Explicação técnica, processo
│    Blog         │
└────────┬────────┘
         │
         │ Mesmo dia
         ▼
┌─────────────────┐
│    Entrada      │ ←── Screenshot, link, descrição curta
│    Portfolio    │
└────────┬────────┘
         │
         │ Se aplicável
         ▼
┌─────────────────┐
│    WebGIS       │ ←── Demo interactiva
│    Demo         │
└────────┬────────┘
         │
         │ Se relevante
         ▼
┌─────────────────┐
│    Contacto     │ ←── Autarquias, entidades
│    Externo      │
└─────────────────┘
```

### 9.2. Template followup.md

Cada projecto terá um ficheiro `followup.md` com:
- Checklist de publicação
- Rascunho de post LinkedIn
- Estrutura de artigo blog
- Entrada para portfolio
- Contactos externos (se aplicável)

### 9.3. Timing de Publicação

| Acção | Quando | Duração |
|-------|--------|---------|
| LinkedIn post | Dia 1 | 30-60 min |
| Artigo blog | Dia 2-4 | 2-4 horas |
| Portfolio entry | Com artigo | 15 min |
| WebGIS deploy | Antes do post | Já feito |
| Contacto externo | Dia 5-7 | 30 min |

### 9.4. Frequência Ideal

| Canal | Frequência | Notas |
|-------|------------|-------|
| LinkedIn | 1-2x/semana | Qualidade > quantidade |
| Blog | 2-4x/mês | Artigos substanciais |
| Portfolio | Por projecto | Sempre que há novo |
| GitHub | Contínuo | Commits regulares |

### 9.5. O que fazer no GEE (Google Earth Engine)

| Tarefa | Razão |
|--------|-------|
| Séries temporais longas | GEE processa nos servidores deles |
| SAR (Sentinel-1) | Evita instalar SNAP |
| Timelapses | Ferramenta nativa do GEE |
| NDVI/NDWI histórico | Acesso fácil a arquivo Sentinel-2/Landsat |

---

## 10. Documentos Relacionados

### 10.1. Documentação Técnica

| Documento | Conteúdo |
|-----------|----------|
| `01_STACK_TECNICO.md` | Detalhe de containers, bibliotecas, configurações |
| `02_ESTRUTURA_FICHEIROS.md` | Estrutura completa de directórios |
| `03_AREA_ESTUDO.md` | Delimitação detalhada e justificação |

### 10.2. Backlog e Projectos

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de ~90 projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | PB-00 - Caracterização biofísica |
| `06_NUCLEO_AGRICOLA.md` | NA-00 a NA-12 |
| `07_NUCLEO_HIDRICO.md` | NH-01 a NH-15 |
| `08_NUCLEO_URBANO.md` | NU-00 a NU-21 |
| `09_NUCLEO_CARSICO.md` | NC-00 a NC-05 |
| `10_NUCLEO_FLORESTAL_RISCOS.md` | NF-00 a NF-XX |
| `11_NUCLEO_TURISMO_PATRIMONIO.md` | NT-00 a NT-XX |

### 10.3. Referência e Planeamento

| Documento | Conteúdo |
|-----------|----------|
| `12_ANCHOR_PROJECTS.md` | Detalhe dos 5 projectos âncora |
| `13_BIBLIOGRAFIA.md` | Referências e metodologias |
| `14_DADOS_NECESSARIOS.md` | Lista de dados e fontes |
| `15_PROXIMOS_PASSOS.md` | Roadmap detalhado |
| `16_GLOSSARIO_DECISOES.md` | Resumo de todas as decisões |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |
| 2025-01-28 | 2.0 | Fusão com 08_PORTFOLIO_COMUNICACAO.md, reorganização por Núcleos de Análise, actualização de nomenclatura |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
