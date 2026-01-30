# 07 - NÚCLEO HÍDRICO

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Relação com Projecto Base](#2-relação-com-projecto-base)
3. [Projectos do Núcleo](#3-projectos-do-núcleo)
4. [Funcionalidade Interactiva: Upstream/Downstream](#4-funcionalidade-interactiva-upstreamdownstream)
5. [Dados e Fontes](#5-dados-e-fontes)
6. [Metodologias](#6-metodologias)
7. [Comparação com Dados Oficiais](#7-comparação-com-dados-oficiais)
8. [Implementação Técnica](#8-implementação-técnica)
9. [Outputs e Entregas](#9-outputs-e-entregas)
10. [Comunicação](#10-comunicação)
11. [Investigações Pendentes](#11-investigações-pendentes)

---

## 1. Visão Geral

### 1.1. Identificação do Núcleo

| Campo | Valor |
|-------|-------|
| **Prefixo** | NH- |
| **Nome** | Núcleo Hídrico |
| **Emoji** | 💧 |
| **Área Geográfica** | Bacias Almonda + Alviela + Castelo de Bode |
| **Área aproximada** | ~800 km² |
| **Temática** | Hidrologia, qualidade água, recursos hídricos, clima |

### 1.2. Contexto Territorial

O Núcleo Hídrico cobre **toda a área de estudo** e funciona como base para as outras zonas. Inclui:

- **Bacia do Rio Almonda** (~250 km²) — nascente nas grutas, carso
- **Bacia do Rio Alviela** (~350 km²) — nascente no Alviela, carso
- **Albufeira de Castelo de Bode** (parcial) — abastecimento Lisboa
- **Confluências com o Tejo** — zona terminal

### 1.3. Relevância

| Aspecto | Descrição |
|---------|-----------|
| **Abastecimento** | Castelo de Bode abastece Lisboa |
| **Hidrologia cársica** | Nascentes e aquíferos únicos |
| **Qualidade de água** | Monitorização de eutrofização |
| **Riscos** | Cheias, escassez, poluição |
| **Base para tudo** | Alimenta análises agrícolas, urbanas, etc. |

### 1.4. Temas Principais

- Hidrologia de superfície e subterrânea
- Qualidade de água e eutrofização
- Recursos hídricos e reservatórios
- Riscos de cheia
- Erosão hídrica
- Monitorização climática (ilhas de calor)

---

## 2. Relação com Projecto Base

O **PB-00 (Caracterização Biofísica)** gera camadas que são inputs essenciais para o Núcleo Hídrico:

```
PB-00 (Caracterização Biofísica)
    │
    ├──► NH-01 (Stream Order) — usa flow accumulation
    ├──► NH-02 (Bacias) — usa flow direction
    ├──► NH-03 (Flow Dir/Acc) — derivado directo
    ├──► NH-04 (TWI) — derivado directo
    ├──► NH-05 (Zonas Cheia) — usa MDT + flow
    ├──► NH-09 (Upstream/Downstream) — usa flow dir
    ├──► NH-11 (Erosão Hídrica) — usa LS factor
    └──► NH-13 (Stormwater) — usa MDT urbano
```

**Ver documento:** `05_PROJECTO_BASE_BIOFISICO.md`

---

## 3. Projectos do Núcleo

### 3.1. Tabela Resumo

| ID | Nome | Tipo | Proc. | Prior. | Origem |
|----|------|------|-------|--------|--------|
| NH-01 | Rede Hidrográfica (Strahler) | C | 🖥️→🌐 | 🔴 | #98 |
| NH-02 | Bacias e Sub-bacias | C | 🖥️→🌐 | 🔴 | #525 |
| NH-03 | Flow Direction / Accumulation | C | 🖥️ | 🔴 | #527, #534 |
| NH-04 | TWI | C | 🖥️→🌐 | 🟡 | #526 |
| NH-05 | Zonas de Cheia | C | 🖥️→🌐 | 🟡 | #539 |
| NH-06 | Flood Risk (simples) | C | 🖥️→🌐 | 🟡 | #263 |
| NH-07 | Eutrofização Temporal | C | 🌍+🌐 | 🟡 | #372 |
| NH-08 | Reservatórios (Castelo de Bode) | C+A | 🌍+🌐 | 🟡 | #547 |
| **NH-09** | **Upstream/Downstream Interactivo** | **F** | 🌐 | 🔴 | #548 |
| NH-10 | SCIMAP / Poluição Pontual | C+A | 🖥️→🌐 | 🟡 | #109 |
| NH-11 | Sedimentação / Erosão Hídrica | C | 🖥️→🌐 | 🟡 | #524 |
| NH-12 | Comparar Bacias LiDAR vs APA | A | 🖥️ | 🟢 | Novo |
| NH-13 | Stormwater Runoff (urbano) | C | 🖥️→🌐 | 🟡 | #377 |
| NH-14 | Ilhas de Calor (LST) | C | 🌍+🌐 | 🟡 | #180 |
| NH-15 | Matriz Sensibilidade Ambiental | C | 🖥️→🌐 | 🟡 | #368 |

**Legenda:**
- **Tipo:** F=Ferramenta, P=Projecto, C=Camada, A=Análise
- **Proc.:** 🌐=Online, 🖥️=Desktop, 🌍=GEE
- **Prior.:** 🔴=Alta, 🟡=Média, 🟢=Baixa

---

### 3.2. NH-01 - Rede Hidrográfica (Strahler)

| Campo | Valor |
|-------|-------|
| **ID** | NH-01 |
| **Tipo** | Camada |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #98 (Stream Order) |
| **Dependências** | PB-00 (flow accumulation) |

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

### 3.3. NH-02 - Bacias e Sub-bacias

| Campo | Valor |
|-------|-------|
| **ID** | NH-02 |
| **Tipo** | Camada |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #525 (Catchment Areas) |
| **Dependências** | PB-00 (flow direction) |

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
- Polígonos vectoriais com atributos: Área, Perímetro, Ordem, Curso de água principal

**Comparação:** Ver secção 7 para comparação com bacias oficiais da APA.

---

### 3.4. NH-03 - Flow Direction / Accumulation

| Campo | Valor |
|-------|-------|
| **ID** | NH-03 |
| **Tipo** | Camada |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🖥️ Desktop |
| **Origem** | #527, #534 |
| **Dependências** | PB-00 (DEM) |

**Objectivo:** Calcular direcção e acumulação de fluxo (base para análises hidrológicas).

**Nota:** Este projecto é parte do PB-00 (Projecto Base), mas documentado aqui para completude.

**Outputs:**
- Flow direction raster (D8: valores 1,2,4,8,16,32,64,128)
- Flow accumulation raster (número de células a montante)

**Usos downstream:**
- Input para NH-01 (rede drenagem)
- Input para NH-02 (bacias)
- Input para NH-09 (upstream/downstream)
- Input para NH-04 (TWI)

---

### 3.5. NH-04 - TWI (Topographic Wetness Index)

| Campo | Valor |
|-------|-------|
| **ID** | NH-04 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #526 |
| **Dependências** | PB-00 (DEM, flow accumulation) |

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

### 3.6. NH-05 - Zonas de Cheia

| Campo | Valor |
|-------|-------|
| **ID** | NH-05 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #539 (Flood Extents) |
| **Dependências** | PB-00, dados históricos |

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

**C) Modelação HEC-RAS (futuro):**
- Modelação em desktop (HEC-RAS)
- Exportar resultados (shapefiles de manchas de inundação)
- Integrar no WebGIS

**Outputs:**
- Mapa de susceptibilidade (classes)
- Sobreposição com uso do solo
- Estimativa de população/edifícios afectados

---

### 3.7. NH-06 - Flood Risk (simples)

| Campo | Valor |
|-------|-------|
| **ID** | NH-06 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #263 |
| **Dependências** | NH-04 (TWI), NH-01 (rede drenagem) |

**Objectivo:** Criar índice simplificado de risco de cheia.

**Metodologia:**
```
Risk = f(TWI, proximidade_água, elevação_acima_rio)

Pesos exemplo:
- TWI: 0.4
- Proximidade água: 0.4
- Elevação relativa: 0.2
```

**Diferença para NH-05:** Este é um índice composto, NH-05 é baseado em extensões reais.

---

### 3.8. NH-07 - Eutrofização Temporal

| Campo | Valor |
|-------|-------|
| **ID** | NH-07 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🌐 Online |
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

**Processamento:** Google Earth Engine (séries longas, 5+ anos)

---

### 3.9. NH-08 - Reservatórios (Castelo de Bode)

| Campo | Valor |
|-------|-------|
| **ID** | NH-08 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🌐 Online |
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

### 3.10. NH-09 - Upstream/Downstream Interactivo

| Campo | Valor |
|-------|-------|
| **ID** | NH-09 |
| **Tipo** | **Ferramenta** |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌐 Online |
| **Origem** | #548 |
| **Dependências** | NH-03 (flow direction) |

**Ver secção 4 para detalhe completo.**

Este é um dos projectos mais diferenciadores — uma ferramenta interactiva real, não apenas visualização.

---

### 3.11. NH-10 - SCIMAP / Poluição Pontual

| Campo | Valor |
|-------|-------|
| **ID** | NH-10 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #109 |
| **Dependências** | NH-03 (flow direction), dados de lixeiras |

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

### 3.12. NH-11 - Sedimentação / Erosão Hídrica

| Campo | Valor |
|-------|-------|
| **ID** | NH-11 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #524 |
| **Dependências** | PB-00 (LS factor) |

**Objectivo:** Calcular erosão hídrica e comparar com REN.

**Metodologia:** USLE (ver `06_NUCLEO_AGRICOLA.md` - NA-10)

**Foco adicional neste núcleo:**
- Comparar resultado com categoria REN "erosão hídrica"
- Identificar discrepâncias
- **Potencial artigo:** "Validação de cartografia de erosão: USLE vs. REN"

**Outputs:**
- Mapa de perda de solo
- Comparação com REN (mapa de concordância/discordância)
- Estatísticas por bacia

---

### 3.13. NH-12 - Comparar Bacias LiDAR vs APA

| Campo | Valor |
|-------|-------|
| **ID** | NH-12 |
| **Tipo** | Análise |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop |
| **Origem** | Novo |
| **Dependências** | NH-02 |

**Objectivo:** Comparar bacias derivadas de LiDAR com bacias oficiais da APA.

**Ver secção 7 para metodologia detalhada.**

**Potencial:** Artigo técnico sobre validação metodológica.

---

### 3.14. NH-13 - Stormwater Runoff (urbano)

| Campo | Valor |
|-------|-------|
| **ID** | NH-13 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #377 |
| **Dependências** | PB-00 (MDT LiDAR urbano) |

**Objectivo:** Modelar escoamento de águas pluviais em áreas urbanas.

**Áreas de interesse:**
- Centro de Tomar
- Centro de Abrantes
- Outras áreas urbanas densas

**Metodologia:**
```python
# Factores
runoff = f(
    impermeabilização,    # COS ou OSM buildings
    declive,              # MDT
    flow_accumulation,    # MDT
    infra_drenagem        # Se disponível
)
```

**Outputs:**
- Mapa de acumulação de escoamento urbano
- Identificação de pontos críticos
- Sobreposição com infraestruturas

**Ligação:** Com Núcleo Urbano (NU-)

---

### 3.15. NH-14 - Ilhas de Calor (LST)

| Campo | Valor |
|-------|-------|
| **ID** | NH-14 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | #180 |
| **Dependências** | Nenhuma (Landsat) |

**Objectivo:** Mapear ilhas de calor urbano usando LST (Land Surface Temperature).

**Metodologia:**
```python
# Landsat 8/9 Thermal bands
# Band 10: TIRS 1 (10.6-11.19 μm)

# Conversão DN → Temperatura de Brilho
# Correcção de emissividade
# Análise temporal (verão vs inverno)
```

**Outputs:**
- Mapa de LST médio de verão
- Anomalias (diferença para média regional)
- Série temporal de evolução
- Correlação com uso do solo

**Ligação:** Com Núcleo Urbano (NU-)

---

### 3.16. NH-15 - Matriz Sensibilidade Ambiental

| Campo | Valor |
|-------|-------|
| **ID** | NH-15 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #368 |
| **Dependências** | Várias condicionantes |

**Objectivo:** Criar matriz de sobreposição de condicionantes ambientais.

**Camadas a sobrepor:**
- REN (Reserva Ecológica Nacional)
- RAN (Reserva Agrícola Nacional)
- Áreas Protegidas (ICNF)
- Sítios Natura 2000
- Domínio Público Hídrico
- Zonas inundáveis

**Outputs:**
- Mapa de sensibilidade ambiental (número de condicionantes sobrepostas)
- Identificação de áreas de máxima restrição
- Estatísticas por município

---

## 4. Funcionalidade Interactiva: Upstream/Downstream

### 4.1. Conceito

**O que é:**
- Utilizador clica num ponto qualquer do mapa
- Sistema calcula e mostra:
  - **Upstream:** Bacia contribuinte (de onde vem a água)
  - **Downstream:** Trajecto até à foz (para onde vai a água)

**Porquê diferenciador:**
- Interactividade real (não é só ver, é interagir)
- Útil para análise de impactos (poluição, etc.)
- Demonstra competência técnica (API + PostGIS + Frontend)

### 4.2. Arquitectura

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

### 4.3. API Endpoints

```python
GET /api/hydrology/upstream?lon=X&lat=Y
    → Retorna bacia contribuinte (GeoJSON Polygon)
    → Properties: area_km2, perimeter_km, stream_order

GET /api/hydrology/downstream?lon=X&lat=Y
    → Retorna flow path (GeoJSON LineString)
    → Properties: length_km, destination

GET /api/hydrology/streams?bbox=X1,Y1,X2,Y2&order_min=3
    → Retorna rede de drenagem filtrada por ordem

GET /api/hydrology/basins
    → Retorna todas as bacias (GeoJSON FeatureCollection)

GET /api/hydrology/reservoirs/{id}/level
    → Retorna série temporal de níveis

GET /api/hydrology/reservoirs/{id}/ndwi
    → Retorna série temporal de NDWI
```

### 4.4. Implementação - Backend

```python
# api/routers/hydrology.py
from fastapi import APIRouter, Query
from pysheds.grid import Grid
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
    # Carregar flow direction pré-processado
    grid = Grid.from_raster('data/flow_direction.tif')
    fdir = grid.read_raster('data/flow_direction.tif')
    
    # Snap para rede de drenagem
    acc = grid.read_raster('data/flow_accumulation.tif')
    x_snap, y_snap = grid.snap_to_mask(acc > 100, (lon, lat))
    
    # Delinear bacia
    catch = grid.catchment(x=x_snap, y=y_snap, fdir=fdir, xytype='coordinate')
    
    # Vectorizar
    shapes = grid.polygonize(catch.astype('int32'))
    gdf = gpd.GeoDataFrame.from_features(shapes, crs=grid.crs)
    
    # Calcular área
    gdf_proj = gdf.to_crs('EPSG:3763')
    area_km2 = gdf_proj.geometry.area.sum() / 1e6
    
    return {
        "type": "Feature",
        "geometry": gdf.geometry.unary_union.__geo_interface__,
        "properties": {
            "area_km2": round(area_km2, 2),
            "click_point": [lon, lat]
        }
    }

@router.get("/downstream")
async def get_downstream_path(
    lon: float = Query(..., description="Longitude"),
    lat: float = Query(..., description="Latitude")
):
    """
    Retorna o flow path de um ponto até à saída.
    """
    grid = Grid.from_raster('data/flow_direction.tif')
    fdir = grid.read_raster('data/flow_direction.tif')
    
    # Trace downstream
    path = grid.flow_trace(x=lon, y=lat, fdir=fdir, xytype='coordinate')
    
    # Calcular comprimento
    from shapely.geometry import LineString
    line = LineString(path)
    line_proj = gpd.GeoSeries([line], crs='EPSG:4326').to_crs('EPSG:3763')
    length_km = line_proj.length.sum() / 1000
    
    return {
        "type": "Feature",
        "geometry": {
            "type": "LineString",
            "coordinates": path.tolist()
        },
        "properties": {
            "length_km": round(length_km, 2),
            "start_point": [lon, lat]
        }
    }
```

### 4.5. Implementação - Frontend

```javascript
// js/upstream-downstream.js

// Inicializar mapa
const map = L.map('map').setView([39.5, -8.4], 10);

// Layers base
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

// Layer para resultados
const upstreamLayer = L.geoJSON(null, {
    style: { color: '#0066cc', weight: 2, fillOpacity: 0.3 }
}).addTo(map);

const downstreamLayer = L.geoJSON(null, {
    style: { color: '#cc0000', weight: 3 }
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
    upstreamLayer.clearLayers();
    downstreamLayer.clearLayers();
    
    upstreamLayer.addData(upstream);
    downstreamLayer.addData(downstream);
    
    // Zoom to fit
    const bounds = upstreamLayer.getBounds().extend(downstreamLayer.getBounds());
    map.fitBounds(bounds, { padding: [20, 20] });
    
    // Popup com info
    L.popup()
        .setLatLng(e.latlng)
        .setContent(`
            <b>Bacia contribuinte:</b> ${upstream.properties.area_km2} km²<br>
            <b>Distância à foz:</b> ${downstream.properties.length_km} km
        `)
        .openOn(map);
    
    hideLoading();
});
```

### 4.6. Optimização de Performance

**Problema:** Calcular bacias on-the-fly pode ser lento para áreas grandes.

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

4. **Resposta assíncrona:**
   - Retornar resultado preliminar rápido
   - Refinar em background

---

## 5. Dados e Fontes

### 5.1. Dados Raster

| Dado | Fonte | Resolução | Uso |
|------|-------|-----------|-----|
| MDT LiDAR | DGT | 2m | Todas as análises hidrológicas |
| Sentinel-2 | Copernicus | 10m | Eutrofização, NDWI |
| Sentinel-1 (SAR) | Copernicus | 10m | Detecção de cheias |
| Landsat 8/9 | USGS | 30m | LST, ilhas de calor |

### 5.2. Dados Vectoriais

| Dado | Fonte | Uso |
|------|-------|-----|
| Rede hidrográfica oficial | APA/SNIG | Validação |
| Bacias oficiais | APA | Comparação |
| Limites albufeiras | SNIG | Análise reservatórios |
| Lixeiras | PS-04 | Análise poluição |
| REN | CCDR | Matriz sensibilidade |
| Áreas protegidas | ICNF | Matriz sensibilidade |

### 5.3. Dados Tabulares

| Dado | Fonte | Frequência |
|------|-------|------------|
| Níveis albufeiras | SNIRH | Diário |
| Qualidade água | SNIRH | Mensal |
| Caudais | SNIRH | Diário (se disponível) |
| Precipitação | IPMA/SNIRH | Diário |

### 5.4. SNIRH - Sistema Nacional de Informação de Recursos Hídricos

**URL:** https://snirh.apambiente.pt

**Dados disponíveis:**
- Níveis de albufeiras
- Caudais em estações hidrométricas
- Qualidade da água
- Dados de precipitação

**Acesso:** Web scraping ou API (verificar disponibilidade)

---

## 6. Metodologias

### 6.1. Delineação de Bacias (pysheds)

```python
from pysheds.grid import Grid
import geopandas as gpd

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

### 6.2. Trace Downstream

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

### 6.3. Strahler Stream Order

```python
import numpy as np

def calculate_strahler(flow_dir: np.ndarray, flow_acc: np.ndarray, threshold: int) -> np.ndarray:
    """
    Calcula a ordem de Strahler para a rede de drenagem.
    
    Args:
        flow_dir: Raster de flow direction (D8)
        flow_acc: Raster de flow accumulation
        threshold: Threshold para definir stream
    
    Returns:
        Raster com ordem de Strahler
    """
    # Criar máscara da rede de drenagem
    streams = flow_acc > threshold
    
    # Encontrar headwaters (nascentes)
    headwaters = find_headwaters(streams, flow_dir)
    
    # Inicializar ordem
    order = np.zeros_like(flow_acc)
    order[headwaters] = 1
    
    # Propagar ordens downstream
    order = propagate_strahler(order, flow_dir, streams)
    
    return order

def find_headwaters(streams, flow_dir):
    """Encontra células de stream sem afluentes."""
    # Implementação...
    pass

def propagate_strahler(order, flow_dir, streams):
    """Propaga ordens de Strahler downstream."""
    # Implementação...
    pass
```

### 6.4. TWI (Topographic Wetness Index)

```python
import richdem as rd
import numpy as np

def calculate_twi(dem_path: str, cell_size: float = 2.0) -> np.ndarray:
    """
    Calcula o Topographic Wetness Index.
    
    TWI = ln(a / tan(β))
    
    Args:
        dem_path: Caminho para o DEM
        cell_size: Tamanho da célula em metros
    
    Returns:
        Array com valores de TWI
    """
    dem = rd.LoadGDAL(dem_path)
    
    # Slope em radianos
    slope_rad = np.radians(rd.TerrainAttribute(dem, attrib='slope_degrees'))
    
    # Flow accumulation (specific catchment area)
    # a = (flow_acc + 1) * cell_size
    flow_acc = rd.FlowAccumulation(dem, method='D8')
    specific_area = (flow_acc + 1) * cell_size
    
    # TWI = ln(a / tan(slope))
    # Evitar divisão por zero
    slope_tan = np.tan(slope_rad)
    slope_tan[slope_tan < 0.001] = 0.001
    
    twi = np.log(specific_area / slope_tan)
    
    return twi
```

---

## 7. Comparação com Dados Oficiais

### 7.1. Objectivo

Comparar as bacias derivadas de LiDAR (NH-02) com as bacias oficiais da APA para:
- Validar metodologia
- Identificar diferenças e suas causas
- Potencial artigo/comunicação técnica

### 7.2. Metodologia

```python
import geopandas as gpd
from shapely.ops import hausdorff_distance

def compare_basins(lidar_basins: gpd.GeoDataFrame, 
                   official_basins: gpd.GeoDataFrame) -> dict:
    """
    Compara bacias derivadas com oficiais.
    """
    results = {}
    
    for idx, lidar in lidar_basins.iterrows():
        # Encontrar bacia oficial correspondente (por sobreposição)
        official = find_matching_basin(lidar, official_basins)
        
        if official is not None:
            # Calcular métricas
            intersection = lidar.geometry.intersection(official.geometry)
            union = lidar.geometry.union(official.geometry)
            
            results[idx] = {
                'iou': intersection.area / union.area,
                'area_diff_pct': (lidar.geometry.area - official.geometry.area) / official.geometry.area * 100,
                'boundary_hausdorff': hausdorff_distance(
                    lidar.geometry.boundary, 
                    official.geometry.boundary
                )
            }
    
    return results

def find_matching_basin(lidar_basin, official_basins):
    """Encontra bacia oficial com maior sobreposição."""
    max_overlap = 0
    match = None
    
    for _, official in official_basins.iterrows():
        overlap = lidar_basin.geometry.intersection(official.geometry).area
        if overlap > max_overlap:
            max_overlap = overlap
            match = official
    
    return match
```

### 7.3. Métricas de Comparação

| Métrica | Descrição | Bom valor |
|---------|-----------|-----------|
| IoU (Intersection over Union) | Sobreposição espacial | > 0.9 |
| Diferença de área (%) | Discrepância de área | < 5% |
| Distância Hausdorff | Diferença máxima de limites | < 50m |

### 7.4. Potencial Artigo

**Título:** "Comparação de bacias hidrográficas derivadas de LiDAR com cartografia oficial: caso de estudo no Médio Tejo"

**Estrutura:**
1. Introdução - importância de cartografia hidrológica precisa
2. Área de estudo
3. Dados e métodos (LiDAR 2m vs. cartografia APA)
4. Resultados - métricas de comparação
5. Discussão - causas das diferenças (resolução, algoritmos, datum)
6. Conclusões - quando usar qual

---

## 8. Implementação Técnica

### 8.1. Estrutura de Ficheiros

```
projects/nucleo-hidrico-bacias/
│
├── README.md
├── followup.md
│
├── config/
│   └── params.yaml
│
├── notebooks/
│   ├── 01_stream_network.ipynb      # NH-01
│   ├── 02_basin_delineation.ipynb   # NH-02
│   ├── 03_flow_direction.ipynb      # NH-03
│   ├── 04_twi.ipynb                 # NH-04
│   ├── 05_flood_zones.ipynb         # NH-05
│   ├── 06_eutrophication.ipynb      # NH-07
│   ├── 07_reservoirs.ipynb          # NH-08
│   ├── 08_upstream_downstream.ipynb # NH-09
│   ├── 09_pollution_risk.ipynb      # NH-10
│   ├── 10_erosion.ipynb             # NH-11
│   ├── 11_validation.ipynb          # NH-12
│   ├── 12_stormwater.ipynb          # NH-13
│   ├── 13_heat_islands.ipynb        # NH-14
│   └── 14_sensitivity_matrix.ipynb  # NH-15
│
├── scripts/
│   ├── hydrology.py
│   ├── stream_order.py
│   ├── basin_delineation.py
│   ├── upstream_api.py
│   ├── eutrophication_gee.py
│   └── lst_gee.py
│
├── data/
│   ├── input/
│   └── processed/
│
└── outputs/
    ├── raster/
    ├── vector/
    └── figures/
```

### 8.2. Pipeline de Actualização

Para camadas que mudam periodicamente:

```python
# cronjobs/update_hydrology.py

def update_reservoir_levels():
    """Actualiza níveis de reservatórios (diário)."""
    levels = scrape_snirh_levels()
    save_to_postgis(levels, 'reservoir_levels')
    
def update_eutrophication():
    """Actualiza índices de eutrofização (semanal)."""
    ndwi = get_latest_sentinel2_ndwi()
    chl = calculate_chlorophyll_proxy()
    save_cog(ndwi, 'ndwi_latest.tif')
    save_cog(chl, 'chlorophyll_latest.tif')

def update_flood_detection():
    """Detecta cheias activas (após eventos)."""
    sar = get_latest_sentinel1()
    water_mask = detect_water_sar(sar)
    if significant_change(water_mask):
        send_alert()
        save_to_postgis(water_mask, 'flood_detected')
```

### 8.3. Dependências entre Projectos

```
PB-00 (MDT LiDAR)
    │
    ├── NH-03 (Flow Dir/Acc)
    │       │
    │       ├── NH-01 (Strahler)
    │       ├── NH-02 (Bacias)
    │       │       │
    │       │       └── NH-12 (Validação APA)
    │       │
    │       ├── NH-04 (TWI)
    │       │       │
    │       │       └── NH-05/NH-06 (Flood)
    │       │
    │       └── NH-09 (Upstream/Downstream) ★
    │
    ├── NH-11 (Erosão Hídrica)
    │
    └── NH-13 (Stormwater)

GEE (Sentinel)
    │
    ├── NH-07 (Eutrofização)
    │
    ├── NH-08 (Reservatórios)
    │
    └── NH-14 (Ilhas de Calor)

Condicionantes
    │
    └── NH-15 (Matriz Sensibilidade)
```

---

## 9. Outputs e Entregas

### 9.1. WebGIS Interactivo

**URL:** `hidrologia.meudominio.pt` ou `meudominio.pt/webgis/hidrologia/`

**Funcionalidades:**
- Visualização de todas as camadas hidrológicas
- **Ferramenta upstream/downstream** (click no mapa) ★
- Série temporal de reservatórios
- Filtro por ordem de Strahler
- Download de dados (GeoJSON, GeoTIFF)
- Sobreposição com condicionantes

### 9.2. Camadas Publicadas

| Camada | Tipo | Actualização | Formato |
|--------|------|--------------|---------|
| Rede drenagem (Strahler) | Vector | Estática | PostGIS → Martin |
| Bacias | Vector | Estática | PostGIS → Martin |
| Sub-bacias | Vector | Estática | PostGIS → Martin |
| TWI | Raster | Estática | COG → TiTiler |
| Flow direction | Raster | Estática | COG → TiTiler |
| Zonas cheia | Vector | Estática | PostGIS → Martin |
| Eutrofização (actual) | Raster | Semanal | COG → TiTiler |
| Níveis reservatórios | Tabular | Diário | API |
| LST / Ilhas calor | Raster | Mensal | COG → TiTiler |
| Sensibilidade ambiental | Raster | Estática | COG → TiTiler |

### 9.3. Dados para Download

```
medio-tejo-hidrologia-v1.0.zip
├── README.md
├── LICENSE
├── vector/
│   ├── stream_network.gpkg
│   ├── basins.gpkg
│   ├── sub_basins.gpkg
│   └── flood_zones.gpkg
├── raster/
│   ├── twi.cog.tif
│   ├── flow_direction.cog.tif
│   ├── flow_accumulation.cog.tif
│   └── flood_susceptibility.cog.tif
└── metadata/
    ├── methodology.md
    └── data_dictionary.md
```

---

## 10. Comunicação

### 10.1. LinkedIn Post - Upstream/Downstream

**Headline:** "Clica num ponto do mapa e descobre de onde vem (e para onde vai) a água 💧"

**Body:**
```
Criei uma ferramenta interactiva de análise hidrológica para o Médio Tejo:

🖱️ Clica em qualquer ponto do mapa
📍 Vê a bacia contribuinte (de onde vem a água)
➡️ Vê o trajecto até à foz (para onde vai)

Útil para:
- Análise de impactos de poluição
- Planeamento de bacias
- Educação ambiental

Experimentem em: [link]

Código Python + API FastAPI no GitHub.

#GIS #Hidrologia #WebGIS #Python #OpenSource
```

### 10.2. LinkedIn Post - Eutrofização

**Headline:** "Monitorizei a eutrofização dos reservatórios do Médio Tejo com 5 anos de dados Sentinel-2 📊"

**Body:**
```
Usando imagens de satélite Sentinel-2, analisei a evolução 
da eutrofização na Albufeira de Castelo de Bode e outros 
reservatórios do Médio Tejo.

Os resultados mostram:
📈 [insight 1 - a preencher com resultados]
📉 [insight 2]
🔍 [insight 3]

Dados processados no Google Earth Engine, visualizáveis 
num dashboard interactivo.

Metodologia e código disponíveis.

#RemoteSensing #Eutrofização #AguasInteriores #GEE #Portugal
```

### 10.3. Artigo Blog

**Título:** "Análise hidrológica com Python: da extracção de bacias à ferramenta web interactiva"

**Secções:**
1. Introdução à análise hidrológica com GIS
2. Dados: MDT LiDAR da DGT
3. Processamento com pysheds e richdem
4. Criação da API com FastAPI
5. Frontend interactivo com Leaflet
6. Validação com dados oficiais
7. Conclusões e próximos passos

### 10.4. Potenciais Artigos Técnicos

| Título | Publicação |
|--------|------------|
| "Comparação de bacias LiDAR vs. cartografia oficial" | Revista de Geografia e Ordenamento do Território |
| "Evolução da eutrofização em reservatórios" | Recursos Hídricos (APRH) |
| "Validação de cartografia de erosão: USLE vs. REN" | Finisterra |

---

## 11. Investigações Pendentes

### 11.1. SCIMAP

**O que é:** Ferramenta de modelação de poluição difusa.

**Questões a investigar:**
- [ ] Corre em SAGA GIS - é pesado para o stack?
- [ ] Quais os dados de entrada necessários?
- [ ] Existe alternativa Python?
- [ ] Vale a pena o esforço vs. abordagem simplificada?

### 11.2. API DGT para LiDAR

**Questão:** É possível aceder ao LiDAR via API/WCS em vez de download manual?

**A investigar:**
- [ ] Serviços WCS da DGT
- [ ] Processamento on-demand
- [ ] Custos/limitações

### 11.3. HEC-RAS Integration

**O que é:** Software de modelação hidráulica (USACE).

**Abordagem:**
- Modelação em desktop (HEC-RAS)
- Exportar resultados (shapefiles de manchas de inundação)
- Integrar no WebGIS como camadas estáticas

### 11.4. SNIRH API

**Questão:** Existe API oficial ou é necessário scraping?

**A investigar:**
- [ ] Documentação de API
- [ ] Estrutura das páginas para scraping
- [ ] Frequência de actualização

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Dados base (MDT) - PB-00 |
| `06_NUCLEO_AGRICOLA.md` | Complementar (erosão, poluição difusa) |
| `08_NUCLEO_URBANO.md` | Complementar (stormwater, walkability) |
| `09_NUCLEO_CARSICO.md` | Complementar (hidrologia cársica) |
| `12_ANCHOR_PROJECTS.md` | Detalhe dos Anchor Projects |
| `13_BIBLIOGRAFIA.md` | Referências e metodologias |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial (como 07_TEMA_2-HIDROLOGIA.md) |
| 2025-01-28 | 2.0 | Conversão para Núcleo Hídrico, nova nomenclatura NH-, alinhamento com backlog actualizado, adição de projectos NH-06, NH-13, NH-14, NH-15 |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
