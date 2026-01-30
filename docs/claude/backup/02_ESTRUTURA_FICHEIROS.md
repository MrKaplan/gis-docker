# 02 - ESTRUTURA DE PASTAS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Estrutura Completa](#2-estrutura-completa)
3. [Descrição Detalhada por Pasta](#3-descrição-detalhada-por-pasta)
4. [Convenções de Nomenclatura](#4-convenções-de-nomenclatura)
5. [Ficheiros na Raiz](#5-ficheiros-na-raiz)
6. [Volumes Docker](#6-volumes-docker)
7. [Gitignore](#7-gitignore)

---

## 1. Visão Geral

### 1.1. Princípios de Organização

| Princípio | Descrição |
|-----------|-----------|
| **Separação de responsabilidades** | Cada pasta tem um propósito claro |
| **Reprodutibilidade** | Estrutura permite `git clone` + `docker-compose up` |
| **Escalabilidade** | Fácil adicionar novos projectos e serviços |
| **Dados partilhados** | Volumes comuns entre containers quando necessário |
| **Logs segregados** | Cada serviço tem os seus logs separados |

### 1.2. Estrutura de Alto Nível

```
gis-docker/
├── 📁 config/          # Configurações dos serviços
├── 📁 data/            # Dados persistentes (volumes Docker)
├── 📁 dockerfiles/     # Dockerfiles customizados
├── 📁 docs/            # Documentação (estes MDs)
├── 📁 logs/            # Logs de todos os serviços
├── 📁 projects/        # Projectos de análise
├── 📁 scripts/         # Scripts de setup, cron, utils
├── 📁 src/             # Código fonte (API, módulos)
├── 📁 www/             # Sites estáticos e WebGIS
├── 📄 docker-compose.yml
├── 📄 .env.example
└── 📄 README.md
```

---

## 2. Estrutura Completa

```
gis-docker-stack/
│
├── README.md
├── LICENSE
├── .gitignore
├── .env.example
├── docker-compose.yml
├── docker-compose.override.yml          # Para desenvolvimento local
│
├── dockerfiles/
│   ├── postgis/
│   │   ├── Dockerfile
│   │   └── init-extensions.sql          # Script para criar extensões
│   ├── qgis-server/
│   │   ├── Dockerfile
│   │   └── spawn-fcgi.conf
│   ├── python-api/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── jupyter/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── titiler/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   └── cron/
│       ├── Dockerfile
│       ├── crontab
│       └── requirements.txt
│
├── config/
│   ├── nginx/
│   │   ├── nginx.conf
│   │   ├── sites-available/
│   │   │   ├── default.conf             # Landing page
│   │   │   ├── api.conf                 # Python API
│   │   │   ├── tiles.conf               # Martin tiles
│   │   │   ├── qgis.conf                # QGIS Server WMS
│   │   │   ├── titiler.conf             # TiTiler raster
│   │   │   ├── jupyter.conf             # JupyterLab (dev only)
│   │   │   └── webgis.conf              # Aplicações WebGIS
│   │   └── snippets/
│   │       ├── ssl.conf
│   │       ├── security-headers.conf
│   │       ├── proxy-params.conf
│   │       └── cache-tiles.conf
│   ├── postgis/
│   │   ├── postgresql.conf              # Tuning para 12GB RAM
│   │   └── pg_hba.conf                  # Autenticação
│   ├── qgis-server/
│   │   └── qgis-server.conf
│   ├── martin/
│   │   └── config.yaml
│   ├── pg-tileserv/
│   │   └── config.toml
│   ├── titiler/
│   │   └── config.py
│   └── redis/
│       └── redis.conf
│
├── certs/
│   └── nginx/
│       ├── .gitkeep
│       ├── fullchain.pem                # (gitignored)
│       └── privkey.pem                  # (gitignored)
│
├── data/
│   ├── postgis/                         # Volume PostgreSQL
│   │   └── .gitkeep
│   ├── redis/                           # Volume Redis
│   │   └── .gitkeep
│   ├── qgis/
│   │   └── projects/                    # Projectos .qgz para QGIS Server
│   │       └── default.qgz
│   ├── jupyter/
│   │   └── notebooks/                   # Notebooks persistentes
│   │       └── .gitkeep
│   └── shared/                          # Dados partilhados entre containers
│       ├── raster/                      # GeoTIFFs, COGs
│       │   ├── mdt/                     # Modelos Digitais de Terreno
│       │   ├── indices/                 # NDVI, NDWI, etc.
│       │   └── outputs/                 # Resultados de análises
│       ├── vector/                      # Shapefiles, GeoJSON, GPKG
│       │   ├── base/                    # Dados base (limites, rede viária)
│       │   ├── derived/                 # Dados derivados (bacias, etc.)
│       │   └── outputs/                 # Resultados de análises
│       ├── downloads/                   # Ficheiros descarregados por scraping
│       │   └── .gitkeep
│       └── temp/                        # Ficheiros temporários
│           └── .gitkeep
│
├── logs/
│   ├── nginx/
│   │   ├── access.log
│   │   └── error.log
│   ├── postgis/
│   │   └── postgresql.log
│   ├── qgis/
│   │   └── qgis_server.log
│   ├── python/
│   │   └── api.log
│   ├── cron/
│   │   └── cron.log
│   ├── titiler/
│   │   └── titiler.log
│   └── .gitkeep
│
├── scripts/
│   ├── setup/                           # Scripts de instalação inicial
│   │   ├── bootstrap.sh                 # Script principal de setup
│   │   ├── init-db.sh                   # Criar schemas, extensões
│   │   ├── init-dirs.sh                 # Criar estrutura de pastas
│   │   ├── generate-certs.sh            # Let's Encrypt
│   │   └── load-base-data.sh            # Carregar dados base
│   ├── cronjobs/
│   │   ├── scraping/                    # Scripts de recolha de dados
│   │   │   ├── ipma_weather.py          # Dados meteorológicos IPMA
│   │   │   ├── snirh_reservoirs.py      # Níveis de albufeiras
│   │   │   └── eea_airquality.py        # Qualidade do ar EEA
│   │   └── processing/                  # Processamento batch
│   │       ├── ndwi_batch.py            # Actualizar NDWI
│   │       ├── ndvi_batch.py            # Actualizar NDVI
│   │       └── soil_moisture.py         # Actualizar soil moisture
│   ├── utils/                           # Utilitários
│   │   ├── backup_db.sh                 # Backup PostgreSQL
│   │   ├── restore_db.sh                # Restore PostgreSQL
│   │   ├── cleanup_logs.sh              # Limpar logs antigos
│   │   ├── cleanup_temp.sh              # Limpar ficheiros temporários
│   │   └── health_check.sh              # Verificar estado dos serviços
│   └── analysis/                        # Scripts de análise reutilizáveis
│       ├── terrain/
│       │   ├── derive_slope.py
│       │   ├── derive_aspect.py
│       │   ├── derive_twi.py
│       │   └── derive_all.py            # Deriva todas as camadas de terreno
│       ├── hydrology/
│       │   ├── flow_direction.py
│       │   ├── flow_accumulation.py
│       │   ├── delineate_basins.py
│       │   └── stream_order.py
│       └── indices/
│           ├── calc_ndvi.py
│           ├── calc_ndwi.py
│           └── calc_nbr.py
│
├── src/
│   ├── api/                             # Código da Python API (FastAPI)
│   │   ├── __init__.py
│   │   ├── main.py                      # Entry point
│   │   ├── config.py                    # Configurações
│   │   ├── database.py                  # Conexão à BD
│   │   ├── routers/
│   │   │   ├── __init__.py
│   │   │   ├── health.py                # Health check endpoints
│   │   │   ├── layers.py                # Endpoints de camadas
│   │   │   ├── analysis.py              # Endpoints de análise
│   │   │   └── basins.py                # Upstream/downstream interactivo
│   │   ├── services/
│   │   │   ├── __init__.py
│   │   │   ├── postgis.py               # Queries PostGIS
│   │   │   ├── raster.py                # Processamento raster
│   │   │   └── hydrology.py             # Análises hidrológicas
│   │   ├── models/
│   │   │   ├── __init__.py
│   │   │   └── schemas.py               # Pydantic schemas
│   │   └── utils/
│   │       ├── __init__.py
│   │       └── helpers.py
│   └── processing/                      # Módulos de processamento
│       ├── __init__.py
│       ├── indices.py                   # NDVI, NDWI, NBR, etc.
│       ├── terrain.py                   # Análises de terreno
│       ├── hydrology.py                 # Análises hidrológicas
│       ├── vectorize.py                 # Raster para vector
│       ├── timeseries.py                # Séries temporais
│       └── gee_utils.py                 # Utilitários Google Earth Engine
│
├── projects/                            # Projectos de análise individuais
│   ├── _templates/                      # Templates para novos projectos
│   │   ├── README.md
│   │   ├── followup.md                  # Template comunicação pós-projecto
│   │   └── .gitkeep
│   │
│   ├── 00-base-biofisica/               # PROJECTO PRIORITÁRIO
│   │   ├── README.md
│   │   ├── followup.md
│   │   ├── notebooks/
│   │   │   ├── 01_download_mdt.ipynb
│   │   │   ├── 02_derive_terrain.ipynb
│   │   │   ├── 03_derive_hydrology.ipynb
│   │   │   └── 04_validate.ipynb
│   │   ├── data/                        # Dados específicos do projecto
│   │   │   └── .gitkeep
│   │   ├── outputs/                     # Resultados
│   │   │   └── .gitkeep
│   │   └── scripts/                     # Scripts específicos
│   │       └── .gitkeep
│   │
│   ├── area-medio-tejo/                 # Área de estudo principal
│   │   ├── README.md                    # Descrição da área, justificação
│   │   ├── dados-base/                  # Dados comuns a todos os projectos
│   │   │   ├── limites/
│   │   │   ├── rede-viaria/
│   │   │   ├── hidrografia/
│   │   │   └── mdt/
│   │   └── extent.geojson               # Limites da área de estudo
│   │
│   ├── zona-agricola-boquilobo/         # Cluster/Núcleo Agrícola
│   │   ├── README.md
│   │   ├── followup.md
│   │   ├── notebooks/
│   │   ├── data/
│   │   └── outputs/
│   │
│   ├── zona-hidrica-bacias/             # Cluster/Núcleo Hídrico
│   │   ├── README.md
│   │   ├── followup.md
│   │   ├── notebooks/
│   │   ├── data/
│   │   └── outputs/
│   │
│   ├── zona-urbana-tomar/               # Cluster/Núcleo Urbano
│   │   ├── README.md
│   │   ├── followup.md
│   │   ├── notebooks/
│   │   ├── data/
│   │   └── outputs/
│   │
│   ├── zona-carsica-minde/              # Cluster/Núcleo Cársico
│   │   ├── README.md
│   │   ├── followup.md
│   │   ├── notebooks/
│   │   ├── data/
│   │   └── outputs/
│   │
│   ├── standalone/                      # Projectos independentes
│   │   ├── polje-minde-storymap/
│   │   │   ├── README.md
│   │   │   ├── followup.md
│   │   │   ├── notebooks/
│   │   │   ├── data/
│   │   │   ├── outputs/
│   │   │   └── storymap/                # Ficheiros do StoryMap
│   │   │
│   │   ├── aldeia-xisto-3d/
│   │   │   ├── README.md
│   │   │   ├── followup.md
│   │   │   ├── notebooks/
│   │   │   ├── data/
│   │   │   ├── outputs/
│   │   │   └── models/                  # Ficheiros 3D (STL, OBJ)
│   │   │
│   │   ├── villa-romana-3d/
│   │   │   ├── README.md
│   │   │   ├── followup.md
│   │   │   ├── notebooks/
│   │   │   ├── data/
│   │   │   └── models/
│   │   │
│   │   ├── lixeiras-clandestinas/
│   │   │   ├── README.md
│   │   │   ├── followup.md
│   │   │   ├── notebooks/
│   │   │   ├── data/
│   │   │   │   └── field-collection/    # Dados recolhidos no terreno
│   │   │   └── outputs/
│   │   │
│   │   └── gee-timelapses/
│   │       ├── README.md
│   │       ├── followup.md
│   │       ├── notebooks/
│   │       └── outputs/
│   │
│   └── news-on-gis/                     # Projectos reactivos a notícias
│       ├── README.md                    # Explicação do conceito
│       ├── _template/
│       │   ├── README.md
│       │   └── followup.md
│       └── YYYY-MM-DD-titulo/           # Formato: data + título curto
│           ├── README.md
│           ├── followup.md
│           ├── notebooks/
│           └── outputs/
│
├── www/                                 # Sites e aplicações web
│   ├── landing/                         # Landing page (Hugo)
│   │   ├── config.toml
│   │   ├── content/
│   │   ├── layouts/
│   │   ├── static/
│   │   └── themes/
│   │
│   ├── blog/                            # Blog (Hugo)
│   │   ├── config.toml
│   │   ├── content/
│   │   │   └── posts/
│   │   ├── layouts/
│   │   ├── static/
│   │   └── themes/
│   │
│   ├── portfolio/                       # Portfolio (Hugo ou páginas estáticas)
│   │   ├── config.toml
│   │   ├── content/
│   │   │   └── projects/
│   │   ├── layouts/
│   │   └── static/
│   │
│   ├── webgis/                          # Aplicações WebGIS
│   │   ├── viewer-geral/                # Viewer genérico
│   │   │   ├── index.html
│   │   │   ├── js/
│   │   │   ├── css/
│   │   │   └── config.json
│   │   │
│   │   ├── reservatorios/               # App específica: Reservatórios
│   │   │   ├── index.html
│   │   │   ├── js/
│   │   │   ├── css/
│   │   │   └── config.json
│   │   │
│   │   ├── acessibilidade/              # App específica: Isócronas
│   │   │   ├── index.html
│   │   │   ├── js/
│   │   │   ├── css/
│   │   │   └── config.json
│   │   │
│   │   └── upstream-downstream/         # App interactiva: Bacias
│   │       ├── index.html
│   │       ├── js/
│   │       ├── css/
│   │       └── config.json
│   │
│   └── storymaps/                       # StoryMaps
│       └── polje-minde/
│           ├── index.html
│           ├── js/
│           ├── css/
│           ├── data/
│           └── images/
│
└── docs/                                # Documentação
    ├── 00_VISAO_GERAL.md
    ├── 01_STACK_TECNICO.md
    ├── 02_ESTRUTURA_PASTAS.md           # Este ficheiro
    ├── 03_AREA_ESTUDO.md
    ├── 04_BACKLOG_PROJECTOS.md
    ├── 05_PROJECTO_BASE_BIOFISICO.md
    ├── 06_TEMA1_AGRICULTURA.md
    ├── 07_TEMA2_AGUA.md
    ├── 08_PORTFOLIO_COMUNICACAO.md
    ├── 09_IDEIAS_PENDENTES.md
    ├── 10_PROXIMOS_PASSOS.md
    ├── 11_GLOSSARIO_DECISOES.md
    └── 99_STATUS.md
```

---

## 3. Descrição Detalhada por Pasta

### 3.1. `/dockerfiles`

Contém os Dockerfiles customizados para cada serviço que precisa de imagem própria.

| Pasta | Conteúdo |
|-------|----------|
| `postgis/` | Dockerfile com PostgreSQL + PostGIS + pgRouting + pg_cron |
| `qgis-server/` | Dockerfile Ubuntu + QGIS Server (ARM64) |
| `python-api/` | Dockerfile Python + GDAL + bibliotecas GIS |
| `jupyter/` | Dockerfile JupyterLab + mesmo stack Python |
| `titiler/` | Dockerfile TiTiler para COG/STAC |
| `cron/` | Dockerfile Alpine + Python para cronjobs |

**Nota:** Martin, Redis, Nginx usam imagens oficiais sem customização.

### 3.2. `/config`

Ficheiros de configuração de cada serviço, montados como volumes.

| Pasta | Ficheiros Principais |
|-------|---------------------|
| `nginx/` | nginx.conf, sites-available/*.conf, snippets/*.conf |
| `postgis/` | postgresql.conf (tuning), pg_hba.conf (auth) |
| `martin/` | config.yaml (layers, conexão) |
| `qgis-server/` | Configuração do servidor |
| `titiler/` | config.py |
| `redis/` | redis.conf |

### 3.3. `/data`

Dados persistentes dos containers (volumes Docker).

| Pasta | Descrição | Persistente |
|-------|-----------|-------------|
| `postgis/` | Dados do PostgreSQL | ✅ Sim |
| `redis/` | Cache Redis | ⚠️ Opcional |
| `qgis/projects/` | Projectos .qgz | ✅ Sim |
| `jupyter/notebooks/` | Notebooks | ✅ Sim |
| `shared/` | Dados partilhados entre containers | ✅ Sim |

#### Estrutura de `/data/shared`

```
shared/
├── raster/
│   ├── mdt/              # MDT LiDAR e derivados
│   ├── indices/          # NDVI, NDWI, NBR, etc.
│   └── outputs/          # Resultados de análises raster
├── vector/
│   ├── base/             # Limites, rede viária, hidrografia
│   ├── derived/          # Bacias, isócronas, etc.
│   └── outputs/          # Resultados de análises vector
├── downloads/            # Dados descarregados automaticamente
└── temp/                 # Ficheiros temporários (limpar periodicamente)
```

### 3.4. `/logs`

Logs segregados por serviço para fácil debugging.

```
logs/
├── nginx/         # access.log, error.log
├── postgis/       # postgresql.log
├── qgis/          # qgis_server.log
├── python/        # api.log
├── cron/          # cron.log
└── titiler/       # titiler.log
```

**Rotação:** Configurar logrotate ou Docker logging com max-size.

### 3.5. `/scripts`

Scripts organizados por função.

| Pasta | Função | Exemplos |
|-------|--------|----------|
| `setup/` | Instalação inicial | bootstrap.sh, init-db.sh |
| `cronjobs/scraping/` | Recolha automática de dados | ipma_weather.py |
| `cronjobs/processing/` | Processamento batch | ndvi_batch.py |
| `utils/` | Utilitários de manutenção | backup_db.sh |
| `analysis/` | Scripts de análise reutilizáveis | derive_slope.py |

### 3.6. `/src`

Código fonte da aplicação.

#### `/src/api` - FastAPI

```
api/
├── main.py           # Entry point, inicialização
├── config.py         # Variáveis de ambiente, settings
├── database.py       # Pool de conexões PostgreSQL
├── routers/          # Endpoints organizados por tema
├── services/         # Lógica de negócio
├── models/           # Pydantic schemas
└── utils/            # Helpers
```

#### `/src/processing` - Módulos de processamento

```
processing/
├── indices.py        # Cálculo de índices espectrais
├── terrain.py        # Derivados de terreno (slope, aspect, etc.)
├── hydrology.py      # Flow direction, accumulation, bacias
├── vectorize.py      # Conversão raster → vector
├── timeseries.py     # Análise de séries temporais
└── gee_utils.py      # Helpers para Google Earth Engine
```

### 3.7. `/projects`

Projectos de análise organizados por tipo.

#### Estrutura de um projecto

```
nome-projecto/
├── README.md         # Descrição, objectivos, metodologia
├── followup.md       # Checklist de comunicação pós-projecto
├── notebooks/        # Jupyter notebooks numerados sequencialmente
├── data/             # Dados específicos (se não estiverem em shared/)
├── outputs/          # Resultados finais
└── scripts/          # Scripts específicos (se necessário)
```

#### Tipos de projectos

| Tipo | Localização | Descrição |
|------|-------------|-----------|
| **Base** | `00-base-biofisica/` | Projecto prioritário, alimenta os outros |
| **Área** | `area-medio-tejo/` | Dados comuns à área de estudo |
| **Zonas** | `zona-*/` | Núcleos temáticos (agrícola, hídrico, urbano, cársico) |
| **Standalone** | `standalone/*/` | Projectos independentes |
| **News** | `news-on-gis/*/` | Projectos reactivos a notícias |

### 3.8. `/www`

Sites e aplicações web.

| Pasta | Tecnologia | Função |
|-------|------------|--------|
| `landing/` | Hugo | Página inicial do domínio |
| `blog/` | Hugo | Artigos técnicos |
| `portfolio/` | Hugo | Showcase de projectos |
| `webgis/` | HTML/JS/Leaflet | Aplicações WebGIS |
| `storymaps/` | HTML/JS | Narrativas interactivas |

### 3.9. `/docs`

Documentação do projecto (estes ficheiros MD).

---

## 4. Convenções de Nomenclatura

### 4.1. Ficheiros e Pastas

| Tipo | Convenção | Exemplo |
|------|-----------|---------|
| Pastas | minúsculas, hífens | `zona-agricola-boquilobo/` |
| Scripts Python | minúsculas, underscores | `derive_slope.py` |
| Notebooks | número + descrição | `01_download_mdt.ipynb` |
| Configs | nome do serviço | `nginx.conf`, `config.yaml` |
| Projectos News | data + título | `2025-01-27-cheias-mocambique/` |

### 4.2. Branches Git

| Branch | Uso |
|--------|-----|
| `main` | Produção, sempre estável |
| `develop` | Desenvolvimento activo |
| `feature/nome` | Nova funcionalidade |
| `project/nome` | Novo projecto de análise |
| `fix/nome` | Correcção de bugs |

### 4.3. Commits

Formato: `tipo: descrição curta`

| Tipo | Uso |
|------|-----|
| `feat` | Nova funcionalidade |
| `fix` | Correcção de bug |
| `docs` | Documentação |
| `style` | Formatação |
| `refactor` | Refactoring |
| `data` | Dados ou análises |
| `config` | Configurações |

Exemplo: `feat: adicionar endpoint upstream/downstream`

---

## 5. Ficheiros na Raiz

### 5.1. `docker-compose.yml`

Ficheiro principal de orquestração. Define todos os serviços e suas relações.

### 5.2. `docker-compose.override.yml`

Overrides para desenvolvimento local (portas expostas, volumes extra, etc.).

**Não commitar** configurações sensíveis ou específicas de ambiente.

### 5.3. `.env.example`

Template de variáveis de ambiente:

```env
# PostgreSQL
POSTGRES_USER=gisuser
POSTGRES_PASSWORD=changeme
POSTGRES_DB=gisdb

# Domínio
DOMAIN=example.com

# API
API_SECRET_KEY=changeme

# GEE (se aplicável)
GEE_SERVICE_ACCOUNT=

# Paths
DATA_PATH=/data
LOGS_PATH=/logs
```

### 5.4. `.gitignore`

Ver secção 7.

### 5.5. `README.md`

Documentação principal do repositório:
- Descrição do projecto
- Quick start
- Requisitos
- Links para documentação detalhada

---

## 6. Volumes Docker

### 6.1. Mapeamento de Volumes

```yaml
volumes:
  # PostgreSQL data
  postgis_data:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: ./data/postgis

  # Dados partilhados
  shared_data:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: ./data/shared

  # Logs
  logs:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: ./logs
```

### 6.2. Montagem nos Containers

| Container | Volumes Montados |
|-----------|-----------------|
| postgis | `postgis_data:/var/lib/postgresql/data` |
| python-api | `shared_data:/data`, `./src/api:/app` |
| jupyter | `shared_data:/data`, `./projects:/projects` |
| nginx | `./config/nginx:/etc/nginx`, `./www:/var/www` |
| cron | `shared_data:/data`, `./scripts/cronjobs:/scripts` |

---

## 7. Gitignore

### 7.1. Ficheiro `.gitignore`

```gitignore
# ===========================
# Ambiente e Secrets
# ===========================
.env
.env.local
.env.*.local
*.pem
*.key

# ===========================
# Dados (demasiado grandes)
# ===========================
data/postgis/*
!data/postgis/.gitkeep

data/redis/*
!data/redis/.gitkeep

data/shared/raster/*
!data/shared/raster/.gitkeep
!data/shared/raster/mdt/.gitkeep

data/shared/vector/*
!data/shared/vector/.gitkeep

data/shared/downloads/*
!data/shared/downloads/.gitkeep

data/shared/temp/*
!data/shared/temp/.gitkeep

# ===========================
# Logs
# ===========================
logs/**/*.log
!logs/.gitkeep

# ===========================
# Python
# ===========================
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
.venv/
ENV/
.eggs/
*.egg-info/
.installed.cfg
*.egg

# ===========================
# Jupyter
# ===========================
.ipynb_checkpoints/
*.ipynb_checkpoints

# ===========================
# IDE
# ===========================
.idea/
.vscode/
*.swp
*.swo
*~

# ===========================
# OS
# ===========================
.DS_Store
Thumbs.db

# ===========================
# Outputs grandes
# ===========================
*.tif
*.tiff
*.gpkg
*.shp
*.shx
*.dbf
*.prj
*.cpg
!projects/**/outputs/.gitkeep

# ===========================
# Modelos 3D
# ===========================
*.stl
*.obj
*.fbx

# ===========================
# Hugo
# ===========================
www/*/public/
www/*/resources/

# ===========================
# Certificados
# ===========================
certs/**/*.pem
certs/**/*.key
!certs/**/.gitkeep
```

### 7.2. Ficheiros a Commitar

Apesar do gitignore, estes ficheiros **devem** ser commitados:

- Todos os `.gitkeep` (mantêm estrutura de pastas)
- Ficheiros de configuração de exemplo
- Documentação
- Scripts
- Código fonte
- Dockerfiles
- docker-compose.yml
- Templates de projectos

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `00_VISAO_GERAL.md` - Contexto e objectivos
- `01_STACK_TECNICO.md` - Detalhe dos containers e bibliotecas
- `04_BACKLOG_PROJECTOS.md` - Lista de projectos

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
