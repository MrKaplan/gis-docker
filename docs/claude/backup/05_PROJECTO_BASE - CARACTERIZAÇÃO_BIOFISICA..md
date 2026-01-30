# 05 - PROJECTO BASE: CARACTERIZAÇÃO BIOFÍSICA

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Objectivos](#2-objectivos)
3. [Dados de Entrada](#3-dados-de-entrada)
4. [Produtos a Gerar](#4-produtos-a-gerar)
5. [Metodologia](#5-metodologia)
6. [Implementação Técnica](#6-implementação-técnica)
7. [Estrutura de Ficheiros](#7-estrutura-de-ficheiros)
8. [Validação e Qualidade](#8-validação-e-qualidade)
9. [Publicação e Partilha](#9-publicação-e-partilha)
10. [Comunicação](#10-comunicação)
11. [Cronograma](#11-cronograma)

---

## 1. Visão Geral

### 1.1. Identificação

| Campo | Valor |
|-------|-------|
| **ID** | ZH-00 |
| **Nome** | Caracterização Biofísica do Médio Tejo |
| **Tipo** | Projecto Base |
| **Prioridade** | 🔴 **MÁXIMA** |
| **Zona** | Toda a área de estudo |

### 1.2. Porquê Prioritário?

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   Este projecto ALIMENTA todos os outros projectos.        │
│   Sem ele, nenhuma análise subsequente é possível.         │
│                                                             │
│   ZH-00 ──► ZH-01 a ZH-11 (Zona Hídrica)                   │
│        ──► ZA-01 a ZA-12 (Zona Agrícola)                   │
│        ──► ZU-01 a ZU-10 (Zona Urbana)                     │
│        ──► ZC-01 a ZC-05 (Zona Cársica)                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 1.3. Conceito

Criar um conjunto de **camadas base derivadas do MDT LiDAR** que servem de input para todas as análises subsequentes. Todo o processamento é feito em **Python**, de forma **reproduzível** e **parametrizável**.

### 1.4. Princípios

| Princípio | Descrição |
|-----------|-----------|
| **Reproduzível** | Scripts Python documentados, qualquer pessoa pode replicar |
| **Parametrizável** | Alterar um valor e regenerar outputs |
| **Open Data** | Dados disponíveis para download público |
| **Open Source** | Código no GitHub |
| **Documentado** | README completo, notebooks comentados |

---

## 2. Objectivos

### 2.1. Objectivos Técnicos

- [ ] Adquirir e processar MDT LiDAR da área de estudo
- [ ] Gerar todos os derivados de terreno standard
- [ ] Gerar todas as camadas hidrológicas base
- [ ] Armazenar em formatos optimizados (COG, PostGIS)
- [ ] Disponibilizar via API/WMS

### 2.2. Objectivos de Aprendizagem

- [ ] Dominar processamento raster com Python (rasterio, richdem)
- [ ] Dominar análise hidrológica com Python (pysheds)
- [ ] Criar pipeline reproduzível
- [ ] Publicar COGs e configurar TiTiler

### 2.3. Objectivos de Portfolio

- [ ] Primeiro projecto completo no portfolio
- [ ] Demonstrar capacidade técnica
- [ ] Criar dados de valor para a comunidade

---

## 3. Dados de Entrada

### 3.1. MDT LiDAR - DGT

| Característica | Valor |
|----------------|-------|
| **Fonte** | Direcção-Geral do Território (DGT) |
| **Produto** | MDT (Modelo Digital de Terreno) |
| **Resolução** | 2 metros |
| **Formato** | GeoTIFF |
| **Sistema de Coordenadas** | PT-TM06/ETRS89 (EPSG:3763) |
| **Licença** | Aberta |

### 3.2. Cobertura Necessária

**Folhas LiDAR a identificar:**
- [ ] Listar folhas que cobrem a área de estudo
- [ ] Estimar tamanho total (~X GB)
- [ ] Verificar disponibilidade no portal DGT

**Portal de download:**
- https://snig.dgterritorio.gov.pt
- Ou via WCS se disponível

### 3.3. Dados Auxiliares

| Dado | Fonte | Uso |
|------|-------|-----|
| Limites área de estudo | `extent.geojson` | Recorte |
| CAOP | DGT | Limites administrativos |
| Rede hidrográfica oficial | APA | Validação |
| Bacias oficiais | APA | Comparação |

---

## 4. Produtos a Gerar

### 4.1. Derivados de Terreno

| Produto | Descrição | Unidades | Biblioteca |
|---------|-----------|----------|------------|
| **DEM** | Modelo Digital de Elevação (recortado) | metros | rasterio |
| **Slope** | Declive | graus ou % | richdem |
| **Aspect** | Exposição/Orientação | graus (0-360) | richdem |
| **Curvature** | Curvatura do terreno | 1/m | richdem |
| **Plan Curvature** | Curvatura em planta | 1/m | richdem |
| **Profile Curvature** | Curvatura de perfil | 1/m | richdem |
| **Hillshade** | Sombreamento | 0-255 | rasterio/GDAL |
| **TRI** | Topographic Ruggedness Index | - | richdem |
| **TPI** | Topographic Position Index | metros | richdem |
| **Roughness** | Rugosidade | metros | GDAL |

### 4.2. Derivados Hidrológicos

| Produto | Descrição | Biblioteca |
|---------|-----------|------------|
| **Filled DEM** | DEM com depressões preenchidas | pysheds/richdem |
| **Flow Direction** | Direcção de escoamento (D8) | pysheds |
| **Flow Accumulation** | Acumulação de fluxo | pysheds |
| **TWI** | Topographic Wetness Index | richdem |
| **Drainage Network** | Rede de drenagem (raster) | pysheds |
| **Stream Order** | Ordem de Strahler | pysheds |
| **Basins** | Bacias hidrográficas | pysheds |
| **Sub-basins** | Sub-bacias | pysheds |
| **Pour Points** | Pontos de saída | pysheds |

### 4.3. Produtos Vectoriais

| Produto | Descrição | Formato |
|---------|-----------|---------|
| **Contours 10m** | Curvas de nível (10m intervalo) | GeoPackage |
| **Contours 50m** | Curvas mestras (50m) | GeoPackage |
| **Drainage Network** | Rede de drenagem vectorizada | GeoPackage |
| **Basins** | Bacias vectorizadas | GeoPackage |
| **Sub-basins** | Sub-bacias vectorizadas | GeoPackage |

### 4.4. Formatos de Saída

| Tipo | Formato | Uso |
|------|---------|-----|
| Raster para análise | GeoTIFF | Processamento local |
| Raster para web | COG (Cloud Optimized GeoTIFF) | TiTiler, visualização |
| Vector | GeoPackage | Análise, QGIS |
| Vector para web | PostGIS | Martin, APIs |

---

## 5. Metodologia

### 5.1. Fluxo de Processamento

```
┌─────────────────┐
│  1. AQUISIÇÃO   │
│  Download MDT   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  2. PRÉ-PROC.   │
│  Mosaico        │
│  Recorte        │
│  Reprojecção    │
└────────┬────────┘
         │
    ┌────┴────┐
    │         │
    ▼         ▼
┌───────┐ ┌───────────┐
│TERRENO│ │HIDROLOGIA │
└───┬───┘ └─────┬─────┘
    │           │
    ▼           ▼
┌───────┐ ┌───────────┐
│Slope  │ │Fill DEM   │
│Aspect │ │Flow Dir   │
│Curv.  │ │Flow Acc   │
│TRI    │ │TWI        │
│TPI    │ │Drainage   │
│Hills. │ │Basins     │
└───┬───┘ └─────┬─────┘
    │           │
    └─────┬─────┘
          │
          ▼
┌─────────────────┐
│  3. VECTORIZAR  │
│  Curvas nível   │
│  Rede drenagem  │
│  Bacias         │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  4. OPTIMIZAR   │
│  Gerar COGs     │
│  Carregar PostGIS│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  5. PUBLICAR    │
│  TiTiler        │
│  Martin         │
│  Download       │
└─────────────────┘
```

### 5.2. Parâmetros Configuráveis

```python
# config.py

PARAMS = {
    # Geral
    "crs": "EPSG:3763",  # PT-TM06/ETRS89
    "resolution": 2,      # metros (ou 5 para versão light)
    
    # Hillshade
    "azimuth": 315,
    "altitude": 45,
    
    # Curvas de nível
    "contour_interval": 10,
    "contour_master": 50,
    
    # Hidrologia
    "flow_acc_threshold": 1000,  # células para definir rede
    "min_basin_area": 1000000,   # m² mínimo para bacia
    
    # TWI
    "twi_method": "dinf",  # ou "d8"
}
```

### 5.3. Gestão de Memória

Para áreas grandes, processar em tiles:

```python
# Estratégia para não exceder memória
TILE_SIZE = 5000  # pixels
OVERLAP = 100     # pixels de sobreposição

# Processar tile a tile, depois fazer merge
```

---

## 6. Implementação Técnica

### 6.1. Bibliotecas Python

```python
# Core
import numpy as np
import rasterio
from rasterio.merge import merge
from rasterio.mask import mask
from rasterio.warp import reproject

# Terreno
import richdem as rd

# Hidrologia
from pysheds.grid import Grid

# Vector
import geopandas as gpd
from shapely.geometry import shape
from rasterio.features import shapes

# Utilitários
from pathlib import Path
import logging
```

### 6.2. Exemplo: Gerar Slope

```python
def calculate_slope(dem_path: Path, output_path: Path, units: str = "degrees") -> None:
    """
    Calcula o declive a partir de um DEM.
    
    Args:
        dem_path: Caminho para o DEM
        output_path: Caminho para o output
        units: "degrees" ou "percent"
    """
    # Carregar DEM
    dem = rd.LoadGDAL(str(dem_path))
    
    # Calcular slope
    slope = rd.TerrainAttribute(dem, attrib='slope_degrees')
    
    # Converter para percentagem se necessário
    if units == "percent":
        slope = np.tan(np.radians(slope)) * 100
    
    # Guardar
    rd.SaveGDAL(str(output_path), slope)
    
    logging.info(f"Slope guardado em {output_path}")
```

### 6.3. Exemplo: Gerar Bacias

```python
def delineate_basins(
    dem_path: Path,
    output_path: Path,
    min_area: float = 1000000
) -> gpd.GeoDataFrame:
    """
    Delineia bacias hidrográficas.
    
    Args:
        dem_path: Caminho para o DEM
        output_path: Caminho para output vectorial
        min_area: Área mínima em m²
    
    Returns:
        GeoDataFrame com bacias
    """
    # Inicializar grid
    grid = Grid.from_raster(str(dem_path))
    dem = grid.read_raster(str(dem_path))
    
    # Preencher depressões
    pit_filled = grid.fill_pits(dem)
    flooded = grid.fill_depressions(pit_filled)
    inflated = grid.resolve_flats(flooded)
    
    # Direcção de fluxo
    fdir = grid.flowdir(inflated)
    
    # Acumulação
    acc = grid.accumulation(fdir)
    
    # Definir pour points (threshold)
    threshold = min_area / (grid.cellsize ** 2)
    pour_points = acc > threshold
    
    # Delinear bacias
    basins = grid.catchment(fdir=fdir, pour_points=pour_points)
    
    # Vectorizar
    basins_vector = vectorize_raster(basins, grid.crs)
    
    # Filtrar por área mínima
    basins_vector = basins_vector[basins_vector.area >= min_area]
    
    # Guardar
    basins_vector.to_file(output_path, driver="GPKG")
    
    return basins_vector
```

### 6.4. Gerar COG

```python
def convert_to_cog(input_path: Path, output_path: Path) -> None:
    """
    Converte GeoTIFF para Cloud Optimized GeoTIFF.
    """
    import subprocess
    
    cmd = [
        "gdal_translate",
        "-of", "COG",
        "-co", "COMPRESS=LZW",
        "-co", "OVERVIEW_RESAMPLING=AVERAGE",
        str(input_path),
        str(output_path)
    ]
    
    subprocess.run(cmd, check=True)
```

### 6.5. Carregar para PostGIS

```python
def load_to_postgis(
    gdf: gpd.GeoDataFrame,
    table_name: str,
    connection_string: str
) -> None:
    """
    Carrega GeoDataFrame para PostGIS.
    """
    from sqlalchemy import create_engine
    
    engine = create_engine(connection_string)
    
    gdf.to_postgis(
        table_name,
        engine,
        if_exists="replace",
        index=True
    )
```

---

## 7. Estrutura de Ficheiros

### 7.1. Estrutura do Projecto

```
projects/00-base-biofisica/
│
├── README.md                    # Documentação principal
├── followup.md                  # Checklist de comunicação
│
├── config/
│   ├── params.yaml              # Parâmetros configuráveis
│   └── extent.geojson           # Área de estudo
│
├── notebooks/
│   ├── 01_download_mdt.ipynb    # Download e inventário
│   ├── 02_preprocessing.ipynb   # Mosaico, recorte
│   ├── 03_terrain.ipynb         # Derivados de terreno
│   ├── 04_hydrology.ipynb       # Derivados hidrológicos
│   ├── 05_vectorize.ipynb       # Vectorização
│   ├── 06_optimize.ipynb        # COGs, PostGIS
│   └── 07_validate.ipynb        # Validação e QA
│
├── scripts/
│   ├── __init__.py
│   ├── terrain.py               # Funções de terreno
│   ├── hydrology.py             # Funções hidrologia
│   ├── vectorize.py             # Funções vectorização
│   ├── optimize.py              # COG, PostGIS
│   └── pipeline.py              # Pipeline completo
│
├── data/
│   ├── raw/                     # MDT original (gitignored)
│   │   └── .gitkeep
│   ├── interim/                 # Processamento intermédio
│   │   └── .gitkeep
│   └── processed/               # Dados finais
│       └── .gitkeep
│
├── outputs/
│   ├── raster/
│   │   ├── dem_2m.tif
│   │   ├── slope_degrees.tif
│   │   ├── aspect.tif
│   │   ├── hillshade.tif
│   │   ├── twi.tif
│   │   ├── flow_direction.tif
│   │   ├── flow_accumulation.tif
│   │   └── (...)
│   ├── cog/                     # Cloud Optimized GeoTIFFs
│   │   ├── dem_2m.cog.tif
│   │   ├── slope_degrees.cog.tif
│   │   └── (...)
│   └── vector/
│       ├── contours_10m.gpkg
│       ├── contours_50m.gpkg
│       ├── drainage_network.gpkg
│       ├── basins.gpkg
│       └── sub_basins.gpkg
│
├── docs/
│   ├── methodology.md           # Metodologia detalhada
│   ├── data_dictionary.md       # Dicionário de dados
│   └── images/
│       └── (screenshots, diagramas)
│
└── tests/
    ├── test_terrain.py
    └── test_hydrology.py
```

### 7.2. Nomenclatura de Ficheiros

| Tipo | Padrão | Exemplo |
|------|--------|---------|
| Raster raw | `{produto}_{resolução}.tif` | `dem_2m.tif` |
| Raster COG | `{produto}_{resolução}.cog.tif` | `dem_2m.cog.tif` |
| Vector | `{produto}.gpkg` | `basins.gpkg` |
| Notebook | `{nn}_{descrição}.ipynb` | `03_terrain.ipynb` |

---

## 8. Validação e Qualidade

### 8.1. Verificações Automáticas

```python
def validate_raster(raster_path: Path) -> dict:
    """
    Valida um raster e retorna métricas.
    """
    with rasterio.open(raster_path) as src:
        data = src.read(1)
        
        return {
            "min": float(np.nanmin(data)),
            "max": float(np.nanmax(data)),
            "mean": float(np.nanmean(data)),
            "std": float(np.nanstd(data)),
            "nodata_pct": float(np.isnan(data).sum() / data.size * 100),
            "crs": str(src.crs),
            "resolution": src.res,
            "bounds": src.bounds,
        }
```

### 8.2. Validações Específicas

| Produto | Validação |
|---------|-----------|
| Slope | Valores entre 0 e 90 graus |
| Aspect | Valores entre 0 e 360 graus |
| Flow Direction | Valores válidos D8 (1,2,4,8,16,32,64,128) |
| TWI | Sem valores negativos |
| Bacias | Área total ≈ área de estudo |
| Rede drenagem | Conectividade, sem loops |

### 8.3. Comparação com Dados Oficiais

| Comparação | Fonte Oficial | Método |
|------------|---------------|--------|
| Bacias | APA | Sobreposição, % concordância |
| Rede drenagem | APA | Buffer intersection |
| Curvas nível | Carta militar | Amostragem aleatória |

### 8.4. Relatório de Qualidade

```markdown
# Relatório de Qualidade - ZH-00

## Data de Processamento
2025-XX-XX

## Dados de Entrada
- MDT: X folhas, resolução 2m
- Área total: X km²

## Métricas por Produto
| Produto | Min | Max | Mean | NoData % | CRS | Resolução |
|---------|-----|-----|------|----------|-----|-----------|
| DEM | X | X | X | X% | EPSG:3763 | 2m |
| Slope | 0 | X | X | X% | EPSG:3763 | 2m |
| ... | ... | ... | ... | ... | ... | ... |

## Validação Cruzada
- Bacias vs APA: X% concordância
- Rede drenagem vs APA: X% sobreposição

## Issues Encontrados
- (lista de problemas e como foram resolvidos)
```

---

## 9. Publicação e Partilha

### 9.1. Onde Publicar

| Plataforma | O quê | Formato |
|------------|-------|---------|
| **GitHub** | Código, documentação | Scripts, MD |
| **GitHub Releases** | Dados processados | ZIP com GPKGs |
| **TiTiler (próprio)** | Rasters | COG via HTTP |
| **Martin (próprio)** | Vectores | MVT tiles |
| **QGIS Cloud** | Projecto QGIS | (opcional) |

### 9.2. Licença

**Recomendação:** CC BY 4.0 para dados, MIT para código

```markdown
## Licença

### Dados
Os dados produzidos neste projecto estão licenciados sob 
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).

### Código
O código está licenciado sob [MIT License](https://opensource.org/licenses/MIT).

### Atribuição
Se utilizar estes dados, por favor cite:
"Caracterização Biofísica do Médio Tejo - [Teu Nome] (2025)"
```

### 9.3. Download Package

Criar um pacote de download com:

```
medio-tejo-biofisica-v1.0.zip
├── README.md
├── LICENSE.md
├── data_dictionary.md
├── raster/
│   ├── dem_2m.cog.tif
│   ├── slope_degrees.cog.tif
│   └── (...)
├── vector/
│   ├── basins.gpkg
│   ├── drainage_network.gpkg
│   └── (...)
└── metadata/
    └── quality_report.md
```

---

## 10. Comunicação

### 10.1. LinkedIn Post

**Headline options:**
1. "Disponibilizo dados de caracterização biofísica do Médio Tejo em open data 🗺️"
2. "Criei um dataset de análise hidrológica para a região do Médio Tejo - disponível para download"
3. "Open Data: MDT derivados e bacias hidrográficas do Médio Tejo"

**Body:**
```
Acabei de publicar um conjunto de dados de caracterização biofísica 
para a região do Médio Tejo, incluindo:

📊 Derivados de terreno (declive, exposição, TWI, etc.)
🌊 Rede hidrográfica hierarquizada
🗺️ Bacias e sub-bacias delimitadas

Tudo processado em Python com código disponível no GitHub.

Dados em formato aberto (COG + GeoPackage) para uso livre.

Link nos comentários 👇

#GIS #OpenData #Python #Hidrologia #Portugal
```

### 10.2. Artigo Blog

**Título:** "Como criar uma caracterização biofísica completa com Python e dados abertos"

**Estrutura:**
1. Introdução - porquê este projecto
2. Dados utilizados - MDT LiDAR da DGT
3. Metodologia - passo a passo
4. Resultados - mapas e métricas
5. Como usar os dados
6. Conclusões e próximos passos

### 10.3. Portfolio Entry

```yaml
title: "Caracterização Biofísica do Médio Tejo"
date: 2025-XX-XX
tags: ["Python", "Hidrologia", "LiDAR", "Open Data"]
image: "/images/portfolio/medio-tejo-biofisica.png"
demo: "https://tiles.meudominio.pt/medio-tejo/"
github: "https://github.com/user/medio-tejo-biofisica"
description: |
  Conjunto de dados de caracterização biofísica derivados de MDT LiDAR,
  incluindo análise de terreno e hidrologia. Dados abertos para download.
```

---

## 11. Cronograma

### 11.1. Estimativa de Tempo

| Fase | Tarefas | Tempo Estimado |
|------|---------|----------------|
| **1. Setup** | Identificar folhas, download | 2-3 dias |
| **2. Pré-processamento** | Mosaico, recorte | 1-2 dias |
| **3. Terreno** | Todos os derivados | 2-3 dias |
| **4. Hidrologia** | Flow, bacias, rede | 3-4 dias |
| **5. Vectorização** | Curvas, rede, bacias | 1-2 dias |
| **6. Optimização** | COGs, PostGIS | 1 dia |
| **7. Validação** | QA, comparações | 2 dias |
| **8. Documentação** | README, dicionário | 1-2 dias |
| **9. Publicação** | GitHub, releases | 1 dia |
| **10. Comunicação** | LinkedIn, blog | 1-2 dias |

**Total estimado:** 3-4 semanas (part-time)

### 11.2. Dependências

```
Semana 1: Setup + Download
    │
    ▼
Semana 2: Pré-processamento + Terreno
    │
    ▼
Semana 3: Hidrologia + Vectorização
    │
    ▼
Semana 4: Optimização + Validação + Publicação
```

### 11.3. Checklist Final

- [ ] Todos os produtos gerados
- [ ] Validação completa
- [ ] Documentação escrita
- [ ] Código no GitHub
- [ ] Dados disponíveis para download
- [ ] COGs no TiTiler
- [ ] Vectores no PostGIS/Martin
- [ ] Post LinkedIn publicado
- [ ] Artigo blog escrito
- [ ] Entrada no portfolio

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `00_VISAO_GERAL.md` - Contexto geral
- `01_STACK_TECNICO.md` - Bibliotecas e configurações
- `03_AREA_ESTUDO.md` - Delimitação da área
- `04_BACKLOG_PROJECTOS.md` - Projectos dependentes
- `07_TEMA2_AGUA.md` - Projectos hidrológicos que usam este

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
