# 12 - ANCHOR PROJECTS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [⭐1 PS-07 - Regeneração Pós-Fogo (Tese de Mestrado)](#2-1-ps-07---regeneração-pós-fogo-tese-de-mestrado)
3. [⭐2 PB-00 - Caracterização Biofísica](#3-2-pb-00---caracterização-biofísica)
4. [⭐3 NU-00 - Atlas Urbano Interactivo](#4-3-nu-00---atlas-urbano-interactivo)
5. [⭐4 NA-00 - Observatório Agrícola + RAMSAR](#5-4-na-00---observatório-agrícola--ramsar)
6. [⭐5 NF-00 - Índice de Vulnerabilidade Global](#6-5-nf-00---índice-de-vulnerabilidade-global)
7. [Matriz Comparativa](#7-matriz-comparativa)
8. [Cronograma e Dependências](#8-cronograma-e-dependências)
9. [Comunicação Integrada](#9-comunicação-integrada)

---

## 1. Visão Geral

### 1.1. O que são Anchor Projects?

Os **Anchor Projects** são os projectos âncora do portfolio — os mais completos, diferenciadores e com maior potencial de comunicação. São os projectos que:

- **Demonstram competência técnica** abrangente
- **Têm narrativa forte** para comunicação
- **Integram múltiplas análises** num output coerente
- **São diferenciadores** no mercado
- **Alimentam outros projectos** do portfolio

### 1.2. Os 5 Anchor Projects

| Rank | ID | Nome | Núcleo | Justificação Principal |
|------|-----|------|--------|----------------------|
| ⭐**1** | **PS-07/NF-01** | **Regeneração Pós-Fogo (Tese)** | Florestal | Tese pessoal, série temporal 10 anos |
| ⭐**2** | **PB-00** | **Caracterização Biofísica** | Base | Alimenta todos os outros, open data |
| ⭐**3** | **NU-00** | **Atlas Urbano Interactivo** | Urbano | Dashboard integrado, muito visual |
| ⭐**4** | **NA-00** | **Observatório Agrícola + RAMSAR** | Agrícola | Agricultura + conservação + água |
| ⭐**5** | **NF-00** | **Vulnerabilidade Global** | Riscos | Multi-risco integrado |

### 1.3. Critérios de Selecção

| Critério | Peso | Descrição |
|----------|------|-----------|
| **Impacto Portfolio** | 30% | Visibilidade, comunicabilidade |
| **Aprendizagem Técnica** | 25% | Skills desenvolvidas |
| **Dependências** | 20% | Alimenta outros projectos |
| **Facilidade** | 15% | Dados disponíveis, complexidade |
| **Interesse Pessoal** | 10% | Motivação |

---

## 2. ⭐1 PS-07 - Regeneração Pós-Fogo (Tese de Mestrado)

### 2.1. Ficha Técnica

| Campo | Valor |
|-------|-------|
| **ID** | PS-07 / NF-01 |
| **Nome** | Regeneração Pós-Fogo |
| **Tipo** | **Projecto (Tese de Mestrado)** |
| **Núcleo** | Florestal e Riscos (NF-) |
| **Prioridade** | 🔴 **MÁXIMA** |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Duração Estimada** | 12 meses |

### 2.2. Porquê #1?

| Razão | Descrição |
|-------|-----------|
| **Tese pessoal** | Requisito académico, investimento pessoal máximo |
| **Série temporal** | 10 anos de dados (2015-2025) demonstra análise temporal avançada |
| **Google Earth Engine** | Demonstra competência em cloud computing geoespacial |
| **Metodologia científica** | Reproduzível, publicável |
| **Alta comunicabilidade** | Incêndios são tema mediático em Portugal |

### 2.3. Título Proposto

**"Análise da regeneração da vegetação pós-incêndio no Médio Tejo: uma abordagem multitemporal por detecção remota"**

### 2.4. Objectivos

| # | Objectivo |
|---|-----------|
| 1 | Caracterizar a dinâmica de regeneração pós-fogo usando índices espectrais |
| 2 | Identificar factores que influenciam a velocidade de recuperação |
| 3 | Comparar diferentes tipos de vegetação/ocupação do solo |
| 4 | Desenvolver indicadores de sucesso de regeneração |
| 5 | Criar ferramenta de visualização e consulta |

### 2.5. Metodologia

```
┌─────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW TESE PS-07                              │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  FASE 1: SELECÇÃO ÁREAS ARDIDAS                                    │
│  ├── Perímetros ICNF (2013-2023)                                   │
│  ├── Filtrar por área (>100 ha)                                    │
│  └── Filtrar por localização (área de estudo)                      │
│                                                                     │
│  FASE 2: SÉRIES TEMPORAIS (GEE)                                    │
│  ├── Sentinel-2: 2015-2025 (10 anos)                               │
│  ├── Landsat 8/9: 2013-2025 (retrocompatibilidade)                 │
│  ├── Composição mensal (mediana)                                   │
│  └── Índices: NDVI, NBR, NDMI                                      │
│                                                                     │
│  FASE 3: ANÁLISE REGENERAÇÃO                                       │
│  ├── Trajectórias de recuperação por área                          │
│  ├── Tempo até recuperação (50%, 80%, 100%)                        │
│  ├── Comparação com áreas controlo (não ardidas)                   │
│  └── Análise por classe de severidade                              │
│                                                                     │
│  FASE 4: FACTORES EXPLICATIVOS                                     │
│  ├── Severidade do fogo (dNBR)                                     │
│  ├── Ocupação pré-fogo (COS)                                       │
│  ├── Topografia (declive, exposição, altitude)                     │
│  ├── Clima (precipitação pós-fogo)                                 │
│  └── Gestão pós-fogo (se dados disponíveis)                        │
│                                                                     │
│  FASE 5: MODELAÇÃO                                                 │
│  ├── Regressão: Tempo_recuperação ~ Factores                       │
│  ├── Random Forest: classificação sucesso/insucesso                │
│  └── Validação cruzada                                             │
│                                                                     │
│  FASE 6: WEBGIS + DASHBOARD                                        │
│  ├── Mapa áreas ardidas (seleccionável por ano)                    │
│  ├── Série temporal NDVI/NBR por área                              │
│  ├── Comparação entre áreas                                        │
│  └── Download de dados                                             │
│                                                                     │
│  FASE 7: ENTREGAS ACADÉMICAS                                       │
│  ├── Dissertação                                                   │
│  ├── Defesa pública                                                │
│  └── Artigo científico (se aceite)                                 │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 2.6. Índices Espectrais

| Índice | Fórmula | Uso |
|--------|---------|-----|
| **NDVI** | (NIR - Red) / (NIR + Red) | Vigor vegetação |
| **NBR** | (NIR - SWIR2) / (NIR + SWIR2) | Severidade fogo |
| **dNBR** | NBR_pre - NBR_post | Delta severidade |
| **RdNBR** | dNBR / √(NBR_pre) | Normalizado |
| **NDMI** | (NIR - SWIR1) / (NIR + SWIR1) | Humidade vegetação |

### 2.7. Classes de Severidade (dNBR)

| Classe | dNBR | Descrição |
|--------|------|-----------|
| Não ardido | < 0.1 | Sem alteração |
| Baixa | 0.1 - 0.27 | Danos ligeiros |
| Moderada-baixa | 0.27 - 0.44 | Danos moderados |
| Moderada-alta | 0.44 - 0.66 | Danos significativos |
| Alta | > 0.66 | Danos severos |

### 2.8. Cronograma (12 meses)

| Mês | Actividade | Entrega |
|-----|------------|---------|
| 1-2 | Revisão literatura | Estado da arte |
| 3 | Preparação dados | Dataset limpo |
| 4-5 | Processamento GEE | Séries temporais |
| 6-7 | Análise estatística | Resultados |
| 8 | Desenvolvimento WebGIS | Dashboard |
| 9-11 | Escrita dissertação | Versão final |
| 12 | Revisão + Defesa | Aprovação |

### 2.9. Outputs

| Output | Formato | Audiência |
|--------|---------|-----------|
| Dissertação | PDF | Académica |
| WebGIS | Web | Pública |
| Artigo científico | PDF | Académica |
| LinkedIn posts | Social | Profissional |
| Blog tutorial | Web | Técnica |
| Código GitHub | Git | Técnica |

### 2.10. Tecnologias

| Componente | Tecnologia |
|------------|------------|
| Processamento | Google Earth Engine |
| Estatística | Python (scipy, scikit-learn) |
| WebGIS | Leaflet + React |
| Backend | FastAPI + PostGIS |
| Tiles | COG + TiTiler |

---

## 3. ⭐2 PB-00 - Caracterização Biofísica

### 3.1. Ficha Técnica

| Campo | Valor |
|-------|-------|
| **ID** | PB-00 |
| **Nome** | Caracterização Biofísica da Área de Estudo |
| **Tipo** | **Projecto Base** |
| **Núcleo** | Transversal (Base) |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Duração Estimada** | 4-6 semanas |

### 3.2. Porquê #2?

| Razão | Descrição |
|-------|-----------|
| **Alimenta todos os outros** | Base de dados para ~90 projectos |
| **Demonstra fundamentos** | Processamento de MDT, derivados |
| **Open data** | Dados disponíveis para download |
| **Reproduzível** | Scripts Python no GitHub |
| **Primeiro a fazer** | Pré-requisito para quase tudo |

### 3.3. Camadas Incluídas

| ID | Camada | Tipo | Descrição |
|----|--------|------|-----------|
| PB-01 | MDT | Raster | Modelo Digital de Terreno 2m |
| PB-02 | Declive | Raster | Inclinação (graus/%) |
| PB-03 | Exposição | Raster | Orientação das vertentes |
| PB-04 | Curvatura | Raster | Curvatura do terreno |
| PB-05 | Curvas de Nível | Vector | Isolinhas altimétricas |
| PB-06 | Hillshade | Raster | Relevo sombreado |
| PB-07 | TWI | Raster | Topographic Wetness Index |
| PB-08 | TPI | Raster | Topographic Position Index |
| PB-09 | TRI | Raster | Topographic Ruggedness Index |
| PB-10 | Flow Direction | Raster | Direcção de escoamento |
| PB-11 | Flow Accumulation | Raster | Acumulação de fluxo |
| PB-12 | Bacias Hidrográficas | Vector | Derivadas do LiDAR |
| PB-13 | Rede de Drenagem | Vector | Linhas de água |
| PB-14 | Stream Order | Vector | Hierarquia Strahler |
| PB-15 | Landforms | Raster | Classificação automática |

### 3.4. Workflow

```
┌─────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW PB-00                                   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. DOWNLOAD                                                        │
│     ├── MDT LiDAR 2m (DGT)                                         │
│     ├── Limites área de estudo                                     │
│     └── Dados auxiliares (COS, limites admin)                      │
│                                                                     │
│  2. PRÉ-PROCESSAMENTO                                              │
│     ├── Mosaico de tiles                                           │
│     ├── Recorte por área de estudo                                 │
│     ├── Verificação/correção de valores                            │
│     └── Conversão para COG                                         │
│                                                                     │
│  3. DERIVADOS TOPOGRÁFICOS                                         │
│     ├── Declive (richdem)                                          │
│     ├── Exposição (richdem)                                        │
│     ├── Curvatura (richdem)                                        │
│     ├── Hillshade (rasterio)                                       │
│     ├── TWI (pysheds)                                              │
│     ├── TPI (richdem)                                              │
│     └── TRI (richdem)                                              │
│                                                                     │
│  4. DERIVADOS HIDROLÓGICOS                                         │
│     ├── Fill sinks (pysheds)                                       │
│     ├── Flow direction (pysheds)                                   │
│     ├── Flow accumulation (pysheds)                                │
│     ├── Extracção rede drenagem                                    │
│     ├── Stream order (Strahler)                                    │
│     └── Delimitação bacias                                         │
│                                                                     │
│  5. CLASSIFICAÇÕES                                                 │
│     ├── Landform classification (TPI)                              │
│     ├── Reclassificação declives                                   │
│     └── Classes de exposição                                       │
│                                                                     │
│  6. PUBLICAÇÃO                                                     │
│     ├── Raster → COG → TiTiler                                     │
│     ├── Vector → PostGIS → Martin                                  │
│     ├── Metadados (ISO 19115)                                      │
│     └── Download page                                              │
│                                                                     │
│  7. DOCUMENTAÇÃO                                                   │
│     ├── README com metodologia                                     │
│     ├── Scripts Python (GitHub)                                    │
│     ├── Jupyter notebooks                                          │
│     └── Blog post tutorial                                         │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 3.5. Implementação Python

```python
import richdem as rd
import pysheds
from pysheds.grid import Grid
import rasterio
import numpy as np

def process_dem(dem_path, output_dir):
    """
    Processa MDT e gera todos os derivados.
    """
    # Carregar MDT
    dem = rd.LoadGDAL(dem_path)
    
    # 1. Derivados topográficos
    slope = rd.TerrainAttribute(dem, attrib='slope_degrees')
    aspect = rd.TerrainAttribute(dem, attrib='aspect')
    curvature = rd.TerrainAttribute(dem, attrib='curvature')
    
    # 2. Índices topográficos
    tpi = calculate_tpi(dem, radius=10)
    tri = rd.TerrainAttribute(dem, attrib='tri')
    
    # 3. Hidrologia (pysheds)
    grid = Grid.from_raster(dem_path)
    dem_filled = grid.fill_depressions(dem)
    fdir = grid.flowdir(dem_filled)
    acc = grid.accumulation(fdir)
    
    # 4. TWI
    twi = np.log((acc + 1) / np.tan(np.radians(slope) + 0.001))
    
    # 5. Rede de drenagem
    streams = grid.extract_river_network(fdir, acc, threshold=1000)
    
    # Guardar outputs...
    return outputs

def calculate_tpi(dem, radius=10):
    """
    Topographic Position Index.
    """
    from scipy.ndimage import uniform_filter
    mean_elev = uniform_filter(dem, size=radius*2+1)
    tpi = dem - mean_elev
    return tpi
```

### 3.6. Outputs

| Output | Formato | Acesso |
|--------|---------|--------|
| 15 camadas raster | COG | TiTiler |
| 4 camadas vector | PostGIS | Martin MVT |
| Download pack | GeoTIFF + GPKG | Página web |
| Scripts | Python | GitHub |
| Documentação | Markdown | Blog |

---

## 4. ⭐3 NU-00 - Atlas Urbano Interactivo

### 4.1. Ficha Técnica

| Campo | Valor |
|-------|-------|
| **ID** | NU-00 |
| **Nome** | Atlas Urbano Interactivo |
| **Tipo** | **Projecto (Dashboard)** |
| **Núcleo** | Urbano (NU-) |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌐 Online |
| **Duração Estimada** | 4-6 semanas |

### 4.2. Porquê #3?

| Razão | Descrição |
|-------|-----------|
| **Muito visual** | Dashboard interactivo impressiona |
| **Ferramentas diferenciadas** | Isócronas, walkshed, viewshed |
| **Demonstra pgRouting** | Competência em routing |
| **Aplicável a qualquer cidade** | Metodologia replicável |
| **Útil para decisores** | Planeamento urbano real |

### 4.3. Componentes Integrados

| ID | Componente | Tipo | Descrição |
|----|------------|------|-----------|
| NU-05 | **Isócronas** | Ferramenta | Áreas alcançáveis em X minutos |
| NU-08 | **Walkshed** | Ferramenta | Área acessível a pé |
| NU-12 | **Travel Time** | Ferramenta | Tempo de viagem entre pontos |
| NU-01 | Viewshed | Análise | Visibilidade de pontos |
| NU-15 | Food Deserts | Camada | Zonas sem acesso a supermercados |
| NU-16 | Healthcare Access | Camada | Acesso a cuidados de saúde |
| NU-10 | Space Syntax | Análise | Integração da rede viária |

### 4.4. Funcionalidades do Dashboard

```
┌─────────────────────────────────────────────────────────────────────┐
│                    ATLAS URBANO - INTERFACE                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │                                                         │       │
│  │                      MAPA PRINCIPAL                     │       │
│  │                                                         │       │
│  │    [Clicar para gerar isócronas]                       │       │
│  │                                                         │       │
│  │         ┌───┐                                          │       │
│  │         │ × │ ← Ponto clicado                          │       │
│  │         └───┘                                          │       │
│  │      ╱─────╲                                           │       │
│  │     ╱ 5 min ╲                                          │       │
│  │    ╱─────────╲                                         │       │
│  │   ╱  10 min   ╲                                        │       │
│  │  ╱─────────────╲                                       │       │
│  │                                                         │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐               │
│  │   ISÓCRONAS  │ │   WALKSHED   │ │  VIEWSHED    │               │
│  │              │ │              │ │              │               │
│  │ Modo: 🚶🚗🚴 │ │ Tempo: 15min │ │ Raio: 5km    │               │
│  │ Tempos:      │ │ Barreiras: ✓ │ │ Altura: 1.7m │               │
│  │ [5,10,15,20] │ │              │ │              │               │
│  └──────────────┘ └──────────────┘ └──────────────┘               │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │                   ESTATÍSTICAS                          │       │
│  │                                                         │       │
│  │  População alcançável: 12,450 hab                      │       │
│  │  Área: 3.2 km²                                         │       │
│  │  Serviços na área: 15 🏥 8 🏫 23 🛒                    │       │
│  │                                                         │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 4.5. API Endpoints

```python
# FastAPI endpoints para Atlas Urbano

@app.get("/api/isochrone")
async def get_isochrone(
    lat: float,
    lon: float,
    mode: str = "walk",  # walk, drive, bike
    times: List[int] = [5, 10, 15, 20],  # minutos
):
    """
    Gera isócronas a partir de um ponto.
    """
    return generate_isochrone(lat, lon, mode, times)

@app.get("/api/walkshed")
async def get_walkshed(
    lat: float,
    lon: float,
    time: int = 15,  # minutos
    include_barriers: bool = True,
):
    """
    Gera área acessível a pé considerando barreiras.
    """
    return generate_walkshed(lat, lon, time, include_barriers)

@app.get("/api/travel-time")
async def get_travel_time(
    origin_lat: float,
    origin_lon: float,
    dest_lat: float,
    dest_lon: float,
    mode: str = "drive",
):
    """
    Calcula tempo de viagem entre dois pontos.
    """
    return calculate_travel_time(origin, dest, mode)

@app.get("/api/viewshed")
async def get_viewshed(
    lat: float,
    lon: float,
    radius: int = 5000,  # metros
    observer_height: float = 1.7,  # metros
):
    """
    Calcula área visível a partir de um ponto.
    """
    return calculate_viewshed(lat, lon, radius, observer_height)
```

### 4.6. pgRouting Setup

```sql
-- Preparação da rede viária para pgRouting

-- 1. Importar dados OSM
osm2pgrouting --f portugal-latest.osm.pbf \
              --conf mapconfig.xml \
              --dbname webgis \
              --prefix osm

-- 2. Criar topologia
SELECT pgr_createTopology('osm_ways', 0.00001, 'the_geom', 'gid');

-- 3. Função para isócronas
CREATE OR REPLACE FUNCTION get_isochrone(
    start_lon FLOAT,
    start_lat FLOAT,
    max_minutes INT,
    mode TEXT DEFAULT 'walk'
)
RETURNS TABLE(minutes INT, geom GEOMETRY) AS $$
DECLARE
    start_node INT;
    speed FLOAT;
BEGIN
    -- Velocidade por modo (km/h)
    speed := CASE mode
        WHEN 'walk' THEN 5.0
        WHEN 'bike' THEN 15.0
        WHEN 'drive' THEN 50.0
        ELSE 5.0
    END;
    
    -- Encontrar nó mais próximo
    SELECT id INTO start_node
    FROM osm_ways_vertices_pgr
    ORDER BY the_geom <-> ST_SetSRID(ST_Point(start_lon, start_lat), 4326)
    LIMIT 1;
    
    -- Calcular isócrona
    RETURN QUERY
    SELECT 
        (agg_cost * 60 / speed)::INT as minutes,
        ST_ConcaveHull(ST_Collect(the_geom), 0.8) as geom
    FROM pgr_drivingDistance(
        'SELECT gid as id, source, target, cost, reverse_cost FROM osm_ways',
        start_node,
        max_minutes * speed / 60,  -- converter para km
        directed := true
    ) dd
    JOIN osm_ways_vertices_pgr v ON dd.node = v.id
    GROUP BY (agg_cost * 60 / speed)::INT;
END;
$$ LANGUAGE plpgsql;
```

### 4.7. Outputs

| Output | Descrição |
|--------|-----------|
| **Dashboard web** | atlas.meudominio.pt |
| **API REST** | Endpoints documentados |
| **Camadas estáticas** | Food deserts, healthcare access |
| **Tutorial** | Blog + vídeo |

---

## 5. ⭐4 NA-00 - Observatório Agrícola + RAMSAR

### 5.1. Ficha Técnica

| Campo | Valor |
|-------|-------|
| **ID** | NA-00 |
| **Nome** | Observatório Agrícola da Lezíria + RAMSAR |
| **Tipo** | **Projecto (Dashboard)** |
| **Núcleo** | Agrícola (NA-) |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Duração Estimada** | 4-6 semanas |

### 5.2. Porquê #4?

| Razão | Descrição |
|-------|-----------|
| **Agricultura + Conservação** | Duas vertentes num projecto |
| **Paul do Boquilobo** | Zona RAMSAR, interesse ambiental |
| **Séries temporais** | NDVI, soil moisture, clima |
| **Automação** | Dados actualizados automaticamente |
| **Contacto autarquias** | CM Golegã, ICNF |

### 5.3. Componentes Integrados

| ID | Componente | Tipo | Descrição |
|----|------------|------|-----------|
| NA-01 | Precision Farming | Camada | NDVI, SMAP, IFAP |
| NA-02 | **Water Stress** | Camada | NDVI temporal anomalias |
| NA-04 | Poluição Difusa | Camada | Risco por uso do solo |
| NA-05 | Drought Monitoring | Camada | Índices de seca |
| NA-09 | NDVI Temporal | Camada | Média por zona/freguesia |
| NA-10 | Erosão USLE | Camada | Perda de solo |
| - | **RAMSAR Buffer** | Análise | Impacto da agricultura |

### 5.4. Dashboard Layout

```
┌─────────────────────────────────────────────────────────────────────┐
│              OBSERVATÓRIO AGRÍCOLA DA LEZÍRIA                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌───────────────────────────────────┐ ┌─────────────────────────┐ │
│  │                                   │ │   INDICADORES ACTUAIS   │ │
│  │         MAPA PRINCIPAL            │ │                         │ │
│  │                                   │ │  NDVI médio: 0.72 ▲     │ │
│  │   [Camadas toggle]                │ │  Stress hídrico: 23%    │ │
│  │   ☑ NDVI actual                   │ │  Área irrigada: 45%     │ │
│  │   ☐ Anomalia NDVI                 │ │  Índice seca: Moderado  │ │
│  │   ☐ Soil moisture                 │ │                         │ │
│  │   ☐ Poluição difusa               │ │  Última actualização:   │ │
│  │   ☐ Paul do Boquilobo             │ │  2025-01-28 06:00       │ │
│  │                                   │ │                         │ │
│  └───────────────────────────────────┘ └─────────────────────────┘ │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                    SÉRIE TEMPORAL NDVI                       │   │
│  │                                                              │   │
│  │  0.8 ┤                    ╭──╮      ╭──╮                     │   │
│  │      │                 ╭─╯  ╰╮  ╭─╯  ╰─╮                    │   │
│  │  0.6 ┤    ╭──╮      ╭─╯      ╰─╯        ╰╮                  │   │
│  │      │ ╭─╯  ╰╮  ╭─╯                      ╰─╮                │   │
│  │  0.4 ┤╯      ╰─╯                            ╰               │   │
│  │      │                                                       │   │
│  │  0.2 ┼──────────────────────────────────────────────────    │   │
│  │      Jan  Mar  Mai  Jul  Set  Nov  Jan  Mar                 │   │
│  │                                                              │   │
│  │      ── 2024  ── 2023  ── Média histórica                   │   │
│  │                                                              │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                    PAUL DO BOQUILOBO                         │   │
│  │                                                              │   │
│  │  Área inundada actual: 234 ha (67% do máximo)               │   │
│  │  NDWI: 0.45 (normal para época)                             │   │
│  │  Buffer agrícola: 12% stress alto                           │   │
│  │                                                              │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 5.5. Automação (Cronjobs)

```python
# Cronjob diário para actualização de dados

from datetime import datetime, timedelta
import ee

def update_agricultural_data():
    """
    Actualiza dados agrícolas diariamente.
    Corre às 06:00 UTC.
    """
    
    # 1. NDVI Sentinel-2 (última imagem sem nuvens)
    ndvi = get_latest_ndvi(
        area=study_area,
        max_cloud=20,
        days_back=10
    )
    
    # 2. Soil Moisture (SMAP)
    soil_moisture = get_smap_data(
        area=study_area,
        date=datetime.now() - timedelta(days=2)
    )
    
    # 3. Anomalia NDVI
    ndvi_anomaly = calculate_ndvi_anomaly(
        current_ndvi=ndvi,
        historical_mean=get_historical_mean(datetime.now().month)
    )
    
    # 4. NDWI Paul do Boquilobo
    ndwi = get_ndwi_ramsar(
        area=paul_boquilobo,
        date=datetime.now()
    )
    
    # 5. Actualizar PostGIS
    update_database(ndvi, soil_moisture, ndvi_anomaly, ndwi)
    
    # 6. Gerar tiles
    regenerate_tiles()
    
    # 7. Log
    log_update(datetime.now())

# Crontab: 0 6 * * * python /app/scripts/update_agricultural.py
```

### 5.6. Outputs

| Output | Descrição |
|--------|-----------|
| **Dashboard web** | agricultura.meudominio.pt |
| **Dados automáticos** | Actualização diária |
| **Alertas** | Stress hídrico, seca |
| **Relatório mensal** | PDF automático |
| **API** | Dados para download |

---

## 6. ⭐5 NF-00 - Índice de Vulnerabilidade Global

### 6.1. Ficha Técnica

| Campo | Valor |
|-------|-------|
| **ID** | NF-00 |
| **Nome** | Índice de Vulnerabilidade Global |
| **Tipo** | **Projecto + Camada** |
| **Núcleo** | Florestal e Riscos (NF-) |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Duração Estimada** | 3-4 semanas |

### 6.2. Porquê #5?

| Razão | Descrição |
|-------|-----------|
| **Integra múltiplos riscos** | Incêndios, erosão, cheias, derrocadas |
| **Útil para protecção civil** | Aplicação prática real |
| **Metodologia AHP** | Demonstra análise multicritério |
| **Visual impactante** | Mapa final muito comunicável |
| **Contacto autarquias** | ANEPC, câmaras |

### 6.3. Componentes de Risco

| Componente | Peso | Fonte |
|------------|------|-------|
| **Perigosidade Incêndio** | 35% | NF-08 |
| **Erosão Hídrica (USLE)** | 25% | NA-10 |
| **Susceptibilidade Derrocadas** | 20% | NF-09 |
| **Risco de Cheia** | 20% | NH-05/NH-06 |

### 6.4. Fórmula de Integração

```
VULNERABILIDADE = f(Perigosidade, Exposição, Capacidade)

Onde:
- Perigosidade = combinação ponderada dos riscos naturais
- Exposição = população, edifícios, infraestruturas em risco
- Capacidade = acesso a serviços de emergência

Cálculo:
1. Normalizar cada risco (0-1)
2. Aplicar pesos AHP
3. Combinar: max(fire*0.35, erosion*0.25, landslide*0.20, flood*0.20)
4. Multiplicar por exposição
5. Dividir por capacidade
```

### 6.5. Implementação

```python
import numpy as np
import rasterio

def calculate_global_vulnerability(
    fire_hazard,      # NF-08: Perigosidade incêndio (0-1)
    erosion,          # NA-10: Erosão USLE normalizada (0-1)
    landslide,        # NF-09: Susceptibilidade derrocadas (0-1)
    flood_risk,       # NH-05: Risco de cheia (0-1)
    population,       # Densidade populacional
    buildings,        # Densidade de edifícios
    emergency_access  # Tempo de acesso a bombeiros (min)
):
    """
    Calcula índice de vulnerabilidade global.
    """
    
    # 1. Perigosidade combinada (pesos AHP)
    hazard = np.maximum.reduce([
        fire_hazard * 0.35,
        erosion * 0.25,
        landslide * 0.20,
        flood_risk * 0.20
    ])
    
    # 2. Exposição normalizada
    pop_norm = normalize(population)
    build_norm = normalize(buildings)
    exposure = (pop_norm * 0.6 + build_norm * 0.4)
    
    # 3. Capacidade (inverso do tempo de acesso)
    capacity = 1 / (emergency_access / 60 + 0.1)  # Evitar divisão por zero
    capacity_norm = normalize(capacity)
    
    # 4. Vulnerabilidade final
    vulnerability = (hazard * exposure) / (capacity_norm + 0.1)
    
    # 5. Classificar (5 classes)
    vuln_classes = classify_jenks(vulnerability, n_classes=5)
    
    return vulnerability, vuln_classes

def normalize(array):
    """Normaliza array para 0-1."""
    return (array - array.min()) / (array.max() - array.min())
```

### 6.6. Classes de Vulnerabilidade

| Classe | Valor | Descrição | Cor |
|--------|-------|-----------|-----|
| 1 | 0 - 0.2 | Muito Baixa | Verde escuro |
| 2 | 0.2 - 0.4 | Baixa | Verde claro |
| 3 | 0.4 - 0.6 | Moderada | Amarelo |
| 4 | 0.6 - 0.8 | Alta | Laranja |
| 5 | 0.8 - 1.0 | Muito Alta | Vermelho |

### 6.7. Outputs

| Output | Formato | Descrição |
|--------|---------|-----------|
| Mapa vulnerabilidade | COG | 5 classes |
| Mapas componentes | COG | 4 riscos separados |
| Estatísticas por freguesia | JSON | População em risco |
| Dashboard | Web | Visualização interactiva |
| Relatório | PDF | Para protecção civil |

### 6.8. Comunicação

**LinkedIn post:**
```
🗺️ Mapeei a vulnerabilidade a riscos naturais no Médio Tejo

Combinei 4 tipos de risco:
🔥 Incêndio florestal
🌊 Cheia
⛰️ Derrocada
🏜️ Erosão

Resultado: um mapa único que mostra onde os riscos 
se acumulam e onde a população está mais exposta.

Metodologia: AHP + GIS + dados abertos

#GIS #ProtecçãoCivil #Portugal #Riscos
```

---

## 7. Matriz Comparativa

### 7.1. Comparação de Características

| Característica | PS-07 | PB-00 | NU-00 | NA-00 | NF-00 |
|----------------|-------|-------|-------|-------|-------|
| **Duração** | 12 meses | 4-6 sem | 4-6 sem | 4-6 sem | 3-4 sem |
| **Complexidade** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **GEE** | ✅ | ❌ | ❌ | ✅ | ❌ |
| **pgRouting** | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Automação** | Parcial | ❌ | ❌ | ✅ | ❌ |
| **Dashboard** | ✅ | ❌ | ✅ | ✅ | ✅ |
| **Artigo científico** | ✅ | ❌ | ❌ | Possível | Possível |
| **Contacto autarquias** | Possível | ❌ | ✅ | ✅ | ✅ |

### 7.2. Skills Demonstradas

| Skill | PS-07 | PB-00 | NU-00 | NA-00 | NF-00 |
|-------|-------|-------|-------|-------|-------|
| Processamento raster | ✅ | ✅ | ⚪ | ✅ | ✅ |
| Séries temporais | ✅ | ❌ | ❌ | ✅ | ❌ |
| Cloud computing (GEE) | ✅ | ❌ | ❌ | ✅ | ❌ |
| Network analysis | ❌ | ❌ | ✅ | ❌ | ❌ |
| Análise multicritério | ⚪ | ❌ | ❌ | ❌ | ✅ |
| Dashboards | ✅ | ❌ | ✅ | ✅ | ✅ |
| API development | ⚪ | ⚪ | ✅ | ⚪ | ⚪ |
| Escrita científica | ✅ | ❌ | ❌ | ❌ | ❌ |

**Legenda:** ✅ Principal | ⚪ Secundário | ❌ Não aplicável

---

## 8. Cronograma e Dependências

### 8.1. Diagrama de Dependências

```
                    ┌─────────────┐
                    │   PB-00     │
                    │ Caract.     │
                    │ Biofísica   │
                    └──────┬──────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
         ▼                 ▼                 ▼
   ┌───────────┐    ┌───────────┐    ┌───────────┐
   │   NA-00   │    │   NU-00   │    │   NF-00   │
   │ Obs.Agríc │    │ Atlas Urb │    │ Vulnerab. │
   └───────────┘    └───────────┘    └─────┬─────┘
                                           │
                                     ┌─────┴─────┐
                                     │   PS-07   │
                                     │   TESE    │
                                     │ (usa NF-07│
                                     │  NF-08)   │
                                     └───────────┘
```

### 8.2. Cronograma Sugerido

```
Mês:    1    2    3    4    5    6    7    8    9   10   11   12
        │    │    │    │    │    │    │    │    │    │    │    │
PB-00   ████████                                                   Caracterização Biofísica
        │    │    │    │    │    │    │    │    │    │    │    │
NU-00             ████████                                         Atlas Urbano
        │    │    │    │    │    │    │    │    │    │    │    │
NA-00                  ████████                                    Observatório Agrícola
        │    │    │    │    │    │    │    │    │    │    │    │
NF-00                       ██████                                 Vulnerabilidade Global
        │    │    │    │    │    │    │    │    │    │    │    │
PS-07   ░░░░░░░░░░░░░░░░░░░░████████████████████████████████████  Tese (contínuo)
        │    │    │    │    │    │    │    │    │    │    │    │

Legenda: ████ Execução principal  ░░░░ Trabalho de fundo
```

---

## 9. Comunicação Integrada

### 9.1. Estratégia de Publicação

| Anchor | LinkedIn | Blog | GitHub | Autarquias |
|--------|----------|------|--------|------------|
| PS-07 | 3+ posts | Tutorial GEE | Código completo | ICNF |
| PB-00 | 1-2 posts | Tutorial MDT | Dados + scripts | - |
| NU-00 | 2 posts | Isócronas tutorial | API code | CM Tomar/Abrantes |
| NA-00 | 2 posts | NDVI temporal | Dashboard code | CM Golegã |
| NF-00 | 2 posts | AHP tutorial | Metodologia | ANEPC, câmaras |

### 9.2. Sequência de Publicações

| Ordem | Projecto | Título LinkedIn |
|-------|----------|-----------------|
| 1 | PB-00 | "Criei uma base de dados geográfica open source para o Médio Tejo" |
| 2 | NU-00 | "Onde consegues chegar em 15 minutos? Mapeei a acessibilidade urbana" |
| 3 | NA-00 | "Um observatório agrícola que se actualiza sozinho" |
| 4 | NF-00 | "Onde os riscos naturais se acumulam: mapa de vulnerabilidade" |
| 5 | PS-07 | "10 anos de recuperação florestal em mapas: a minha tese" |

### 9.3. Hashtags Comuns

```
#GIS #WebGIS #OpenData #Portugal #MédioTejo #RemoteSensing 
#SIG #Cartografia #DataVisualization #Geospatial #Maps
```

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Detalhe do PB-00 |
| `06_NUCLEO_AGRICOLA.md` | Detalhe do NA-00 |
| `08_NUCLEO_URBANO.md` | Detalhe do NU-00 |
| `10_NUCLEO_FLORESTAL_RISCOS.md` | Detalhe do NF-00 e PS-07 |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-28 | 1.0 | Documento completo com 5 anchor projects detalhados |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
