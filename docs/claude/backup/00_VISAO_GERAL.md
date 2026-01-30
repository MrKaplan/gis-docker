# 00 - VISÃO GERAL DO PROJECTO

## Índice
1. [Contexto e Motivação](#1-contexto-e-motivação)
2. [Objectivos](#2-objectivos)
3. [Infraestrutura Base](#3-infraestrutura-base)
4. [Conceito de Área de Estudo](#4-conceito-de-área-de-estudo)
5. [Abordagem por Zonas Temáticas](#5-abordagem-por-zonas-temáticas)
6. [Resumo das Decisões Principais](#6-resumo-das-decisões-principais)
7. [Fluxo de Trabalho e Comunicação](#7-fluxo-de-trabalho-e-comunicação)
8. [Documentos Relacionados](#8-documentos-relacionados)

---

## 1. Contexto e Motivação

### 1.1. Perfil Profissional

O autor deste projecto é um **profissional freelance de SIG em Portugal**, especializado em:
- Planeamento territorial
- Avaliação de impacto ambiental
- Análise de condicionantes legais

Actualmente em transição de uma função de **Técnico SIG** (focado em produção cartográfica) para **Analista SIG / Analista de Dados Espaciais** (com ênfase em análise técnica e apoio à decisão).

### 1.2. Motivação

Este projecto serve múltiplos propósitos:

| Objectivo | Descrição |
|-----------|-----------|
| **Capacitação técnica** | Familiarização com stack tecnológico moderno (Docker, APIs, cloud) |
| **Portfolio profissional** | Demonstração de capacidades através de projectos concretos |
| **Aprendizagem contínua** | Domínio de processos de análise espacial avançada |
| **Visibilidade profissional** | Produção de conteúdo para blog, LinkedIn e GitHub |

### 1.3. Princípios Orientadores

- **Custo zero**: Uso exclusivo de software e plataformas free/open source
- **Reprodutibilidade**: Tudo versionado em Git, scripts parametrizáveis
- **Open Data**: Disponibilização de dados e código para a comunidade
- **Documentação**: Processo completamente documentado

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

1. Processamento raster (NDVI, NDWI, índices espectrais)
2. Análise hidrológica (bacias, flow accumulation, TWI)
3. Análise de redes (isócronas, routing, acessibilidade)
4. Séries temporais (monitorização, change detection)
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

| Container | Base | Função |
|-----------|------|--------|
| **postgis** | PostgreSQL oficial + PostGIS + pgRouting | Base de dados espacial |
| **qgis-server** | Ubuntu + QGIS Server | WMS/WFS/WCS |
| **martin** | Martin oficial | Vector tiles |
| **pg-tileserv** | CrunchyData | Vector tiles + funções SQL |
| **titiler** | Python + TiTiler | COG/STAC tiles dinâmicos |
| **python-api** | Python slim + FastAPI | APIs custom |
| **jupyter** | JupyterLab | Prototipagem e análise |
| **nginx** | Nginx oficial | Reverse proxy + SSL |
| **cron** | Alpine + Python | Tarefas agendadas |
| **redis** | Redis oficial | Cache (opcional) |

### 3.3. Bibliotecas Python Principais

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

### 3.4. Extensões PostGIS

```sql
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_raster;
CREATE EXTENSION pgrouting;
CREATE EXTENSION pg_cron;
```

### 3.5. Considerações de Performance

| Aspecto | Consideração | Mitigação |
|---------|--------------|-----------|
| **RAM** | QGIS Server e Jupyter podem ser exigentes | Usar Docker Compose Profiles para levantar apenas o necessário |
| **Disco** | 50GB desaparecem rápido com raster | Processar via STAC/COG on-the-fly, não armazenar dados brutos |
| **IOPS** | Armazenamento Oracle tem limites | Usar índices GiST, CLUSTER, cache no Nginx |
| **Conexões** | Pool de conexões PostgreSQL (limite 100) | Gerir bem conexões com FastAPI assíncrono |

### 3.6. Recomendações Técnicas

- **Tiles**: Preferir MVT (Martin) sobre WMS (QGIS Server) — mais leve
- **SSL**: Usar Certbot ou Nginx Proxy Manager para Let's Encrypt automático
- **Monitorização**: Adicionar Netdata ou Portainer para observabilidade
- **CI/CD**: GitHub Actions para deployment automático
- **Manutenção BD**: pg_cron para VACUUM e refresh de Materialized Views

---

## 4. Conceito de Área de Estudo

### 4.1. Delimitação Geográfica

**Região**: Médio Tejo, Portugal

**Limites aproximados**:
- **Norte**: Ligeiramente acima de Tomar (para não cortar a cidade)
- **Este**: Albufeira de Castelo de Bode
- **Sul**: Abrantes, Polje de Minde, Paul do Boquilobo
- **Oeste**: A definir com base nas bacias hidrográficas

### 4.2. Bacias Hidrográficas Incluídas

A área foi delimitada com base em **2 bacias hidrográficas completas**:

| Bacia | Características | Interesse |
|-------|-----------------|-----------|
| **Almonda** | Nasce nas grutas (sistema cársico), passa por Torres Novas | Carso, nascentes |
| **Alviela** | Sistema cársico, abastecimento histórico de Lisboa | Carso, património |

**Justificação**: Ter bacias completas permite análises hidrológicas "fechadas".

### 4.3. Diversidade Territorial

| Elemento | Localização | Potencial de Análise |
|----------|-------------|---------------------|
| **Urbano** | Tomar, Abrantes | Urbanismo, acessibilidade, mobilidade |
| **Turismo** | Convento de Cristo, Castelo de Bode | Património, rotas, miradouros |
| **Água** | Albufeira, Paul do Boquilobo (Ramsar), rios | Hidrologia, qualidade água, reservatórios |
| **Geomorfologia** | Polje de Minde | Carso, inundações sazonais |
| **Agricultura** | Golegã, Boquilobo | Uso do solo, poluição difusa |
| **Riscos** | Toda a área | Erosão, cheias, incêndios |

---

## 5. Abordagem por Zonas Temáticas

### 5.1. Conceito

Em vez de analisar todo o território de forma homogénea, a abordagem é por **zonas onde as análises fazem mais sentido**.

**Nomes alternativos para "clusters"** (a escolher):
- Núcleos Temáticos
- Zonas de Análise
- Áreas de Foco
- Domínios Territoriais

### 5.2. Zonas Identificadas

```
Área de Estudo Global (Médio Tejo)
│
├── 🌾 ZONA AGRÍCOLA (Golegã / Paul do Boquilobo)
│   ├── Solos e capacidade de uso
│   ├── Ocupação agrícola temporal
│   ├── Stress hídrico (NDVI)
│   ├── Poluição difusa potencial
│   ├── Erosão
│   ├── Biodiversidade
│   └── Turismo e percursos pedestres
│
├── 💧 ZONA HÍDRICA (Bacias Almonda + Alviela + Castelo de Bode)
│   ├── Caracterização biofísica (PROJECTO BASE)
│   ├── Rede hidrográfica hierarquizada
│   ├── Bacias e sub-bacias (derivadas LiDAR)
│   ├── Zonas inundáveis
│   ├── Eutrofização temporal
│   ├── Reservatórios (Castelo de Bode)
│   └── Upstream/Downstream interactivo
│
├── 🏙️ ZONA URBANA (Tomar / Abrantes)
│   ├── Stormwater runoff (LiDAR)
│   ├── Erosão urbana
│   ├── Acessibilidade a serviços
│   ├── Walkability
│   └── Análise imobiliária / viewshed
│
├── 🗻 ZONA CÁRSICA (Polje de Minde)
│   ├── Inundação histórica (StoryMap)
│   ├── Geomorfologia
│   └── Biodiversidade
│
└── 📊 PROJECTO BASE: Caracterização Biofísica
    └── Alimenta todas as outras zonas
```

---

## 6. Resumo das Decisões Principais

### 6.1. O que INCLUIR no Stack

| Componente | Razão |
|------------|-------|
| ✅ TiTiler | Servir COG/STAC on-the-fly sem armazenar rasters |
| ✅ pgRouting | Análise de redes (isócronas, routing) |
| ✅ Redis | Cache para tiles e queries (opcional mas útil) |
| ✅ Hugo/Jekyll | Site estático para portfolio, blog, CV |
| ✅ earthengine-api | Processamento pesado no GEE, não local |

### 6.2. O que NÃO INCLUIR no Stack

| Componente | Razão |
|------------|-------|
| ❌ GRASS GIS | Pesado; usar bibliotecas Python equivalentes (richdem, pysheds) |
| ❌ SNAP/ESA | 8GB só para SAR; usar GEE para Sentinel-1 |
| ❌ R | Focar em Python; R faz o mesmo mas dispersa esforço |
| ❌ pg_trgm | Desnecessário para este projecto |
| ❌ TimescaleDB | Não temos milhões de leituras por segundo |

### 6.3. O que fazer no DESKTOP (não no servidor)

| Tarefa | Razão |
|--------|-------|
| HEC-HMS / HEC-RAS | Software standalone com GUI; aprender primeiro no PC |
| Prototipagem QGIS | Exploração inicial antes de automatizar |
| Processamento LiDAR pesado | Pode ser demasiado para 2 OCPUs |

### 6.4. O que fazer no GEE (Google Earth Engine)

| Tarefa | Razão |
|--------|-------|
| Séries temporais longas | GEE processa nos servidores deles |
| SAR (Sentinel-1) | Evita instalar SNAP |
| Timelapses | Ferramenta nativa do GEE |
| NDVI/NDWI histórico | Acesso fácil a arquivo Sentinel-2/Landsat |

---

## 7. Fluxo de Trabalho e Comunicação

### 7.1. Fluxo por Projecto Concluído

```
Projecto concluído
      ↓
Post LinkedIn (resumo visual, 1-2 imagens)
      ↓
Artigo blog (explicação técnica, processo, resultados)
      ↓
Entrada no portfolio (screenshot, link, descrição curta)
      ↓
WebGIS (se aplicável, demo interactiva)
```

### 7.2. Arquitectura de Presença Online

```
teudominio.pt/
├── / (landing page estática - Hugo)
│   ├── Quem sou
│   ├── O que faço
│   └── Links para subsecções
│
├── /blog (Hugo - Markdown)
│   ├── Artigos técnicos
│   ├── Projectos explicados
│   └── Tutoriais
│
├── /portfolio (Hugo)
│   ├── Lista de projectos
│   ├── Screenshots/vídeos
│   └── Links para demos
│
├── /webgis (anchor projects)
│   ├── reservatorios.dominio.pt
│   ├── polje.dominio.pt
│   ├── acessibilidade.dominio.pt
│   └── ...
│
└── /cv
    └── CV interactivo ou PDF
```

### 7.3. Template followup.md

Cada projecto terá um ficheiro `followup.md` com:
- Checklist de publicação
- Rascunho de post LinkedIn
- Estrutura de artigo blog
- Entrada para portfolio
- Contactos externos (se aplicável)

Ver documento `08_PORTFOLIO_COMUNICACAO.md` para template completo.

---

## 8. Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `01_STACK_TECNICO.md` | Detalhe de containers, bibliotecas, configurações |
| `02_ESTRUTURA_PASTAS.md` | Estrutura completa de directórios |
| `03_AREA_ESTUDO.md` | Delimitação detalhada e justificação |
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos e prioridades |
| `05_PROJECTO_BASE_BIOFISICO.md` | Caracterização biofísica (projecto prioritário) |
| `06_TEMA1_AGRICULTURA.md` | Projectos do tema agricultura |
| `07_TEMA2_AGUA.md` | Projectos do tema água/hidrologia |
| `08_PORTFOLIO_COMUNICACAO.md` | Estratégia de comunicação |
| `09_IDEIAS_PENDENTES.md` | Ideias por processar |
| `10_PROXIMOS_PASSOS.md` | Roadmap e prioridades |
| `11_GLOSSARIO_DECISOES.md` | Resumo rápido de todas as decisões |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial com consolidação de toda a conversa |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
