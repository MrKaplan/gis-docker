# 01 - STACK TÉCNICO

## Índice
1. [Visão Geral da Arquitectura](#1-visão-geral-da-arquitectura)
2. [Containers e Serviços](#2-containers-e-serviços)
3. [Stack por Container (Detalhado)](#3-stack-por-container-detalhado)
4. [Bibliotecas Python](#4-bibliotecas-python)
5. [Extensões PostGIS](#5-extensões-postgis)
6. [Decisões Técnicas](#6-decisões-técnicas)
7. [Configurações de Performance](#7-configurações-de-performance)
8. [Segurança e SSL](#8-segurança-e-ssl)
9. [Monitorização](#9-monitorização)
10. [CI/CD e Deployment](#10-cicd-e-deployment)

---

## 1. Visão Geral da Arquitectura

### 1.1. Princípio Fundamental

**1 serviço = 1 container**

Esta abordagem permite:
- Escalar serviços independentemente
- Reiniciar um serviço sem afectar outros
- Actualizar componentes de forma isolada
- Debugging mais fácil

### 1.2. Diagrama de Arquitectura

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

### 1.3. Fluxo de Dados

```
Dados Externos (STAC/COG, APIs)
         │
         ▼
    ┌─────────┐
    │ TITILER │ ◄── Rasters on-the-fly (não armazena)
    └─────────┘
         │
         ▼
    ┌─────────┐
    │ POSTGIS │ ◄── Dados vectoriais + resultados processados
    └─────────┘
         │
    ┌────┴────┐
    │         │
    ▼         ▼
┌───────┐ ┌───────┐
│MARTIN │ │ QGIS  │ ◄── Publicação (tiles vs WMS)
└───────┘ └───────┘
    │         │
    └────┬────┘
         │
         ▼
    ┌─────────┐
    │  NGINX  │ ◄── Cache + SSL + routing
    └─────────┘
         │
         ▼
    UTILIZADOR
```

---

## 2. Containers e Serviços

### 2.1. Tabela de Containers

| Container | Imagem Base | Porta Interna | Função Principal | Obrigatório |
|-----------|-------------|---------------|------------------|-------------|
| **postgis** | postgres:16 + postgis | 5432 | Base de dados espacial | ✅ Sim |
| **qgis-server** | ubuntu:24.04 | 5555 | WMS/WFS/WCS | ✅ Sim |
| **martin** | ghcr.io/maplibre/martin | 3000 | Vector tiles MVT | ✅ Sim |
| **pg-tileserv** | pramsey/pg_tileserv | 7800 | Tiles + funções SQL | ⚠️ Opcional |
| **titiler** | python:3.12-slim | 8000 | Raster tiles COG/STAC | ✅ Sim |
| **python-api** | python:3.12-slim | 8080 | FastAPI custom | ✅ Sim |
| **jupyter** | jupyter/minimal | 8888 | Análise e prototipagem | ✅ Sim |
| **nginx** | nginx:alpine | 80, 443 | Reverse proxy + SSL | ✅ Sim |
| **cron** | alpine:latest | - | Tarefas agendadas | ✅ Sim |
| **redis** | redis:alpine | 6379 | Cache | ⚠️ Opcional |

### 2.2. Recursos Estimados por Container

| Container | RAM Estimada | CPU | Notas |
|-----------|--------------|-----|-------|
| postgis | 2-4 GB | Médio | Depende das queries |
| qgis-server | 1-2 GB | Alto quando renderiza | Picos durante WMS |
| martin | 256 MB | Baixo | Muito eficiente |
| pg-tileserv | 256 MB | Baixo | Similar ao Martin |
| titiler | 512 MB - 1 GB | Médio | Depende do raster |
| python-api | 512 MB | Baixo-Médio | Depende dos endpoints |
| jupyter | 1-2 GB | Alto quando processa | Usar com moderação |
| nginx | 128 MB | Muito baixo | Apenas proxy |
| cron | 256 MB | Baixo | Picos durante jobs |
| redis | 256 MB | Muito baixo | Cache em memória |

**Total estimado:** 6-10 GB RAM (dentro dos 12 GB disponíveis)

### 2.3. Docker Compose Profiles

Para gerir recursos, usar profiles que permitem levantar apenas o necessário:

```yaml
services:
  postgis:
    profiles: ["core", "full"]
  
  nginx:
    profiles: ["core", "full"]
  
  martin:
    profiles: ["core", "full"]
  
  qgis-server:
    profiles: ["full", "wms"]
  
  titiler:
    profiles: ["full", "raster"]
  
  jupyter:
    profiles: ["dev", "analysis"]
  
  python-api:
    profiles: ["core", "full"]
  
  cron:
    profiles: ["full", "automation"]
  
  redis:
    profiles: ["full", "cache"]
```

**Uso:**
```bash
# Apenas core (postgis, nginx, martin, python-api)
docker-compose --profile core up -d

# Tudo
docker-compose --profile full up -d

# Core + Jupyter para análise
docker-compose --profile core --profile analysis up -d
```

---

## 3. Stack por Container (Detalhado)

### 3.1. Container: postgis

```dockerfile
# Base
FROM postgres:16

# Extensões
- PostGIS 3.4
- pgRouting 3.6
- pg_cron

# Configuração optimizada para 12GB RAM total
- shared_buffers = 2GB
- effective_cache_size = 6GB
- work_mem = 256MB
- maintenance_work_mem = 512MB
```

**Extensões SQL a activar:**
```sql
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_raster;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pgrouting;
CREATE EXTENSION pg_cron;
```

### 3.2. Container: qgis-server

```dockerfile
# Base
FROM ubuntu:24.04

# Instalação
- QGIS Server 3.34 LTR
- spawn-fcgi
- fcgiwrap

# Variáveis de ambiente importantes
QGIS_SERVER_LOG_LEVEL=0
QGIS_SERVER_LOG_FILE=/var/log/qgis/qgis_server.log
MAX_CACHE_LAYERS=100
```

### 3.3. Container: martin

```dockerfile
# Base (imagem oficial)
FROM ghcr.io/maplibre/martin:latest

# Configuração via config.yaml
- Conexão ao PostGIS
- Definição de layers
- Cache settings
```

**Exemplo config.yaml:**
```yaml
connection_string: postgres://user:pass@postgis:5432/gis

tables:
  auto_publish: true
  
functions:
  auto_publish: true
```

### 3.4. Container: titiler

```dockerfile
# Base
FROM python:3.12-slim

# Dependências
- titiler.core
- titiler.extensions
- titiler.mosaic
- rio-cogeo
- rio-tiler
- starlette

# Porta
EXPOSE 8000
```

**Capacidades:**
- Servir COG (Cloud Optimized GeoTIFF) on-the-fly
- Acesso a catálogos STAC
- Não precisa armazenar rasters localmente
- Gera tiles dinamicamente

### 3.5. Container: python-api

```dockerfile
# Base
FROM python:3.12-slim

# Sistema
- GDAL 3.8 (via apt)
- build-essential
- libpq-dev

# Python (ver secção 4 para lista completa)
- fastapi
- uvicorn
- geopandas
- rasterio
- (...)

# Porta
EXPOSE 8080
```

### 3.6. Container: jupyter

```dockerfile
# Base
FROM jupyter/minimal-notebook

# Adicional
- Mesmo stack Python que python-api
- jupyterlab-git
- folium
- leafmap
- matplotlib
- plotly
- ipywidgets

# Porta
EXPOSE 8888
```

### 3.7. Container: nginx

```dockerfile
# Base
FROM nginx:alpine

# Adicional
- certbot (para Let's Encrypt)
- Configurações por site
- Cache de tiles
```

**Estrutura de configuração:**
```
/etc/nginx/
├── nginx.conf
├── sites-available/
│   ├── default.conf
│   ├── api.conf
│   ├── tiles.conf
│   └── qgis.conf
└── snippets/
    ├── ssl.conf
    └── cache.conf
```

### 3.8. Container: cron

```dockerfile
# Base
FROM alpine:latest

# Instalação
- Python 3.12
- Dependências mínimas para scripts
- crond

# Scripts montados via volume
/scripts/cronjobs/
```

### 3.9. Container: redis

```dockerfile
# Base (imagem oficial)
FROM redis:alpine

# Configuração
- maxmemory 256mb
- maxmemory-policy allkeys-lru
```

---

## 4. Bibliotecas Python

### 4.1. Core GIS

| Biblioteca | Versão | Função |
|------------|--------|--------|
| GDAL | 3.8+ | Processamento raster/vector |
| rasterio | latest | Interface Python para rasters |
| fiona | latest | Interface Python para vectors |
| shapely | 2.0+ | Geometrias |
| pyproj | latest | Projecções e transformações |
| geopandas | latest | DataFrames espaciais |

### 4.2. Análise de Dados

| Biblioteca | Função |
|------------|--------|
| numpy | Arrays e computação numérica |
| pandas | DataFrames |
| scipy | Estatística e interpolação |
| scikit-learn | Machine Learning (futuro) |

### 4.3. Análise Espacial

| Biblioteca | Função | Substitui |
|------------|--------|-----------|
| richdem | Análise de terreno | GRASS (parcial) |
| pysheds | Hidrologia (flow, bacias) | GRASS (parcial) |
| xarray | Arrays multidimensionais | - |
| xarray-spatial | Análise raster | - |
| rasterstats | Estatísticas zonais | - |
| networkx | Grafos e redes | - |
| osmnx | OpenStreetMap + redes | - |
| momepy | Morfologia urbana | - |
| pvlib | Cálculos fotovoltaico | - |

### 4.4. Remote Sensing

| Biblioteca | Função |
|------------|--------|
| earthengine-api | Google Earth Engine |
| pystac-client | Acesso a catálogos STAC |
| planetary-computer | Microsoft Planetary Computer |
| sentinelsat | Download Sentinel (se necessário) |

### 4.5. Web e API

| Biblioteca | Função |
|------------|--------|
| fastapi | Framework API |
| uvicorn | ASGI server |
| pydantic | Validação de dados |
| httpx | Cliente HTTP async |
| requests | Cliente HTTP sync |
| aiofiles | IO assíncrono |

### 4.6. Base de Dados

| Biblioteca | Função |
|------------|--------|
| psycopg2-binary | PostgreSQL sync |
| asyncpg | PostgreSQL async |
| sqlalchemy | ORM |
| geoalchemy2 | ORM espacial |

### 4.7. Visualização

| Biblioteca | Função |
|------------|--------|
| matplotlib | Gráficos estáticos |
| plotly | Gráficos interactivos |
| folium | Mapas Leaflet |
| leafmap | Mapas interactivos |
| contextily | Basemaps |

### 4.8. Utilitários

| Biblioteca | Função |
|------------|--------|
| python-dotenv | Variáveis de ambiente |
| pyyaml | Parsing YAML |
| boto3 | AWS S3 (para COGs remotos) |
| tqdm | Progress bars |
| loguru | Logging |

### 4.9. requirements.txt Consolidado

```txt
# Core GIS
GDAL>=3.8
rasterio
fiona
shapely>=2.0
pyproj
geopandas

# Análise
numpy
pandas
scipy

# Análise Espacial
richdem
pysheds
xarray
xarray-spatial
rasterstats
networkx
osmnx
momepy
pvlib

# Remote Sensing
earthengine-api
pystac-client
planetary-computer

# Web/API
fastapi
uvicorn[standard]
pydantic
httpx
requests
aiofiles

# Base de Dados
psycopg2-binary
asyncpg
sqlalchemy
geoalchemy2

# Visualização
matplotlib
plotly
folium
leafmap
contextily

# Utilitários
python-dotenv
pyyaml
boto3
tqdm
loguru
```

---

## 5. Extensões PostGIS

### 5.1. Extensões a Instalar

```sql
-- Core PostGIS
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_raster;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- Routing
CREATE EXTENSION IF NOT EXISTS pgrouting;

-- Scheduling
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- Fuzzy search (opcional - decidido NÃO incluir por agora)
-- CREATE EXTENSION IF NOT EXISTS pg_trgm;
```

### 5.2. Funções Úteis a Criar

```sql
-- Função para simplificar geometrias por zoom level
CREATE OR REPLACE FUNCTION simplify_for_zoom(geom geometry, zoom int)
RETURNS geometry AS $$
BEGIN
  RETURN ST_Simplify(geom, 
    CASE 
      WHEN zoom >= 15 THEN 0
      WHEN zoom >= 12 THEN 10
      WHEN zoom >= 10 THEN 50
      WHEN zoom >= 8 THEN 100
      ELSE 500
    END
  );
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Função para upstream basin (para funcionalidade interactiva)
-- A desenvolver com pgRouting
```

---

## 6. Decisões Técnicas

### 6.1. O que INCLUIR

| Componente | Razão | Prioridade |
|------------|-------|------------|
| **TiTiler** | Serve rasters COG/STAC on-the-fly sem armazenar | Alta |
| **pgRouting** | Isócronas, routing, análise de redes | Alta |
| **Redis** | Cache de tiles e queries frequentes | Média |
| **earthengine-api** | Processamento pesado no GEE | Alta |
| **richdem/pysheds** | Substitui GRASS para hidrologia | Alta |

### 6.2. O que NÃO INCLUIR

| Componente | Razão | Alternativa |
|------------|-------|-------------|
| **GRASS GIS** | Pesado (~2GB); maioria das funções têm equivalente Python | richdem, pysheds, scipy |
| **SNAP/ESA Toolbox** | 8GB só para SAR | Usar GEE para Sentinel-1 |
| **R** | Dispersa esforço; Python faz o mesmo | Focar em Python |
| **pg_trgm** | Desnecessário para este projecto | - |
| **TimescaleDB** | Não temos séries temporais de alta frequência | PostGIS temporal simples |
| **GeoServer** | Java/JVM consome muita RAM | QGIS Server + Martin |

### 6.3. Decisões de Processamento

| Tipo de Processamento | Onde Fazer | Razão |
|-----------------------|------------|-------|
| **Séries temporais raster longas** | GEE | Não sobrecarrega servidor |
| **SAR (Sentinel-1)** | GEE | Evita instalar SNAP |
| **NDVI/NDWI histórico** | GEE | Acesso fácil ao arquivo |
| **Análise hidrológica (bacias, flow)** | Servidor (Python) | richdem/pysheds são eficientes |
| **Routing e isócronas** | Servidor (PostGIS) | pgRouting é rápido |
| **HEC-HMS/HEC-RAS** | Desktop | Software standalone com GUI |
| **Prototipagem inicial** | Desktop (QGIS) | Mais fácil explorar |
| **LiDAR pesado** | Desktop | Pode ser demasiado para servidor |

### 6.4. Estratégia de Armazenamento

| Tipo de Dados | Armazenar Localmente? | Estratégia |
|---------------|----------------------|------------|
| **Rasters brutos (Sentinel, Landsat)** | ❌ Não | Aceder via STAC/COG com TiTiler |
| **Resultados processados (raster)** | ✅ Sim | COG optimizado |
| **Vectores** | ✅ Sim | PostGIS |
| **LiDAR (MDT derivado)** | ✅ Sim | COG ou PostGIS raster |
| **Cache de tiles** | ✅ Sim | Redis + disco |

---

## 7. Configurações de Performance

### 7.1. PostgreSQL/PostGIS

```conf
# postgresql.conf optimizado para 12GB RAM total

# Memory
shared_buffers = 2GB
effective_cache_size = 6GB
work_mem = 256MB
maintenance_work_mem = 512MB

# Connections
max_connections = 100

# Write Ahead Log
wal_buffers = 64MB
checkpoint_completion_target = 0.9

# Planner
random_page_cost = 1.1  # SSD
effective_io_concurrency = 200

# Parallel queries
max_parallel_workers_per_gather = 2
max_parallel_workers = 4
```

### 7.2. Índices Espaciais

```sql
-- Sempre criar índices GiST em colunas geometry
CREATE INDEX idx_tabela_geom ON tabela USING GIST (geom);

-- Para queries frequentes, considerar CLUSTER
CLUSTER tabela USING idx_tabela_geom;

-- Actualizar estatísticas
ANALYZE tabela;
```

### 7.3. Nginx Cache

```nginx
# Cache de tiles
proxy_cache_path /var/cache/nginx/tiles 
    levels=1:2 
    keys_zone=tiles:10m 
    max_size=1g 
    inactive=7d 
    use_temp_path=off;

location /tiles/ {
    proxy_cache tiles;
    proxy_cache_valid 200 7d;
    proxy_cache_use_stale error timeout updating;
    add_header X-Cache-Status $upstream_cache_status;
    proxy_pass http://martin:3000/;
}
```

### 7.4. Pool de Conexões

```python
# FastAPI com asyncpg
from asyncpg import create_pool

pool = await create_pool(
    dsn="postgres://user:pass@postgis:5432/gis",
    min_size=5,
    max_size=20,
    max_inactive_connection_lifetime=300
)
```

---

## 8. Segurança e SSL

### 8.1. Certificados Let's Encrypt

**Opção A: Certbot standalone**
```bash
certbot certonly --standalone -d dominio.pt -d www.dominio.pt
```

**Opção B: Nginx Proxy Manager (recomendado)**
- Interface web para gestão
- Renovação automática
- Fácil de configurar

### 8.2. Configuração SSL Nginx

```nginx
# /etc/nginx/snippets/ssl.conf

ssl_certificate /etc/letsencrypt/live/dominio.pt/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/dominio.pt/privkey.pem;

ssl_protocols TLSv1.2 TLSv1.3;
ssl_prefer_server_ciphers on;
ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256;

ssl_session_cache shared:SSL:10m;
ssl_session_timeout 1d;
```

### 8.3. Headers de Segurança

```nginx
# /etc/nginx/snippets/security.conf

add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header X-XSS-Protection "1; mode=block" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
```

---

## 9. Monitorização

### 9.1. Opções Leves

| Ferramenta | Função | Recursos |
|------------|--------|----------|
| **Netdata** | Métricas em tempo real | ~100MB RAM |
| **Portainer** | Gestão de containers | ~50MB RAM |
| **ctop** | Top para containers | Mínimo |

### 9.2. Logs Centralizados

```yaml
# docker-compose.yml
logging:
  driver: "json-file"
  options:
    max-size: "10m"
    max-file: "3"
```

### 9.3. Health Checks

```yaml
# docker-compose.yml
services:
  postgis:
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5
  
  python-api:
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
      interval: 30s
      timeout: 10s
      retries: 3
```

---

## 10. CI/CD e Deployment

### 10.1. GitHub Actions

```yaml
# .github/workflows/deploy.yml
name: Deploy to Oracle Cloud

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: SSH and Deploy
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.SSH_KEY }}
          script: |
            cd /home/ubuntu/projeto-gis-stack
            git pull origin main
            docker-compose pull
            docker-compose up -d --build
```

### 10.2. Script de Bootstrap

```bash
#!/bin/bash
# bootstrap.sh - Instalação inicial

# Clonar repositório
git clone https://github.com/user/projeto-gis-stack.git
cd projeto-gis-stack

# Copiar e editar variáveis de ambiente
cp .env.example .env
nano .env

# Criar estrutura de pastas
./scripts/setup/init-dirs.sh

# Gerar certificados (se domínio já apontar para servidor)
./scripts/setup/generate-certs.sh

# Levantar serviços
docker-compose --profile full up -d

# Inicializar base de dados
./scripts/setup/init-db.sh

echo "Setup completo!"
```

### 10.3. Workflow de Deployment

```
git push origin main
       │
       ▼
GitHub Actions triggered
       │
       ▼
SSH para Oracle Cloud
       │
       ▼
git pull + docker-compose up
       │
       ▼
Serviços actualizados (downtime ~10-30s)
```

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `00_VISAO_GERAL.md` - Contexto e objectivos
- `02_ESTRUTURA_PASTAS.md` - Organização de ficheiros
- `05_PROJECTO_BASE_BIOFISICO.md` - Projecto que usa este stack

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
