# 07 - TEMA 2: ÁGUA E HIDROLOGIA

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Projectos Detalhados](#2-projectos-detalhados)
3. [Funcionalidade Interactiva: Upstream/Downstream](#3-funcionalidade-interactiva-upstreamdownstream)
4. [Dados e Fontes](#4-dados-e-fontes)
5. [Metodologias](#5-metodologias)
6. [Implementação Técnica](#6-implementação-técnica)
7. [Comparação com Dados Oficiais](#7-comparação-com-dados-oficiais)
8. [Outputs e Entregas](#8-outputs-e-entregas)
9. [Comunicação](#9-comunicação)
10. [Investigações Pendentes](#10-investigações-pendentes)

---

## 1. Visão Geral

### 1.1. Zona Temática

| Campo | Valor |
|-------|-------|
| **Nome** | Zona Hídrica |
| **Emoji** | 💧 |
| **Localização** | Bacias Almonda + Alviela + Castelo de Bode |
| **Área aproximada** | ~800 km² |
| **Temática** | Hidrologia, qualidade água, recursos hídricos |

### 1.2. Âmbito

A Zona Hídrica cobre **toda a área de estudo** e funciona como base para as outras zonas. Inclui:

- **Bacia do Rio Almonda** (~250 km²)
- **Bacia do Rio Alviela** (~350 km²)
- **Albufeira de Castelo de Bode** (parcial)
- **Confluências com o Tejo**

### 1.3. Relação com Projecto Base

```
ZH-00 (Caracterização Biofísica)
    │
    ├──► ZH-01 (Stream Order) - usa flow accumulation
    ├──► ZH-02 (Bacias) - usa flow direction
    ├──► ZH-03 (Flow Dir/Acc) - derivado directo
    ├──► ZH-04 (TWI) - derivado directo
    ├──► ZH-05 (Zonas Cheia) - usa MDT + flow
    ├──► ZH-08 (Upstream/Downstream) - usa flow dir
    └──► ZH-10 (Erosão Hídrica) - usa LS factor
```

O **ZH-00 (Caracterização Biofísica)** está documentado em `05_PROJECTO_BASE_BIOFISICO.md`.

---

## 2. Projectos Detalhados

### 2.1. ZH-01 - Rede Hidrográfica (Strahler)

| Campo | Valor |
|-------|-------|
| **ID** | ZH-01 |
| **Prioridade** | 🔴 Alta |
| **Origem** | #98 (Stream Order) |
| **Dependências** | ZH-00 (flow accumulation) |

**Objectivo:** Extrair e classificar a rede hidrográfica usando a ordem de Strahler.

**Metodologia:**
```
Ordem de Strahler:
- Ordem 1: Nascentes (sem afluentes a montante)
- Ordem 2: Confluência de dois de ordem 1
- Ordem 3: Confluência de dois de ordem 2
- etc.

Quando confluem ordens diferentes, mantém a maior.
```

**Outputs:**
- Rede de drenagem raster (com ordem)
- Rede de drenagem vector (linhas com atributo ordem)
- Estatísticas (comprimento por ordem, densidade de drenagem)

**Parâmetros:**
```python
# Threshold de células para definir início de curso de água
FLOW_ACC_THRESHOLD = 1000  # células (~4000 m² com res. 2m)
```

---

### 2.2. ZH-02 - Bacias e Sub-bacias

| Campo | Valor |
|-------|-------|
| **ID** | ZH-02 |
| **Prioridade** | 🔴 Alta |
| **Origem** | #525 (Catchment Areas) |
| **Dependências** | ZH-00 (flow direction) |

**Objectivo:** Delinear bacias e sub-bacias hidrográficas a partir do MDT LiDAR.

**Metodologia:**
```python
# Workflow
1. Fill depressions no DEM
2. Calcular flow direction (D8)
3. Identificar pour points (saídas)
4. Delinear bacias para cada pour point
5. Subdividir em sub-bacias (threshold de área)
```

**Outputs:**
- Bacias principais (Almonda, Alviela, outras)
- Sub-bacias (por threshold de área)
- Polígonos vectoriais com atributos:
  - Área
  - Perímetro
  - Ordem (bacia principal / sub-bacia)
  - Curso de água principal

**Comparação:** Ver secção 7 para comparação com bacias oficiais da APA.

---

### 2.3. ZH-03 - Flow Direction / Accumulation

| Campo | Valor |
|-------|-------|
| **ID** | ZH-03 |
| **Prioridade** | 🔴 Alta |
| **Origem** | #527, #534 |
| **Dependências** | ZH-00 (DEM) |

**Objectivo:** Calcular direcção e acumulação de fluxo (base para análises hidrológicas).

**Nota:** Este projecto é parte do ZH-00 (Projecto Base), mas documentado aqui para completude.

**Outputs:**
- Flow direction raster (D8: valores 1,2,4,8,16,32,64,128)
- Flow accumulation raster (número de células a montante)

**Usos:**
- Input para ZH-01 (rede drenagem)
- Input para ZH-02 (bacias)
- Input para ZH-08 (upstream/downstream)
- Input para ZH-04 (TWI)

---

### 2.4. ZH-04 - TWI (Topographic Wetness Index)

| Campo | Valor |
|-------|-------|
| **ID** | ZH-04 |
| **Prioridade** | 🟡 Média |
| **Origem** | #526 |
| **Dependências** | ZH-00 (DEM, flow accumulation) |

**Objectivo:** Calcular o Índice de Humidade Topográfica.

**Fórmula:**
```
TWI = ln(a / tan(β))

Onde:
a = área específica de contribuição (flow acc × cell size)
β = declive local (em radianos)
```

**Interpretação:**
| TWI | Significado |
|-----|-------------|
| Alto (>10) | Zonas de acumulação de água (vales, planícies) |
| Médio (5-10) | Encostas médias |
| Baixo (<5) | Cumes, zonas bem drenadas |

**Outputs:**
- Raster TWI
- Classificação em classes
- Correlação com zonas húmidas conhecidas

**Usos:**
- Identificar zonas de potencial alagamento
- Input para modelos hidrológicos
- Validar com Paul do Boquilobo

---

### 2.5. ZH-05 - Zonas de Cheia

| Campo | Valor |
|-------|-------|
| **ID** | ZH-05 |
| **Prioridade** | 🟡 Média |
| **Origem** | #539 (Flood Extents) |
| **Dependências** | ZH-00, dados históricos |

**Objectivo:** Mapear zonas com susceptibilidade a cheias.

**Abordagens possíveis:**

**A) Abordagem simplificada (TWI + proximidade):**
```python
flood_susceptibility = f(TWI, distance_to_water, elevation_above_river)
```

**B) Abordagem histórica:**
- Usar registos de cheias passadas
- Sentinel-1 (SAR) durante eventos de cheia
- Notícias e fotografias históricas

**C) Modelação (futuro):**
- HEC-RAS (desktop, não no stack)
- Integrar resultados no WebGIS

**Outputs:**
- Mapa de susceptibilidade (classes)
- Sobreposição com uso do solo
- Estimativa de população/edifícios afectados

---

### 2.6. ZH-06 - Eutrofização Temporal

| Campo | Valor |
|-------|-------|
| **ID** | ZH-06 |
| **Prioridade** | 🟡 Média |
| **Origem** | #372 (Eutrophication) |
| **Dependências** | Nenhuma (dados Sentinel-2) |

**Objectivo:** Monitorizar a eutrofização em massas de água ao longo do tempo.

**Áreas de interesse:**
- Albufeira de Castelo de Bode
- Troços do Rio Almonda
- Troços do Rio Alviela
- Paul do Boquilobo

**Metodologia - Índices:**
```python
# NDWI (Normalized Difference Water Index)
NDWI = (Green - NIR) / (Green + NIR)
     = (B3 - B8) / (B3 + B8)

# Chlorophyll-a proxy (para eutrofização)
# Usando banda Red Edge
Chl_proxy = B5 / B4

# Turbidez (NDTI)
NDTI = (Red - Green) / (Red + Green)
     = (B4 - B3) / (B4 + B3)
```

**Outputs:**
- Série temporal de índices por massa de água
- Mapas de anomalias
- Gráfico de evolução
- **Potencial artigo:** "Evolução da eutrofização em reservatórios do Médio Tejo"

**Processamento:** Google Earth Engine (séries longas)

---

### 2.7. ZH-07 - Reservatórios (Castelo de Bode)

| Campo | Valor |
|-------|-------|
| **ID** | ZH-07 |
| **Prioridade** | 🟡 Média |
| **Origem** | #547 (Water Shortage) |
| **Dependências** | Dados SNIRH |

**Objectivo:** Monitorizar o estado da Albufeira de Castelo de Bode.

**Dados:**
- Níveis (SNIRH - scraping ou API)
- Área de espelho de água (Sentinel-2 NDWI)
- Qualidade da água (se disponível)

**Outputs:**
- Dashboard com nível actual
- Série temporal de níveis
- Variação da área de espelho de água
- Alertas de níveis baixos

**Automação:** Cronjob para actualizar dados diariamente/semanalmente

---

### 2.8. ZH-08 - Upstream/Downstream Interactivo

| Campo | Valor |
|-------|-------|
| **ID** | ZH-08 |
| **Prioridade** | 🔴 Alta |
| **Origem** | #548 |
| **Dependências** | ZH-03 (flow direction) |

**Ver secção 3 para detalhe completo.**

---

### 2.9. ZH-09 - SCIMAP / Poluição Pontual

| Campo | Valor |
|-------|-------|
| **ID** | ZH-09 |
| **Prioridade** | 🟡 Média |
| **Origem** | #109 |
| **Dependências** | ZH-03, dados de lixeiras |

**Objectivo:** Modelar o risco de poluição pontual usando flow direction.

**Dupla abordagem:**

**A) Lixeiras clandestinas:**
```python
# Para cada lixeira conhecida:
1. Buffer de risco imediato
2. Flow path até linha de água
3. Classificar risco por proximidade + flow
```

**B) SCIMAP (a investigar):**
- Ferramenta de modelação de poluição difusa
- Corre em SAGA GIS
- **Investigar:** Viabilidade no stack, dados necessários

**Outputs:**
- Mapa de risco de poluição pontual
- Trajecto de potencial contaminação
- Linhas de água em risco

**Integração:** Com PS-04 (Lixeiras Clandestinas)

---

### 2.10. ZH-10 - Erosão Hídrica / Sedimentação

| Campo | Valor |
|-------|-------|
| **ID** | ZH-10 |
| **Prioridade** | 🟡 Média |
| **Origem** | #524 |
| **Dependências** | ZH-00 (LS factor) |

**Objectivo:** Calcular erosão hídrica e comparar com REN.

**Metodologia:** USLE (ver `06_TEMA1_AGRICULTURA.md` - ZA-06)

**Foco adicional:**
- Comparar resultado com categoria REN "erosão hídrica"
- Identificar discrepâncias
- **Potencial artigo:** "Validação de cartografia de erosão: USLE vs. REN"

**Outputs:**
- Mapa de perda de solo
- Comparação com REN (mapa de concordância/discordância)
- Estatísticas

---

### 2.11. ZH-11 - Comparar Bacias LiDAR vs APA

| Campo | Valor |
|-------|-------|
| **ID** | ZH-11 |
| **Prioridade** | 🟢 Baixa |
| **Origem** | Novo |
| **Dependências** | ZH-02 |

**Objectivo:** Comparar bacias derivadas de LiDAR com bacias oficiais da APA.

**Ver secção 7 para metodologia.**

---

## 3. Funcionalidade Interactiva: Upstream/Downstream

### 3.1. Conceito

**O que é:**
- Utilizador clica num ponto qualquer do mapa
- Sistema calcula e mostra:
  - **Upstream:** Bacia contribuinte (de onde vem a água)
  - **Downstream:** Trajecto até à foz (para onde vai a água)

**Porquê interessante:**
- Interactividade (não é só ver, é interagir)
- Útil para análise de impactos (poluição, etc.)
- Diferenciador no portfolio

### 3.2. Arquitectura

```
┌─────────────────┐
│    FRONTEND     │
│  (Leaflet map)  │
│                 │
│  Click (x, y)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   PYTHON API    │
│   (FastAPI)     │
│                 │
│ /api/watershed  │
│ /api/flowpath   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│    POSTGIS      │
│                 │
│ Flow direction  │
│ Pre-computed    │
│ data            │
└─────────────────┘
```

### 3.3. Implementação - Backend

```python
# src/api/routers/basins.py

from fastapi import APIRouter, Query
from shapely.geometry import Point
import geopandas as gpd

router = APIRouter(prefix="/api/hydrology", tags=["hydrology"])

@router.get("/upstream")
async def get_upstream_basin(
    lon: float = Query(..., description="Longitude"),
    lat: float = Query(..., description="Latitude")
):
    """
    Retorna a bacia contribuinte para um ponto.
    """
    point = Point(lon, lat)
    
    # Converter para coordenadas do raster
    row, col = coords_to_pixel(point)
    
    # Delinear bacia (pysheds ou pre-computed)
    basin = delineate_upstream(row, col)
    
    # Converter para GeoJSON
    return {
        "type": "Feature",
        "geometry": basin.__geo_interface__,
        "properties": {
            "area_km2": basin.area / 1_000_000,
            "pour_point": [lon, lat]
        }
    }

@router.get("/downstream")
async def get_downstream_path(
    lon: float = Query(..., description="Longitude"),
    lat: float = Query(..., description="Latitude")
):
    """
    Retorna o caminho de escoamento até à foz.
    """
    point = Point(lon, lat)
    
    # Calcular flow path
    path = trace_downstream(point)
    
    return {
        "type": "Feature",
        "geometry": {
            "type": "LineString",
            "coordinates": path
        },
        "properties": {
            "length_km": calculate_length(path) / 1000
        }
    }
```

### 3.4. Implementação - Frontend

```javascript
// js/upstream-downstream.js

// Inicializar mapa
const map = L.map('map').setView([39.5, -8.4], 10);

// Layer para resultados
const resultLayer = L.geoJSON(null, {
    style: {
        color: '#0066cc',
        weight: 2,
        fillOpacity: 0.3
    }
}).addTo(map);

// Click handler
map.on('click', async function(e) {
    const {lat, lng} = e.latlng;
    
    // Mostrar loading
    showLoading();
    
    // Chamar API
    const [upstream, downstream] = await Promise.all([
        fetch(`/api/hydrology/upstream?lon=${lng}&lat=${lat}`).then(r => r.json()),
        fetch(`/api/hydrology/downstream?lon=${lng}&lat=${lat}`).then(r => r.json())
    ]);
    
    // Limpar e adicionar resultados
    resultLayer.clearLayers();
    resultLayer.addData(upstream);
    resultLayer.addData(downstream);
    
    // Popup com info
    L.popup()
        .setLatLng(e.latlng)
        .setContent(`
            <b>Bacia contribuinte:</b> ${upstream.properties.area_km2.toFixed(2)} km²<br>
            <b>Distância à foz:</b> ${downstream.properties.length_km.toFixed(2)} km
        `)
        .openOn(map);
    
    hideLoading();
});
```

### 3.5. Optimização

**Problema:** Calcular bacias on-the-fly pode ser lento.

**Soluções:**

1. **Pré-computar bacias para grid:**
   - Dividir área em grid (ex: 500m)
   - Pré-calcular bacia para cada ponto do grid
   - No runtime, usar bacia do ponto mais próximo

2. **Cache de resultados:**
   - Guardar resultados em Redis
   - Key: coordenadas arredondadas
   - TTL: 24h ou permanente

3. **Simplificação de geometrias:**
   - Usar `ST_Simplify` para polígonos grandes
   - Diferentes níveis de detalhe por zoom

---

## 4. Dados e Fontes

### 4.1. Dados Raster

| Dado | Fonte | Uso |
|------|-------|-----|
| MDT LiDAR | DGT | Todas as análises hidrológicas |
| Sentinel-2 | Copernicus | Eutrofização, NDWI |
| Sentinel-1 (SAR) | Copernicus | Detecção de cheias |

### 4.2. Dados Vectoriais

| Dado | Fonte | Uso |
|------|-------|-----|
| Rede hidrográfica | APA/SNIG | Validação |
| Bacias oficiais | APA | Comparação |
| Limites albufeiras | SNIG | Análise reservatórios |
| Lixeiras | PS-04 | Análise poluição |

### 4.3. Dados Tabulares

| Dado | Fonte | Frequência |
|------|-------|------------|
| Níveis albufeiras | SNIRH | Diário |
| Qualidade água | SNIRH | Mensal |
| Caudais | SNIRH | Diário (se disponível) |

### 4.4. SNIRH - Sistema Nacional de Informação de Recursos Hídricos

**URL:** https://snirh.apambiente.pt

**Dados disponíveis:**
- Níveis de albufeiras
- Caudais em estações hidrométricas
- Qualidade da água
- Dados de precipitação

**Acesso:** Web scraping ou API (verificar disponibilidade)

---

## 5. Metodologias

### 5.1. Delineação de Bacias (pysheds)

```python
from pysheds.grid import Grid

def delineate_basin(dem_path: str, pour_point: tuple) -> gpd.GeoDataFrame:
    """
    Delineia a bacia hidrográfica para um pour point.
    
    Args:
        dem_path: Caminho para o DEM
        pour_point: (x, y) coordenadas do ponto de saída
    
    Returns:
        GeoDataFrame com o polígono da bacia
    """
    # Carregar grid
    grid = Grid.from_raster(dem_path)
    dem = grid.read_raster(dem_path)
    
    # Preencher depressões
    pit_filled = grid.fill_pits(dem)
    flooded = grid.fill_depressions(pit_filled)
    inflated = grid.resolve_flats(flooded)
    
    # Flow direction
    fdir = grid.flowdir(inflated)
    
    # Snap pour point para a rede de drenagem
    acc = grid.accumulation(fdir)
    x, y = pour_point
    x_snap, y_snap = grid.snap_to_mask(acc > 100, (x, y))
    
    # Delinear bacia
    catch = grid.catchment(x=x_snap, y=y_snap, fdir=fdir, xytype='coordinate')
    
    # Vectorizar
    shapes = grid.polygonize(catch.astype('int32'))
    
    # Converter para GeoDataFrame
    gdf = gpd.GeoDataFrame.from_features(shapes, crs=grid.crs)
    
    return gdf
```

### 5.2. Trace Downstream

```python
def trace_downstream(dem_path: str, start_point: tuple) -> list:
    """
    Traça o caminho de escoamento de um ponto até à saída.
    
    Returns:
        Lista de coordenadas [(x1,y1), (x2,y2), ...]
    """
    grid = Grid.from_raster(dem_path)
    dem = grid.read_raster(dem_path)
    
    # Preparar DEM
    pit_filled = grid.fill_pits(dem)
    flooded = grid.fill_depressions(pit_filled)
    inflated = grid.resolve_flats(flooded)
    
    # Flow direction
    fdir = grid.flowdir(inflated)
    
    # Trace
    x, y = start_point
    path = grid.flow_trace(x=x, y=y, fdir=fdir, xytype='coordinate')
    
    return path.tolist()
```

### 5.3. Strahler Stream Order

```python
import numpy as np
from scipy import ndimage

def calculate_strahler(flow_dir: np.ndarray, flow_acc: np.ndarray, threshold: int) -> np.ndarray:
    """
    Calcula a ordem de Strahler para a rede de drenagem.
    """
    # Criar máscara da rede de drenagem
    streams = flow_acc > threshold
    
    # Encontrar headwaters (nascentes)
    # São células de stream sem afluentes
    headwaters = find_headwaters(streams, flow_dir)
    
    # Inicializar ordem
    order = np.zeros_like(flow_acc)
    order[headwaters] = 1
    
    # Propagar ordens downstream
    # (implementação simplificada - usar biblioteca apropriada)
    order = propagate_strahler(order, flow_dir, streams)
    
    return order
```

---

## 6. Implementação Técnica

### 6.1. Estrutura de Ficheiros

```
projects/zona-hidrica-bacias/
│
├── README.md
├── followup.md
│
├── notebooks/
│   ├── 01_stream_network.ipynb     # ZH-01
│   ├── 02_basin_delineation.ipynb  # ZH-02
│   ├── 03_twi.ipynb                # ZH-04
│   ├── 04_flood_zones.ipynb        # ZH-05
│   ├── 05_eutrophication.ipynb     # ZH-06
│   ├── 06_reservoirs.ipynb         # ZH-07
│   ├── 07_upstream_downstream.ipynb # ZH-08
│   ├── 08_pollution_risk.ipynb     # ZH-09
│   └── 09_validation.ipynb         # ZH-11
│
├── scripts/
│   ├── hydrology.py
│   ├── stream_order.py
│   ├── upstream_api.py
│   └── eutrophication_gee.py
│
├── data/
│   └── (dados específicos)
│
└── outputs/
    ├── raster/
    ├── vector/
    └── figures/
```

### 6.2. API Endpoints

```python
# Endpoints da API de hidrologia

GET /api/hydrology/upstream?lon=X&lat=Y
    → Retorna bacia contribuinte (GeoJSON)

GET /api/hydrology/downstream?lon=X&lat=Y
    → Retorna flow path (GeoJSON LineString)

GET /api/hydrology/streams?bbox=X1,Y1,X2,Y2&order_min=3
    → Retorna rede de drenagem filtrada por ordem

GET /api/hydrology/basins
    → Retorna todas as bacias (GeoJSON FeatureCollection)

GET /api/hydrology/reservoirs/{id}/level
    → Retorna série temporal de níveis

GET /api/hydrology/reservoirs/{id}/ndwi
    → Retorna série temporal de NDWI
```

---

## 7. Comparação com Dados Oficiais

### 7.1. Objectivo

Comparar as bacias derivadas de LiDAR (ZH-02) com as bacias oficiais da APA para:
- Validar metodologia
- Identificar diferenças
- Potencial artigo/comunicação

### 7.2. Metodologia

```python
def compare_basins(lidar_basins: gpd.GeoDataFrame, 
                   official_basins: gpd.GeoDataFrame) -> dict:
    """
    Compara bacias derivadas com oficiais.
    """
    results = {}
    
    for idx, lidar in lidar_basins.iterrows():
        # Encontrar bacia oficial correspondente
        official = find_matching_basin(lidar, official_basins)
        
        if official is not None:
            # Calcular métricas
            intersection = lidar.geometry.intersection(official.geometry)
            union = lidar.geometry.union(official.geometry)
            
            results[idx] = {
                'iou': intersection.area / union.area,  # Intersection over Union
                'area_diff_pct': (lidar.geometry.area - official.geometry.area) / official.geometry.area * 100,
                'boundary_hausdorff': hausdorff_distance(lidar.geometry.boundary, official.geometry.boundary)
            }
    
    return results
```

### 7.3. Métricas

| Métrica | Descrição | Bom valor |
|---------|-----------|-----------|
| IoU (Intersection over Union) | Sobreposição | > 0.9 |
| Diferença de área (%) | Discrepância de área | < 5% |
| Distância Hausdorff | Diferença de limites | < 50m |

### 7.4. Potencial Artigo

**Título:** "Comparação de bacias hidrográficas derivadas de LiDAR com cartografia oficial: caso de estudo no Médio Tejo"

**Estrutura:**
1. Introdução - importância de cartografia hidrológica precisa
2. Área de estudo
3. Dados e métodos
4. Resultados - métricas de comparação
5. Discussão - causas das diferenças
6. Conclusões

---

## 8. Outputs e Entregas

### 8.1. WebGIS Interactivo

**URL:** `hidrologia.meudominio.pt`

**Funcionalidades:**
- Visualização de todas as camadas hidrológicas
- Ferramenta upstream/downstream (click no mapa)
- Série temporal de reservatórios
- Filtro por ordem de Strahler
- Download de dados

### 8.2. Camadas Publicadas

| Camada | Tipo | Actualização |
|--------|------|--------------|
| Rede drenagem (Strahler) | Vector (Martin) | Estática |
| Bacias | Vector (Martin) | Estática |
| Sub-bacias | Vector (Martin) | Estática |
| TWI | Raster (TiTiler) | Estática |
| Flow direction | Raster (TiTiler) | Estática |
| Eutrofização (actual) | Raster (TiTiler) | Mensal |
| Níveis reservatórios | Tabular (API) | Diário |

### 8.3. Dados para Download

```
medio-tejo-hidrologia-v1.0.zip
├── README.md
├── vector/
│   ├── stream_network.gpkg
│   ├── basins.gpkg
│   └── sub_basins.gpkg
├── raster/
│   ├── twi.cog.tif
│   ├── flow_direction.cog.tif
│   └── flow_accumulation.cog.tif
└── metadata/
    └── methodology.md
```

---

## 9. Comunicação

### 9.1. LinkedIn Post - Upstream/Downstream

**Headline:** "Clica num ponto do mapa e descobre de onde vem (e para onde vai) a água 💧"

**Body:**
```
Criei uma ferramenta interactiva de análise hidrológica:

🖱️ Clica em qualquer ponto do mapa
📍 Vê a bacia contribuinte (de onde vem a água)
➡️ Vê o trajecto até à foz (para onde vai)

Útil para:
- Análise de impactos de poluição
- Planeamento de bacias
- Educação ambiental

Experimentem em: [link]

Código Python no GitHub.

#GIS #Hidrologia #WebGIS #Python #OpenSource
```

### 9.2. LinkedIn Post - Eutrofização

**Headline:** "Monitorizei a eutrofização dos reservatórios do Médio Tejo com 5 anos de dados Sentinel-2 📊"

**Body:**
```
Usando imagens de satélite Sentinel-2, analisei a evolução 
da eutrofização na Albufeira de Castelo de Bode e outros 
reservatórios do Médio Tejo.

Os resultados mostram:
📈 [insight 1]
📉 [insight 2]
🔍 [insight 3]

Dados processados no Google Earth Engine, visualizáveis 
num dashboard interactivo.

Metodologia e código disponíveis.

#RemoteSensing #Eutrofização #AguasInteriores #GEE
```

### 9.3. Artigo Blog

**Título:** "Análise hidrológica com Python: da extracção de bacias à ferramenta web interactiva"

**Secções:**
1. Introdução à análise hidrológica
2. Dados: MDT LiDAR da DGT
3. Processamento com pysheds
4. Criação da API
5. Frontend interactivo
6. Resultados e validação

---

## 10. Investigações Pendentes

### 10.1. SCIMAP

**O que é:** Ferramenta de modelação de poluição difusa.

**Questões a investigar:**
- [ ] Corre em SAGA GIS - é pesado para o stack?
- [ ] Quais os dados de entrada necessários?
- [ ] Existe alternativa Python?
- [ ] Vale a pena o esforço?

### 10.2. API DGT para LiDAR

**Questão:** É possível aceder ao LiDAR via API/WCS em vez de download manual?

**A investigar:**
- [ ] Serviços WCS da DGT
- [ ] Processamento on-demand

### 10.3. HEC-RAS Integration

**O que é:** Software de modelação hidráulica (USACE).

**Questão:** É possível integrar resultados HEC-RAS no WebGIS?

**Abordagem:**
- Modelação em desktop (HEC-RAS)
- Exportar resultados (shapefiles de manchas de inundação)
- Importar para PostGIS e publicar

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `03_AREA_ESTUDO.md` - Definição das bacias
- `04_BACKLOG_PROJECTOS.md` - Lista de projectos ZH-*
- `05_PROJECTO_BASE_BIOFISICO.md` - Dados base (ZH-00)
- `06_TEMA1_AGRICULTURA.md` - Erosão agrícola relacionada

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
