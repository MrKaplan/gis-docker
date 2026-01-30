# 15 - PRÓXIMOS PASSOS E ROADMAP

## Índice
1. [Visão Geral do Plano](#1-visão-geral-do-plano)
2. [Fase 0: Preparação](#2-fase-0-preparação)
3. [Fase 1: Fundações](#3-fase-1-fundações)
4. [Fase 2: Tese + Projectos](#4-fase-2-tese--projectos)
5. [Fase 3: Expansão](#5-fase-3-expansão)
6. [Fase 4: Consolidação](#6-fase-4-consolidação)
7. [Cronograma Visual](#7-cronograma-visual)
8. [Checklists Detalhadas](#8-checklists-detalhadas)
9. [Dependências e Ordem](#9-dependências-e-ordem)
10. [Riscos e Mitigação](#10-riscos-e-mitigação)
11. [Marcos e Celebrações](#11-marcos-e-celebrações)
12. [Métricas de Sucesso](#12-métricas-de-sucesso)
13. [Plano de Comunicação](#13-plano-de-comunicação)
14. [Revisões e Ajustes](#14-revisões-e-ajustes)

---

## 1. Visão Geral do Plano

### 1.1. Horizonte Temporal

```
                    2025                              2026
    ┌───────┬───────┬───────┬───────┬───────┬───────┬───────┐
    │ Mês 1 │ Mês 2 │ Mês 3 │ Mês 4 │ Mês 5 │ Mês 6 │ Mês 7+│
    ├───────┴───────┼───────┴───────┼───────┴───────┼───────┤
    │    FASE 1     │    FASE 2     │    FASE 3     │FASE 4 │
    │  Fundações    │ Tese+Projectos│   Expansão    │Consol.│
    └───────────────┴───────────────┴───────────────┴───────┘
          ↑
      FASE 0
    (1 semana)
```

| Fase | Período | Foco Principal | Entregáveis Chave |
|------|---------|----------------|-------------------|
| **0** | Semana 1 | Preparação | VM, decisões, dados |
| **1** | Mês 1-2 | Fundações | Stack + PB-00 |
| **2** | Mês 3-4 | Tese + Projectos | PS-07 + 4 projectos |
| **3** | Mês 5-6 | Expansão | Dashboards + automação |
| **4** | Mês 7+ | Consolidação | Tese + publicações |

### 1.2. Princípios Orientadores

```
╔══════════════════════════════════════════════════════════════╗
║                    PRINCÍPIOS DO PROJECTO                    ║
╠══════════════════════════════════════════════════════════════╣
║ 1. ENTREGAR CEDO     Valor visível rapidamente               ║
║ 2. ITERAR            Melhorar com feedback                   ║
║ 3. DOCUMENTAR        O "eu" do futuro agradece               ║
║ 4. COMUNICAR         Cada passo é conteúdo                   ║
║ 5. TESE PRIMEIRO     PS-07 é prioridade máxima               ║
╚══════════════════════════════════════════════════════════════╝
```

### 1.3. Cenários de Tempo Disponível

| Cenário | Horas/Semana | Ajuste de Duração |
|---------|--------------|-------------------|
| **Part-time leve** | 5-10h | Fases ×2 |
| **Part-time médio** | 10-15h | Conforme planeado |
| **Intensivo** | 20h+ | Fases ÷2 |
| **Full-time (tese)** | 30-40h | Acelerar significativamente |

### 1.4. Prioridade dos Anchor Projects

| # | Anchor | Duração | Razão |
|---|--------|---------|-------|
| ⭐1 | **PS-07** Regeneração Pós-Fogo (TESE) | 12 meses | Requisito académico |
| ⭐2 | **PB-00** Caracterização Biofísica | 4-6 semanas | Base para ~90 projectos |
| ⭐3 | **NU-00** Atlas Urbano Interactivo | 4-6 semanas | Dashboard diferenciador |
| ⭐4 | **NA-00** Observatório Agrícola | 4-6 semanas | Automação demonstrada |
| ⭐5 | **NF-00** Índice Vulnerabilidade Global | 3-4 semanas | Integração multi-risco |

---

## 2. Fase 0: Preparação

**Duração:** 1 semana
**Objectivo:** Decisões finais + ambiente pronto

### 2.1. Decisões a Tomar

| Decisão | Opções | Recomendação | Status |
|---------|--------|--------------|--------|
| Nome das zonas | Núcleos / Zonas / Áreas | **Núcleos de Análise** | ⬜ |
| Resolução MDT dev | 2m / 5m | **5m** (2m para output) | ⬜ |
| Língua do site | PT / EN / Bilingue | **PT** (código EN) | ⬜ |
| Domínio | Pessoal / Projecto | **Pessoal** | ⬜ |

### 2.2. Tarefas da Semana 0

```
SEMANA 0: PREPARAÇÃO
│
├── 📋 DECISÕES
│   ├── [ ] Tomar decisões da tabela acima
│   ├── [ ] Documentar no 11_GLOSSARIO_DECISOES.md
│   └── [ ] Confirmar área de estudo final
│
├── 💻 AMBIENTE LOCAL
│   ├── [ ] Instalar Docker Desktop
│   ├── [ ] Instalar VS Code + extensões
│   │       ├── Python
│   │       ├── Docker
│   │       ├── Remote SSH
│   │       └── GitLens
│   ├── [ ] Configurar Git (nome, email)
│   ├── [ ] Criar conta GitHub (se necessário)
│   └── [ ] Criar repositório inicial
│
├── ☁️ ORACLE CLOUD
│   ├── [ ] Criar conta Oracle Cloud
│   ├── [ ] Activar Free Tier
│   ├── [ ] Provisionar VM ARM
│   │       ├── Shape: VM.Standard.A1.Flex
│   │       ├── 2 OCPU, 12GB RAM
│   │       └── 50GB boot volume
│   ├── [ ] Configurar SSH key
│   ├── [ ] Configurar firewall
│   │       ├── Porta 22 (SSH)
│   │       ├── Porta 80 (HTTP)
│   │       └── Porta 443 (HTTPS)
│   └── [ ] Testar conexão SSH
│
├── 🗺️ ÁREA DE ESTUDO
│   ├── [ ] Abrir QGIS
│   ├── [ ] Carregar bacias APA
│   ├── [ ] Delimitar área de estudo
│   ├── [ ] Exportar extent.geojson
│   └── [ ] Identificar folhas LiDAR necessárias
│
└── 📥 DADOS
    ├── [ ] Registar no portal DGT
    ├── [ ] Iniciar download MDT LiDAR
    ├── [ ] Download CAOP 2023
    ├── [ ] Download COS 2018
    └── [ ] Download áreas ardidas ICNF
```

### 2.3. Entregas da Fase 0

| Entrega | Critério de Aceitação |
|---------|----------------------|
| ✅ Decisões documentadas | Todas as opções decididas |
| ✅ VM Oracle Cloud | SSH funcional |
| ✅ Área de estudo | `extent.geojson` criado |
| ✅ Downloads iniciados | MDT a descarregar |
| ✅ Repositório Git | Commit inicial feito |

---

## 3. Fase 1: Fundações

**Duração:** 6-8 semanas (Mês 1-2)
**Objectivo:** Stack funcional + Projecto Base (PB-00)

### 3.1. Semana 1-2: Setup do Stack

```
SEMANA 1-2: DOCKER STACK
│
├── 📦 DOCKER COMPOSE BASE
│   ├── [ ] Criar docker-compose.yml
│   ├── [ ] Configurar PostGIS container
│   │       ├── PostgreSQL 16 + PostGIS 3.4
│   │       ├── pgRouting
│   │       └── pg_cron
│   ├── [ ] Configurar Nginx container
│   ├── [ ] Testar conexão BD
│   └── [ ] Commit: "feat: initial docker stack"
│
├── 🔧 SERVIÇOS ADICIONAIS
│   ├── [ ] Adicionar Martin (vector tiles)
│   ├── [ ] Adicionar FastAPI (python-api)
│   ├── [ ] Adicionar JupyterLab
│   ├── [ ] Testar cada serviço
│   └── [ ] Documentar portas e endpoints
│
├── 🔐 NGINX + SSL
│   ├── [ ] Configurar reverse proxy
│   ├── [ ] Instalar Certbot
│   ├── [ ] Gerar certificados Let's Encrypt
│   ├── [ ] Testar HTTPS
│   └── [ ] Configurar auto-renovação
│
└── 📝 DOCUMENTAÇÃO
    ├── [ ] README.md do repositório
    ├── [ ] Diagrama de arquitectura
    └── [ ] Notas de setup
```

**Entrega Semana 2:** Stack básico em `https://dominio.pt`

### 3.2. Semana 3-4: PB-00 Terreno

```
SEMANA 3-4: DERIVADOS DE TERRENO
│
├── 📥 PRÉ-PROCESSAMENTO MDT
│   ├── [ ] Upload MDT para servidor
│   ├── [ ] Criar mosaico das folhas
│   ├── [ ] Recortar pela área de estudo
│   ├── [ ] Verificar qualidade (nodata, valores)
│   └── [ ] Criar versão 5m para desenvolvimento
│
├── 🏔️ DERIVADOS TOPOGRÁFICOS
│   ├── [ ] Slope (graus e %)
│   ├── [ ] Aspect (exposição)
│   ├── [ ] Hillshade
│   ├── [ ] Curvature
│   ├── [ ] TRI (rugosidade)
│   ├── [ ] TPI (posição topográfica)
│   └── [ ] Contours (curvas de nível)
│
├── 💧 ÍNDICES HIDROLÓGICOS
│   ├── [ ] TWI (Topographic Wetness Index)
│   └── [ ] Verificar valores
│
├── 🗜️ OPTIMIZAÇÃO
│   ├── [ ] Converter para COG
│   ├── [ ] Verificar overviews
│   └── [ ] Testar acesso via range requests
│
└── ✅ VALIDAÇÃO
    ├── [ ] Verificar estatísticas (min/max/mean)
    ├── [ ] Visualizar em QGIS
    ├── [ ] Comparar com dados de referência
    └── [ ] Documentar métricas de qualidade
```

**Entrega Semana 4:** 15 camadas de terreno derivadas

### 3.3. Semana 5-6: PB-00 Hidrologia

```
SEMANA 5-6: DERIVADOS HIDROLÓGICOS
│
├── 🌊 PROCESSAMENTO HIDROLÓGICO
│   ├── [ ] Fill pits (pysheds)
│   ├── [ ] Fill depressions
│   ├── [ ] Resolve flats
│   ├── [ ] Flow direction (D8)
│   └── [ ] Flow accumulation
│
├── 🏞️ REDE DE DRENAGEM
│   ├── [ ] Extrair rede (threshold)
│   ├── [ ] Calcular ordem Strahler
│   ├── [ ] Vectorizar rede
│   └── [ ] Atribuir hierarquia
│
├── 📐 BACIAS HIDROGRÁFICAS
│   ├── [ ] Identificar pour points
│   ├── [ ] Delimitar bacias principais
│   ├── [ ] Delimitar sub-bacias
│   └── [ ] Calcular áreas
│
├── 🗃️ PUBLICAÇÃO
│   ├── [ ] Carregar vectors para PostGIS
│   ├── [ ] Configurar Martin para tiles
│   ├── [ ] Criar viewer Leaflet básico
│   └── [ ] Testar visualização
│
├── 📝 DOCUMENTAÇÃO
│   ├── [ ] README do projecto
│   ├── [ ] Data dictionary
│   ├── [ ] Metodologia
│   └── [ ] Quality report
│
└── 📣 COMUNICAÇÃO
    ├── [ ] Primeiro post LinkedIn
    ├── [ ] Criar entrada no portfolio
    └── [ ] Publicar dados no GitHub
```

### 3.4. Entregas Fase 1

| Entrega | Critério | Data |
|---------|----------|------|
| ✅ Stack Docker | Todos os serviços online | Sem 2 |
| ✅ SSL configurado | HTTPS funcional | Sem 2 |
| ✅ PB-00 Terreno | 15 camadas derivadas | Sem 4 |
| ✅ PB-00 Hidrologia | Bacias + rede + viewer | Sem 6 |
| ✅ Primeiro post LinkedIn | Publicado | Sem 6 |
| ✅ Código no GitHub | Repo público | Sem 6 |

---

## 4. Fase 2: Tese + Projectos

**Duração:** 8 semanas (Mês 3-4)
**Objectivo:** Avançar tese + 4 projectos completos

### 4.1. Trabalho Contínuo: PS-07 (Tese)

```
TESE: REGENERAÇÃO PÓS-FOGO (contínuo)
│
├── 📚 MÊS 1-2: REVISÃO BIBLIOGRÁFICA
│   ├── [ ] Recolher literatura sobre regeneração
│   ├── [ ] Metodologias NBR/dNBR
│   ├── [ ] Casos de estudo Portugal
│   └── [ ] Definir framework conceptual
│
├── 🗺️ MÊS 3: PREPARAÇÃO DADOS
│   ├── [ ] Seleccionar áreas ardidas (>100ha, 2013-2023)
│   ├── [ ] Download perímetros ICNF
│   ├── [ ] Preparar colecções GEE
│   │       ├── Sentinel-2 (2015-2025)
│   │       └── Landsat 8/9 (2013-2025)
│   └── [ ] Definir áreas de controlo
│
├── 🔬 MÊS 4-5: PROCESSAMENTO GEE
│   ├── [ ] Scripts para extracção temporal
│   ├── [ ] Cálculo NDVI/NBR mensal
│   ├── [ ] Cálculo dNBR severidade
│   ├── [ ] Trajectórias de recuperação
│   └── [ ] Export resultados
│
├── 📊 MÊS 6-7: ANÁLISE ESTATÍSTICA
│   ├── [ ] Tempo de recuperação (50%, 80%, 100%)
│   ├── [ ] Factores explicativos
│   │       ├── Severidade
│   │       ├── Uso do solo pré-fogo
│   │       ├── Topografia
│   │       └── Clima pós-fogo
│   ├── [ ] Modelação (Random Forest)
│   └── [ ] Validação cruzada
│
├── 🌐 MÊS 8: WEBGIS
│   ├── [ ] Dashboard interactivo
│   ├── [ ] Selecção de áreas ardidas
│   ├── [ ] Gráficos temporais
│   └── [ ] Download de dados
│
├── 📝 MÊS 9-11: DISSERTAÇÃO
│   ├── [ ] Escrita dos capítulos
│   ├── [ ] Figuras e tabelas
│   ├── [ ] Revisão
│   └── [ ] Formatação final
│
└── 🎓 MÊS 12: DEFESA
    ├── [ ] Preparar apresentação
    ├── [ ] Ensaiar
    └── [ ] Defesa pública
```

### 4.2. Projectos Paralelos (Mês 3-4)

```
SEMANA 9-10: NH-09 UPSTREAM/DOWNSTREAM
│
├── [ ] Implementar API FastAPI
│   ├── GET /api/upstream?lat=&lon=
│   └── GET /api/downstream?lat=&lon=
├── [ ] Funções pysheds para trace
├── [ ] Frontend Leaflet interactivo
├── [ ] Cache de resultados (Redis/memory)
└── [ ] LinkedIn post + artigo blog

---

SEMANA 11-12: NU-05/08 ISÓCRONAS + WALKSHED
│
├── [ ] Importar OSM para pgRouting
├── [ ] Criar função isochrone
├── [ ] Criar função walkshed
├── [ ] Dashboard com mapa + stats
└── [ ] LinkedIn post

---

SEMANA 13-14: NC-00 STORYMAP POLJE
│
├── [ ] Séries temporais NDWI (GEE)
├── [ ] Correlação com precipitação
├── [ ] Criar narrativa StoryMap
├── [ ] Contactar Junta de Minde
└── [ ] LinkedIn post

---

SEMANA 15-16: PS-06 GEE TIMELAPSE
│
├── [ ] Escolher tema (expansão urbana?)
├── [ ] Script GEE para timelapse
├── [ ] Gerar GIF/vídeo
├── [ ] Publicar (muito visual!)
└── [ ] LinkedIn post
```

### 4.3. Entregas Fase 2

| Entrega | Critério | Data |
|---------|----------|------|
| ✅ PS-07 dados preparados | Colecções GEE prontas | Sem 10 |
| ✅ NH-09 Upstream/Downstream | API + WebGIS funcional | Sem 10 |
| ✅ NU-05/08 Isócronas | Dashboard operacional | Sem 12 |
| ✅ NC-00 StoryMap Polje | Narrativa completa | Sem 14 |
| ✅ PS-06 Timelapse | Vídeo publicado | Sem 16 |
| ✅ 4+ posts LinkedIn | Publicados | Contínuo |
| ✅ 2+ artigos blog | Publicados | Contínuo |
| ✅ Contacto autarquia | Email enviado | Sem 14 |

---

## 5. Fase 3: Expansão

**Duração:** 8 semanas (Mês 5-6)
**Objectivo:** Dashboards integrados + automação

### 5.1. Projectos da Fase 3

```
SEMANA 17-20: NA-00 OBSERVATÓRIO AGRÍCOLA
│
├── [ ] Integrar camadas agrícolas
│   ├── Parcelas IFAP
│   ├── Solos
│   ├── Capacidade de uso
│   └── COS
├── [ ] NDVI temporal (GEE)
├── [ ] Soil moisture (SMAP)
├── [ ] Dashboard integrado
├── [ ] Cronjob actualização diária
└── [ ] Contactar CM Golegã

---

SEMANA 21-22: NU-00 ATLAS URBANO
│
├── [ ] Integrar isócronas existentes
├── [ ] Adicionar food deserts
├── [ ] Adicionar healthcare access
├── [ ] Dashboard unificado
└── [ ] LinkedIn post

---

SEMANA 23-24: NT-05 ALDEIA 3D + IMPRESSÃO
│
├── [ ] Modelo 3D da aldeia
├── [ ] Preparar para impressão
├── [ ] Imprimir maquete
├── [ ] Contactar câmara
├── [ ] LinkedIn post (muito emocional!)
└── [ ] Artigo blog (tutorial)

---

SEMANA 25-26: NF-10 ACÁCIAS INVASORAS
│
├── [ ] Detecção por floração (Fev-Mar)
├── [ ] Validação de campo
├── [ ] Mapa de distribuição
├── [ ] Artigo blog
└── [ ] LinkedIn post
```

### 5.2. Entregas Fase 3

| Entrega | Critério | Data |
|---------|----------|------|
| ✅ NA-00 Observatório | Dashboard + automação | Sem 20 |
| ✅ NU-00 Atlas Urbano | Dashboard integrado | Sem 22 |
| ✅ NT-05 Aldeia 3D | Modelo impresso | Sem 24 |
| ✅ NF-10 Acácias | Mapa + artigo | Sem 26 |
| ✅ Contactos autarquias | 2+ municípios | Contínuo |
| ✅ 8+ posts LinkedIn (total) | Publicados | Contínuo |
| ✅ 4+ artigos blog (total) | Publicados | Contínuo |

---

## 6. Fase 4: Consolidação

**Duração:** Mês 7+ (contínuo)
**Objectivo:** Completar tese + portfolio + visibilidade

### 6.1. Actividades Contínuas

```
FASE 4: CONSOLIDAÇÃO
│
├── 🎓 TESE (prioridade máxima)
│   ├── [ ] Completar análise estatística
│   ├── [ ] Desenvolver WebGIS final
│   ├── [ ] Escrever dissertação
│   ├── [ ] Preparar defesa
│   └── [ ] Submeter artigo científico
│
├── 🗺️ COMPLETAR NÚCLEOS
│   ├── [ ] Núcleo Agrícola (restantes NA-*)
│   ├── [ ] Núcleo Hídrico (restantes NH-*)
│   ├── [ ] Núcleo Urbano (restantes NU-*)
│   ├── [ ] Núcleo Cársico (restantes NC-*)
│   ├── [ ] Núcleo Florestal (restantes NF-*)
│   └── [ ] Núcleo Turismo (restantes NT-*)
│
├── 📝 PUBLICAÇÕES
│   ├── [ ] Artigo científico (tese)
│   ├── [ ] Artigo técnico (metodologia)
│   └── [ ] 2-4 artigos blog/mês
│
├── 📣 COMUNICAÇÃO
│   ├── [ ] 1-2 posts LinkedIn/semana
│   ├── [ ] Actualizar portfolio
│   └── [ ] Networking eventos GIS
│
├── 🤝 COLABORAÇÕES
│   ├── [ ] Follow-up autarquias
│   ├── [ ] Propostas de colaboração
│   └── [ ] Projectos conjuntos
│
└── 🔄 NEWS ON GIS
    └── [ ] Projectos reactivos conforme oportunidades
```

### 6.2. Objectivos de Longo Prazo

| Objectivo | Prazo | Indicador de Sucesso |
|-----------|-------|---------------------|
| Tese defendida | 12 meses | Aprovação |
| Portfolio completo | 12 meses | 15+ projectos |
| Artigo publicado | 18 meses | Aceite em revista |
| Colaboração autárquica | 12 meses | 1+ projecto conjunto |
| Reconhecimento | 12 meses | Convite palestra |
| Oportunidade profissional | 12-18 meses | Proposta recebida |

---

## 7. Cronograma Visual

### 7.1. Gantt Simplificado (12 meses)

```
Mês:     1    2    3    4    5    6    7    8    9   10   11   12
        ├────┼────┼────┼────┼────┼────┼────┼────┼────┼────┼────┤
        
FASE 0  █
        
FASE 1  ████████
        
FASE 2            ████████
        
FASE 3                      ████████
        
FASE 4                                ████████████████████████

─────────────────────────────────────────────────────────────────
PROJECTOS:

PB-00   ████████
        (Biofísico)

PS-07   ████████████████████████████████████████████████████████
        (TESE - contínuo, prioridade máxima)

NH-09        ████
             (Upstream)

NU-05/08          ████
                  (Isócronas)

NC-00                  ████
                       (StoryMap)

NA-00                       ████████
                            (Observatório)

NU-00                             ████
                                  (Atlas)

NT-05                                  ████
                                       (3D)

NF-00                                       ████
                                            (Vulnerab.)
```

### 7.2. Cronograma Semanal (Primeiras 8 Semanas)

| Semana | Foco Principal | Entrega |
|--------|----------------|---------|
| 0 | Preparação | VM + decisões |
| 1 | Docker base | PostGIS + Nginx |
| 2 | Serviços | Martin + FastAPI + SSL |
| 3 | PB-00 Terreno | MDT processado |
| 4 | PB-00 Terreno | 15 camadas derivadas |
| 5 | PB-00 Hidrologia | Flow + rede |
| 6 | PB-00 Hidrologia | Bacias + publicação |
| 7 | PS-07 Prep | Dados + literatura |
| 8 | PS-07 + NH-09 | Início tese + API |

---

## 8. Checklists Detalhadas

### 8.1. Checklist Pré-Arranque

**Ambiente Local:**
- [ ] Docker Desktop instalado e a funcionar
- [ ] Git configurado (nome, email)
- [ ] VS Code com extensões
- [ ] Python 3.10+ instalado
- [ ] QGIS 3.x instalado

**Contas:**
- [ ] Conta GitHub
- [ ] Conta Oracle Cloud
- [ ] Conta Google (para GEE)
- [ ] Conta Copernicus Data Space

**Servidor:**
- [ ] VM Oracle Cloud provisionada
- [ ] SSH configurado
- [ ] Docker instalado no servidor
- [ ] Firewall configurado (22, 80, 443)

**Dados:**
- [ ] Área de estudo delimitada (`extent.geojson`)
- [ ] Folhas MDT identificadas
- [ ] Downloads iniciados (CAOP, COS, áreas ardidas)

**Documentação:**
- [ ] Todos os MDs lidos
- [ ] Decisões tomadas
- [ ] Dúvidas esclarecidas

### 8.2. Checklist Semanal (Template)

```markdown
## Semana [N] - [DD/MM] a [DD/MM]

### Objectivos da Semana
1. [ ] Objectivo 1
2. [ ] Objectivo 2
3. [ ] Objectivo 3

### Tarefas
- [ ] Tarefa 1
- [ ] Tarefa 2
- [ ] Tarefa 3

### Bloqueios
- Nenhum / Lista de bloqueios

### Notas
- Observações relevantes

### Próxima Semana
- Preview do que vem a seguir
```

### 8.3. Checklist de Projecto (Template)

```markdown
## [ID] - [Nome do Projecto]

### Pré-requisitos
- [ ] Dados X disponíveis
- [ ] Ferramenta Y instalada
- [ ] Projecto Z concluído

### Desenvolvimento
- [ ] Análise/processamento
- [ ] Validação
- [ ] Publicação

### Documentação
- [ ] README
- [ ] Data dictionary
- [ ] Metodologia

### Comunicação
- [ ] LinkedIn post
- [ ] Artigo blog (se aplicável)
- [ ] Portfolio entry
```

---

## 9. Dependências e Ordem

### 9.1. Diagrama de Dependências

```
                         ┌─────────────────┐
                         │   FASE 0        │
                         │   Preparação    │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │   STACK         │
                         │   Docker        │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │   PB-00         │
                         │   Biofísico     │
                         └────────┬────────┘
                                  │
         ┌────────────────┬───────┴───────┬────────────────┐
         │                │               │                │
         ▼                ▼               ▼                ▼
   ┌───────────┐   ┌───────────┐   ┌───────────┐   ┌───────────┐
   │   NH-*    │   │   NU-*    │   │   NA-*    │   │   NC-*    │
   │   Hídrico │   │   Urbano  │   │   Agrícola│   │   Cársico │
   └─────┬─────┘   └─────┬─────┘   └─────┬─────┘   └─────┬─────┘
         │               │               │                │
         └───────────────┴───────┬───────┴────────────────┘
                                 │
                                 ▼
                         ┌─────────────────┐
                         │   NF-00         │
                         │   Vulnerab.     │
                         │   (integra)     │
                         └─────────────────┘
                         
                    PS-07 (TESE) corre em PARALELO
                    desde a Fase 1 até à Fase 4
```

### 9.2. Ordem de Execução Recomendada

| Ordem | Projecto | Razão |
|-------|----------|-------|
| 1 | Stack Docker | Pré-requisito para tudo |
| 2 | PB-00 Biofísico | Base para ~90 projectos |
| 3 | PS-07 (início) | Tese - prioridade académica |
| 4 | NH-09 Upstream/Downstream | Ferramenta diferenciadora |
| 5 | NU-05/08 Isócronas | pgRouting, visual |
| 6 | NC-00 StoryMap | Narrativa, contacto |
| 7 | NA-00 Observatório | Automação |
| 8 | NU-00 Atlas | Integração |
| 9 | NT-05 Aldeia 3D | Emocional, impressão |
| 10 | NF-00 Vulnerabilidade | Integração final |

### 9.3. O que NÃO Bloqueia

| Projecto | Pode começar sem |
|----------|------------------|
| PS-06 Timelapse | Qualquer coisa (só precisa GEE) |
| NC-00 StoryMap | PB-00 (usa GEE) |
| NF-07 Áreas Ardidas | PB-00 (dados ICNF) |

---

## 10. Riscos e Mitigação

### 10.1. Matriz de Riscos

| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| **Tempo insuficiente** | Alta | Alto | Priorizar tese, reduzir scope outros |
| **VM Oracle indisponível** | Baixa | Alto | Backup local, alternativa Hetzner |
| **Dados LiDAR corrompidos** | Baixa | Médio | Re-download, usar resolução menor |
| **GEE quota excedida** | Média | Médio | Batch processing, export local |
| **Bloqueio técnico** | Média | Médio | Stack Overflow, comunidades, Claude |
| **Falta motivação** | Média | Alto | Marcos pequenos, celebrar vitórias |

### 10.2. Planos de Contingência

**Se o tempo for escasso:**
1. Focar 100% na tese (PS-07)
2. Reduzir outros projectos a "nice to have"
3. Simplificar dashboards
4. Usar templates existentes

**Se o servidor falhar:**
1. Backup dos dados em cloud storage
2. Docker Compose portável
3. Alternativa: VM local ou outro provider

**Se bloqueado tecnicamente:**
1. Documentar o problema
2. Pesquisar Stack Overflow / GitHub Issues
3. Perguntar em comunidades (GIS SE, Reddit)
4. Simplificar abordagem

---

## 11. Marcos e Celebrações

### 11.1. Milestones

| Marco | Descrição | Data Alvo |
|-------|-----------|-----------|
| **M1** | Stack online! | Semana 2 |
| **M2** | Primeiro mapa público | Semana 6 |
| **M3** | Primeira ferramenta interactiva | Semana 10 |
| **M4** | Portfolio com 5 projectos | Semana 16 |
| **M5** | Dashboard automático | Semana 20 |
| **M6** | Resposta de autarquia | Semana 24 |
| **M7** | Modelo 3D impresso | Semana 24 |
| **M8** | 10 projectos completos | Semana 30 |
| **M9** | Tese submetida | Mês 11 |
| **M10** | Tese defendida | Mês 12 |

### 11.2. Celebrações 🎉

| Quando | Celebrar Como |
|--------|---------------|
| M1 | Screenshot + commit especial 📸 |
| M2 | LinkedIn post + jantar 🍽️ |
| M3 | Demo para amigos/família 👨‍👩‍👧 |
| M4 | Actualizar LinkedIn "About" 📝 |
| M5 | Post comemorativo 🎊 |
| M7 | Foto com maquete 📷 |
| M10 | Grande celebração! 🥳 |

---

## 12. Métricas de Sucesso

### 12.1. Métricas Técnicas

| Métrica | Objectivo (6 meses) | Objectivo (12 meses) |
|---------|---------------------|----------------------|
| Projectos completos | 8 | 15 |
| Camadas publicadas | 30 | 60 |
| Uptime do servidor | >95% | >99% |
| Tempo de resposta API | <500ms | <200ms |

### 12.2. Métricas de Comunicação

| Métrica | Objectivo (6 meses) | Objectivo (12 meses) |
|---------|---------------------|----------------------|
| Posts LinkedIn | 15 | 40 |
| Seguidores LinkedIn | +300 | +800 |
| Artigos blog | 8 | 20 |
| GitHub stars | 30 | 100 |

### 12.3. Métricas Profissionais

| Métrica | Objectivo (12 meses) |
|---------|----------------------|
| Contactos autarquias | 5+ |
| Respostas positivas | 2+ |
| Projectos conjuntos | 1+ |
| Convites palestras | 1+ |
| Propostas trabalho | 2+ |

### 12.4. Métricas Académicas

| Métrica | Objectivo |
|---------|-----------|
| Tese submetida | Mês 11 |
| Tese aprovada | Mês 12 |
| Artigo submetido | Mês 14 |
| Artigo aceite | Mês 18 |

---

## 13. Plano de Comunicação

### 13.1. Calendário Editorial

```
SEMANA TÍPICA
│
├── Segunda
│   └── Planear conteúdo da semana
│
├── Terça
│   └── LinkedIn post (partilha/insight)
│
├── Quarta
│   └── Trabalho no artigo blog (se houver)
│
├── Quinta
│   └── LinkedIn post (projecto/resultado)
│
└── Sexta
    └── Publicar artigo blog (se pronto)
```

### 13.2. Conteúdo por Projecto

| Projecto | LinkedIn | Blog | GitHub |
|----------|----------|------|--------|
| PB-00 | 1-2 posts | Tutorial DEM | Dados + scripts |
| PS-07 | 3+ posts | GEE tutorial | Código completo |
| NH-09 | 1 post | API tutorial | API code |
| NU-05 | 1 post | pgRouting intro | Funções SQL |
| NC-00 | 1 post | StoryMap guide | Narrativa |
| NA-00 | 2 posts | Automação GIS | Cronjobs |
| NF-00 | 2 posts | AHP tutorial | Metodologia |

### 13.3. Hashtags Padrão

```
#GIS #WebGIS #OpenData #Portugal #MédioTejo
#RemoteSensing #Python #PostGIS #QGIS
#Cartografia #Geospatial #Maps #DataViz
```

---

## 14. Revisões e Ajustes

### 14.1. Cadência de Revisões

| Quando | O quê | Duração |
|--------|-------|---------|
| **Diário** | Tarefas do dia | 5 min |
| **Semanal** | Progresso semanal | 30 min |
| **Mensal** | Revisão de fase | 1-2h |
| **Trimestral** | Objectivos longo prazo | 2-3h |

### 14.2. Template de Retrospectiva

```markdown
## Retrospectiva - [Período]

### O que correu bem ✅
- Item 1
- Item 2

### O que pode melhorar ⚠️
- Item 1
- Item 2

### Acções para próximo período 📋
- [ ] Acção 1
- [ ] Acção 2

### Ajustes ao plano 🔄
- Mudança 1
- Mudança 2
```

### 14.3. Critérios para Ajustar Plano

| Sinal | Acção |
|-------|-------|
| Atraso >2 semanas | Rever prioridades |
| Bloqueio técnico >3 dias | Simplificar ou pedir ajuda |
| Motivação baixa | Fazer quick win |
| Oportunidade surge | Avaliar vs plano actual |

---

## Notas Finais

### O Mais Importante

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   1. COMEÇAR - O plano é óptimo, mas só vale se executado   ║
║                                                              ║
║   2. TESE PRIMEIRO - PS-07 é prioridade #1, sempre          ║
║                                                              ║
║   3. MOSTRAR CEDO - Não esperar pela perfeição              ║
║                                                              ║
║   4. ITERAR - Melhorar com base em feedback                 ║
║                                                              ║
║   5. CELEBRAR - Cada vitória conta                          ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

### Primeiro Passo Concreto

> **AMANHÃ:** Abrir terminal, criar pasta do projecto, inicializar Git.

```bash
# O primeiro commit
mkdir ~/gis-docker-stack
cd ~/gis-docker-stack
git init
echo "# WebGIS Médio Tejo" > README.md
git add README.md
git commit -m "feat: initial commit - the journey begins"
```

**Está feito. O resto é iteração.**

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `00_VISAO_GERAL.md` | Contexto e objectivos |
| `01_STACK_TECNICO.md` | Arquitectura técnica |
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `12_ANCHOR_PROJECTS.md` | Detalhe dos 5 anchors |
| `14_DADOS_NECESSARIOS.md` | Dados para download |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-28 | 1.0 | Documento inicial com roadmap completo |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
