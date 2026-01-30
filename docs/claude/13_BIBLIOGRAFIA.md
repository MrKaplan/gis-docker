# 13 - BIBLIOGRAFIA E RECURSOS

## Índice
1. [Organização](#1-organização)
2. [Referências Metodológicas](#2-referências-metodológicas)
3. [Índices Espectrais](#3-índices-espectrais)
4. [Análise de Terreno](#4-análise-de-terreno)
5. [Hidrologia](#5-hidrologia)
6. [Riscos Naturais](#6-riscos-naturais)
7. [Análise Urbana](#7-análise-urbana)
8. [Hidrogeologia e Carsismo](#8-hidrogeologia-e-carsismo)
9. [Ecologia e Paisagem](#9-ecologia-e-paisagem)
10. [Remote Sensing](#10-remote-sensing)
11. [Bibliotecas e Ferramentas](#11-bibliotecas-e-ferramentas)
12. [Fontes de Dados Portugal](#12-fontes-de-dados-portugal)
13. [Tutoriais e Cursos](#13-tutoriais-e-cursos)
14. [Artigos e Livros Recomendados](#14-artigos-e-livros-recomendados)

---

## 1. Organização

### 1.1. Estrutura deste Documento

Este documento organiza referências bibliográficas, metodológicas e recursos técnicos por tema. Cada secção inclui:

- **Referências académicas** (artigos, livros)
- **Documentação técnica** (manuais, especificações)
- **Tutoriais práticos** (links, notebooks)
- **Fórmulas e algoritmos** (para implementação)

### 1.2. Formato de Citação

```
Autor(es) (Ano). Título. Revista/Editora. DOI/URL
```

### 1.3. Abreviaturas Comuns

| Abreviatura | Significado |
|-------------|-------------|
| RS | Remote Sensing (Detecção Remota) |
| GIS | Geographic Information Systems |
| DEM/MDT | Digital Elevation Model / Modelo Digital de Terreno |
| GEE | Google Earth Engine |
| USLE | Universal Soil Loss Equation |
| AHP | Analytic Hierarchy Process |
| NDVI | Normalized Difference Vegetation Index |
| NBR | Normalized Burn Ratio |

---

## 2. Referências Metodológicas

### 2.1. Análise Multicritério (AHP)

**Referência fundamental:**
```
Saaty, T.L. (1980). The Analytic Hierarchy Process. McGraw-Hill.
```

**Aplicação em GIS:**
```
Malczewski, J. (1999). GIS and Multicriteria Decision Analysis. Wiley.
```

**Matriz de comparação par-a-par:**

| Intensidade | Definição |
|-------------|-----------|
| 1 | Igual importância |
| 3 | Importância moderada |
| 5 | Importância forte |
| 7 | Importância muito forte |
| 9 | Importância extrema |
| 2,4,6,8 | Valores intermédios |

**Cálculo de pesos:**
```python
import numpy as np

def ahp_weights(comparison_matrix):
    """
    Calcula pesos AHP a partir de matriz de comparação.
    """
    # Normalizar colunas
    col_sums = comparison_matrix.sum(axis=0)
    normalized = comparison_matrix / col_sums
    
    # Média das linhas = pesos
    weights = normalized.mean(axis=1)
    
    # Consistency Ratio (CR)
    n = len(weights)
    lambda_max = (comparison_matrix @ weights / weights).mean()
    CI = (lambda_max - n) / (n - 1)
    
    # Random Index (RI) para n critérios
    RI = {1: 0, 2: 0, 3: 0.58, 4: 0.90, 5: 1.12, 6: 1.24, 7: 1.32, 8: 1.41}
    CR = CI / RI.get(n, 1.49)
    
    return weights, CR  # CR deve ser < 0.10
```

### 2.2. Normalização de Dados

**Min-Max (0-1):**
```python
def normalize_minmax(array):
    return (array - array.min()) / (array.max() - array.min())
```

**Z-Score:**
```python
def normalize_zscore(array):
    return (array - array.mean()) / array.std()
```

**Fuzzy Linear:**
```python
def fuzzy_linear(array, min_val, max_val, increasing=True):
    """
    Normalização fuzzy linear.
    increasing=True: valores altos = alta aptidão
    increasing=False: valores baixos = alta aptidão
    """
    if increasing:
        return np.clip((array - min_val) / (max_val - min_val), 0, 1)
    else:
        return np.clip((max_val - array) / (max_val - min_val), 0, 1)
```

---

## 3. Índices Espectrais

### 3.1. Índices de Vegetação

| Índice | Fórmula | Uso | Referência |
|--------|---------|-----|------------|
| **NDVI** | (NIR - Red) / (NIR + Red) | Vigor vegetação | Rouse et al. (1974) |
| **EVI** | 2.5 × (NIR - Red) / (NIR + 6×Red - 7.5×Blue + 1) | Vegetação (corrigido) | Huete et al. (2002) |
| **SAVI** | (NIR - Red) / (NIR + Red + L) × (1 + L) | Vegetação (solos expostos) | Huete (1988) |
| **MSAVI2** | (2×NIR + 1 - √((2×NIR+1)² - 8×(NIR-Red))) / 2 | Vegetação esparsa | Qi et al. (1994) |
| **LAI** | Derivado de NDVI ou EVI | Área foliar | - |

**Referências:**
```
Rouse, J.W. et al. (1974). Monitoring vegetation systems in the Great Plains 
with ERTS. Third ERTS Symposium, NASA SP-351, 309-317.

Huete, A.R. (1988). A soil-adjusted vegetation index (SAVI). 
Remote Sensing of Environment, 25(3), 295-309.

Huete, A.R. et al. (2002). Overview of the radiometric and biophysical 
performance of the MODIS vegetation indices. 
Remote Sensing of Environment, 83(1-2), 195-213.
```

### 3.2. Índices de Fogo

| Índice | Fórmula | Uso | Referência |
|--------|---------|-----|------------|
| **NBR** | (NIR - SWIR2) / (NIR + SWIR2) | Severidade fogo | Key & Benson (2006) |
| **dNBR** | NBR_pre - NBR_post | Delta severidade | Key & Benson (2006) |
| **RdNBR** | dNBR / √(\|NBR_pre\|) | NBR relativizado | Miller & Thode (2007) |
| **RBR** | dNBR / (NBR_pre + 1.001) | Burn Ratio | Parks et al. (2014) |
| **BAI** | 1 / ((0.1 - Red)² + (0.06 - NIR)²) | Área ardida | Martín (1998) |

**Classes de severidade (dNBR):**

| Classe | dNBR | Descrição |
|--------|------|-----------|
| Sem alteração | < -0.1 | Crescimento vegetação |
| Não ardido | -0.1 a 0.1 | Sem alteração |
| Severidade baixa | 0.1 a 0.27 | Danos ligeiros |
| Severidade moderada-baixa | 0.27 a 0.44 | Danos moderados |
| Severidade moderada-alta | 0.44 a 0.66 | Danos significativos |
| Severidade alta | > 0.66 | Danos severos |

**Referências:**
```
Key, C.H. & Benson, N.C. (2006). Landscape Assessment: Ground measure of 
severity, the Composite Burn Index; and Remote sensing of severity, the 
Normalized Burn Ratio. FIREMON: Fire Effects Monitoring and Inventory System.

Miller, J.D. & Thode, A.E. (2007). Quantifying burn severity in a heterogeneous 
landscape with a relative version of the delta Normalized Burn Ratio (dNBR). 
Remote Sensing of Environment, 109(1), 66-80.
```

### 3.3. Índices de Água

| Índice | Fórmula | Uso | Referência |
|--------|---------|-----|------------|
| **NDWI** | (Green - NIR) / (Green + NIR) | Corpos de água | McFeeters (1996) |
| **MNDWI** | (Green - SWIR) / (Green + SWIR) | Água (urbano) | Xu (2006) |
| **NDMI** | (NIR - SWIR1) / (NIR + SWIR1) | Humidade vegetação | Gao (1996) |
| **AWEI** | 4×(Green - SWIR1) - (0.25×NIR + 2.75×SWIR2) | Água (sombras) | Feyisa et al. (2014) |

**Referências:**
```
McFeeters, S.K. (1996). The use of the Normalized Difference Water Index (NDWI) 
in the delineation of open water features. 
International Journal of Remote Sensing, 17(7), 1425-1432.

Xu, H. (2006). Modification of normalised difference water index (NDWI) to 
enhance open water features in remotely sensed imagery. 
International Journal of Remote Sensing, 27(14), 3025-3033.
```

### 3.4. Bandas Sentinel-2

| Banda | Nome | Comprimento de onda (nm) | Resolução (m) |
|-------|------|-------------------------|---------------|
| B1 | Coastal aerosol | 443 | 60 |
| B2 | Blue | 490 | 10 |
| B3 | Green | 560 | 10 |
| B4 | Red | 665 | 10 |
| B5 | Red Edge 1 | 705 | 20 |
| B6 | Red Edge 2 | 740 | 20 |
| B7 | Red Edge 3 | 783 | 20 |
| B8 | NIR | 842 | 10 |
| B8A | NIR narrow | 865 | 20 |
| B9 | Water vapour | 945 | 60 |
| B10 | Cirrus | 1375 | 60 |
| B11 | SWIR 1 | 1610 | 20 |
| B12 | SWIR 2 | 2190 | 20 |

---

## 4. Análise de Terreno

### 4.1. Derivados de MDT

| Derivado | Descrição | Fórmula/Método |
|----------|-----------|----------------|
| **Declive** | Inclinação do terreno | arctan(√(dz/dx² + dz/dy²)) |
| **Exposição** | Orientação das vertentes | arctan(dz/dy / dz/dx) |
| **Curvatura** | Convexidade/concavidade | ∂²z/∂x² + ∂²z/∂y² |
| **Hillshade** | Relevo sombreado | Função do azimute e altitude solar |
| **TRI** | Rugosidade | Média das diferenças absolutas |
| **TPI** | Posição topográfica | Elevação - Média vizinhança |
| **TWI** | Humidade topográfica | ln(a / tan(β)) |

**Implementação richdem:**
```python
import richdem as rd

dem = rd.LoadGDAL("mdt.tif")

slope = rd.TerrainAttribute(dem, attrib='slope_degrees')
aspect = rd.TerrainAttribute(dem, attrib='aspect')
curvature = rd.TerrainAttribute(dem, attrib='curvature')
tri = rd.TerrainAttribute(dem, attrib='tri')
```

### 4.2. Topographic Position Index (TPI)

```python
from scipy.ndimage import uniform_filter
import numpy as np

def calculate_tpi(dem, radius=10):
    """
    TPI = Elevação - Média da vizinhança
    
    Classificação:
    - TPI < -1 SD: Vales
    - -1 SD < TPI < 1 SD: Vertentes
    - TPI > 1 SD: Cristas
    """
    window_size = radius * 2 + 1
    mean_elev = uniform_filter(dem, size=window_size)
    tpi = dem - mean_elev
    return tpi
```

**Classificação de landforms (Weiss 2001):**

| TPI (pequena escala) | TPI (grande escala) | Landform |
|---------------------|---------------------|----------|
| + | + | Crista alta |
| + | - | Crista local |
| - | + | Meia encosta superior |
| - | - | Vale |
| 0 | + | Planalto |
| 0 | - | Planície |

### 4.3. Topographic Wetness Index (TWI)

```
TWI = ln(a / tan(β))

Onde:
- a = área de contribuição específica (m²/m)
- β = declive local (radianos)
```

**Implementação:**
```python
import numpy as np
from pysheds.grid import Grid

def calculate_twi(dem_path):
    grid = Grid.from_raster(dem_path)
    dem = grid.read_raster(dem_path)
    
    # Preencher depressões
    pit_filled = grid.fill_pits(dem)
    flooded = grid.fill_depressions(pit_filled)
    
    # Flow direction e accumulation
    fdir = grid.flowdir(flooded)
    acc = grid.accumulation(fdir)
    
    # Área de contribuição específica
    cell_size = abs(grid.affine.a)
    area = (acc + 1) * cell_size
    
    # Declive
    slope = np.arctan(np.gradient(dem)[0])  # Simplificado
    slope[slope == 0] = 0.001  # Evitar divisão por zero
    
    # TWI
    twi = np.log(area / np.tan(slope))
    
    return twi
```

**Referência:**
```
Beven, K.J. & Kirkby, M.J. (1979). A physically based, variable contributing 
area model of basin hydrology. Hydrological Sciences Bulletin, 24(1), 43-69.
```

---

## 5. Hidrologia

### 5.1. Extracção de Rede de Drenagem

**Algoritmo D8:**
```
Direcções possíveis (codificação):
    32  64  128
    16   X   1
     8   4   2
```

**Implementação pysheds:**
```python
from pysheds.grid import Grid

def extract_drainage_network(dem_path, threshold=1000):
    """
    Extrai rede de drenagem.
    threshold = número mínimo de células a montante
    """
    grid = Grid.from_raster(dem_path)
    dem = grid.read_raster(dem_path)
    
    # Pré-processamento
    pit_filled = grid.fill_pits(dem)
    flooded = grid.fill_depressions(pit_filled)
    inflated = grid.resolve_flats(flooded)
    
    # Flow direction e accumulation
    fdir = grid.flowdir(inflated)
    acc = grid.accumulation(fdir)
    
    # Extrair rede
    branches = grid.extract_river_network(fdir, acc > threshold)
    
    return branches, acc, fdir
```

### 5.2. Ordem de Strahler

```
Regras:
1. Nascentes = ordem 1
2. Junção de mesma ordem → ordem + 1
3. Junção de ordens diferentes → mantém a maior
```

**Referência:**
```
Strahler, A.N. (1957). Quantitative analysis of watershed geomorphology. 
Transactions of the American Geophysical Union, 38(6), 913-920.
```

### 5.3. Delimitação de Bacias

```python
def delineate_basin(grid, fdir, pour_point):
    """
    Delimita bacia hidrográfica a partir de ponto de saída.
    """
    # Snap pour point para célula de alta acumulação
    x, y = pour_point
    x_snap, y_snap = grid.snap_to_mask(acc > 1000, (x, y))
    
    # Delimitar bacia
    catch = grid.catchment(x=x_snap, y=y_snap, fdir=fdir)
    
    return catch
```

### 5.4. Tempo de Concentração

**Fórmula de Kirpich:**
```
tc = 0.0195 × L^0.77 × S^(-0.385)

Onde:
- tc = tempo de concentração (min)
- L = comprimento do canal principal (m)
- S = declive médio (m/m)
```

**Fórmula SCS:**
```
tc = (L^0.8 × (S_ret + 1)^0.7) / (1140 × Y^0.5)

Onde:
- L = comprimento hidráulico (ft)
- S_ret = retenção potencial máxima (in)
- Y = declive médio da bacia (%)
```

---

## 6. Riscos Naturais

### 6.1. USLE - Universal Soil Loss Equation

```
A = R × K × LS × C × P

Onde:
- A = perda de solo anual (t/ha/ano)
- R = factor de erosividade da chuva
- K = factor de erodibilidade do solo
- LS = factor topográfico (comprimento × declive)
- C = factor de coberto vegetal
- P = factor de práticas de conservação
```

**Factor LS (Moore & Burch 1986):**
```python
def calculate_ls_factor(slope_deg, flow_acc, cell_size):
    """
    LS = (flow_acc × cell_size / 22.13)^0.4 × (sin(slope) / 0.0896)^1.3
    """
    slope_rad = np.radians(slope_deg)
    
    ls = ((flow_acc * cell_size / 22.13) ** 0.4) * \
         ((np.sin(slope_rad) / 0.0896) ** 1.3)
    
    return ls
```

**Valores típicos de K (Portugal):**

| Textura do solo | K (t.ha.h/ha.MJ.mm) |
|-----------------|---------------------|
| Areia | 0.02 - 0.10 |
| Franco-arenoso | 0.10 - 0.20 |
| Franco | 0.20 - 0.35 |
| Franco-argiloso | 0.30 - 0.45 |
| Argila | 0.15 - 0.30 |

**Valores típicos de C:**

| Uso do solo | C |
|-------------|---|
| Solo nu | 1.0 |
| Culturas anuais | 0.20 - 0.50 |
| Pastagem | 0.01 - 0.10 |
| Floresta densa | 0.001 - 0.01 |
| Urbano | 0.001 |

**Referências:**
```
Wischmeier, W.H. & Smith, D.D. (1978). Predicting rainfall erosion losses: 
a guide to conservation planning. USDA Agriculture Handbook No. 537.

Renard, K.G. et al. (1997). Predicting soil erosion by water: a guide to 
conservation planning with the Revised Universal Soil Loss Equation (RUSLE). 
USDA Agriculture Handbook No. 703.
```

### 6.2. DRASTIC - Vulnerabilidade de Aquíferos

```
DRASTIC = Dr×Dw + Rr×Rw + Ar×Aw + Sr×Sw + Tr×Tw + Ir×Iw + Cr×Cw

Factores:
- D = Depth to water (profundidade nível freático)
- R = Recharge (recarga)
- A = Aquifer media (material do aquífero)
- S = Soil media (tipo de solo)
- T = Topography (declive)
- I = Impact of vadose zone (zona não saturada)
- C = Conductivity (condutividade hidráulica)
```

**Pesos típicos:**

| Factor | Peso (w) |
|--------|----------|
| D | 5 |
| R | 4 |
| A | 3 |
| S | 2 |
| T | 1 |
| I | 5 |
| C | 3 |

**Referência:**
```
Aller, L. et al. (1987). DRASTIC: A Standardized System for Evaluating Ground 
Water Pollution Potential Using Hydrogeologic Settings. EPA/600/2-87/035.
```

### 6.3. Susceptibilidade a Deslizamentos

**Factores condicionantes:**

| Factor | Peso típico | Fonte |
|--------|-------------|-------|
| Declive | 25-35% | MDT |
| Geologia/Litologia | 15-25% | LNEG |
| Uso do solo | 10-20% | COS |
| Curvatura | 5-15% | MDT |
| TWI | 5-15% | Derivado |
| Distância a falhas | 5-10% | LNEG |
| Exposição | 5-10% | MDT |

**Métodos de avaliação:**
- **Heurístico:** AHP com pesos de especialista
- **Estatístico:** Regressão logística, Frequency Ratio
- **Machine Learning:** Random Forest, SVM

**Referência:**
```
Van Westen, C.J. et al. (2008). From landslide inventories to landslide risk 
assessment; an attempt to support methodological development in India. 
Landslides and Engineered Slopes, Taylor & Francis.
```

### 6.4. Perigosidade de Incêndio

**Factores típicos (AHP):**

| Factor | Peso | Classes |
|--------|------|---------|
| Ocupação do solo | 30% | Eucalipto/Pinheiro=Alto, Agrícola=Baixo |
| Declive | 20% | >30%=Muito Alto |
| Exposição | 15% | Sul/Oeste=Maior risco |
| Histórico de fogo | 15% | Recorrência |
| Distância a estradas | 10% | Fonte de ignição |
| Densidade populacional | 10% | Factor humano |

**Referência:**
```
Verde, J.C. & Zêzere, J.L. (2010). Assessment and validation of wildfire 
susceptibility and hazard in Portugal. Natural Hazards and Earth System 
Sciences, 10(3), 485-497.
```

---

## 7. Análise Urbana

### 7.1. Isócronas e Routing

**pgRouting - Driving Distance:**
```sql
SELECT * FROM pgr_drivingDistance(
    'SELECT id, source, target, cost FROM edges',
    start_node,
    max_cost,
    directed := true
);
```

**pgRouting - Dijkstra:**
```sql
SELECT * FROM pgr_dijkstra(
    'SELECT id, source, target, cost FROM edges',
    start_node,
    end_node,
    directed := true
);
```

**Referência:**
```
pgRouting Documentation: https://pgrouting.org/
```

### 7.2. Walkability

**Factores do Walk Score:**

| Factor | Descrição |
|--------|-----------|
| Proximidade a amenidades | Distância a lojas, escolas, etc. |
| Conectividade | Densidade de intersecções |
| Comprimento de quarteirões | Quarteirões curtos = melhor |
| Declive | Terreno plano favorável |
| Infraestrutura pedonal | Presença de passeios |

**Referência:**
```
Walk Score Methodology: https://www.walkscore.com/methodology.shtml
```

### 7.3. Space Syntax

**Métricas principais:**

| Métrica | Descrição |
|---------|-----------|
| **Integration** | Centralidade global (to-movement) |
| **Choice** | Betweenness (through-movement) |
| **Connectivity** | Número de ligações directas |
| **Depth** | Distância topológica média |

**Ferramenta:** depthmapX (UCL)

**Referência:**
```
Hillier, B. & Hanson, J. (1984). The Social Logic of Space. 
Cambridge University Press.
```

### 7.4. Viewshed

**Algoritmo básico:**
```python
def viewshed(dem, observer_point, observer_height=1.7, 
             target_height=0, max_distance=None):
    """
    Para cada célula:
    1. Traçar linha até observador
    2. Calcular ângulo de elevação necessário
    3. Verificar se há obstrução no caminho
    """
    # Implementação com r.viewshed (GRASS) ou richdem
    pass
```

**QGIS/GRASS:**
```
r.viewshed input=dem output=viewshed coordinates=x,y observer_elevation=1.7
```

---

## 8. Hidrogeologia e Carsismo

### 8.1. Sistemas Cársicos

**Características do Polje:**
- Depressão fechada de fundo plano
- Inundação sazonal (ligação a aquífero)
- Drenagem por sumidouros (ponors)
- Geologia calcária

**Referência para Portugal:**
```
Crispim, J.A. (1995). Dinâmica cársica e implicações ambientais nas 
depressões de Alvados e Minde. Dissertação de Doutoramento, 
Universidade de Lisboa.
```

### 8.2. Recarga de Aquíferos

**Método do balanço hídrico:**
```
R = P - ET - Qsup

Onde:
- R = Recarga
- P = Precipitação
- ET = Evapotranspiração
- Qsup = Escoamento superficial
```

**Factores que influenciam recarga:**
- Precipitação
- Permeabilidade do solo
- Declive
- Vegetação
- Geologia

### 8.3. NDWI para Inundação

**Detecção de água em Polje:**
```python
def detect_flooded_area(image, threshold=0.3):
    """
    NDWI = (Green - NIR) / (Green + NIR)
    NDWI > threshold → água
    """
    ndwi = (image['B3'] - image['B8']) / (image['B3'] + image['B8'])
    water_mask = ndwi > threshold
    return water_mask
```

---

## 9. Ecologia e Paisagem

### 9.1. Métricas de Paisagem (pylandstats)

| Métrica | Nível | Descrição |
|---------|-------|-----------|
| **NP** | Classe | Número de manchas |
| **PD** | Classe | Densidade de manchas |
| **LPI** | Classe | Índice da maior mancha |
| **ED** | Classe | Densidade de bordas |
| **SHAPE** | Mancha | Índice de forma |
| **COHESION** | Classe | Coesão de manchas |
| **SHDI** | Paisagem | Diversidade de Shannon |
| **CONTAG** | Paisagem | Índice de contágio |

**Implementação:**
```python
import pylandstats as pls

# Carregar mapa de uso do solo
landscape = pls.Landscape('landcover.tif')

# Métricas ao nível da paisagem
landscape_metrics = landscape.compute_landscape_metrics_df()

# Métricas por classe
class_metrics = landscape.compute_class_metrics_df()
```

**Referência:**
```
McGarigal, K. & Marks, B.J. (1995). FRAGSTATS: spatial pattern analysis 
program for quantifying landscape structure. USDA Forest Service.
```

### 9.2. Corredores Ecológicos

**Método Land Facet Corridor:**

1. Identificar manchas de habitat (origem e destino)
2. Criar superfície de custo (resistência à dispersão)
3. Calcular caminho de menor custo
4. Identificar corredores de conectividade

**Superfície de custo típica:**

| Uso do solo | Custo |
|-------------|-------|
| Floresta nativa | 1 |
| Matos | 2 |
| Agricultura extensiva | 5 |
| Agricultura intensiva | 10 |
| Urbano | 100 |
| Estradas | 50-100 |

**Implementação GRASS:**
```
r.cost input=dem output=cost start_coordinates=x,y
r.drain input=cost output=corridor drain=drain_points
```

### 9.3. Detecção de Espécies Invasoras

**Acácias - Detecção por floração (Fev-Mar):**
```python
def detect_acacia_flowering(image):
    """
    Acácias têm floração amarela distintiva.
    Yellow Index = B4 / B3 (Red / Green)
    """
    yellow_index = image['B4'] / image['B3']
    
    # Threshold para floração
    flowering_mask = yellow_index > 1.15
    
    return flowering_mask
```

**Referência:**
```
Große-Stoltenberg, A. et al. (2016). Early detection of GPP-related regime 
shifts after plant invasion by integrating imaging spectroscopy with 
airborne LiDAR. Remote Sensing of Environment, 209, 780-792.
```

---

## 10. Remote Sensing

### 10.1. Google Earth Engine

**Estrutura básica:**
```javascript
// JavaScript API
var image = ee.Image('COPERNICUS/S2_SR/20200101T123456');
var ndvi = image.normalizedDifference(['B8', 'B4']);

// Exportar
Export.image.toDrive({
  image: ndvi,
  description: 'ndvi_export',
  scale: 10,
  region: geometry
});
```

**Python API:**
```python
import ee
ee.Initialize()

# Colecção Sentinel-2
collection = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED') \
    .filterBounds(geometry) \
    .filterDate('2020-01-01', '2020-12-31') \
    .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20))

# Composição mediana
median = collection.median()

# NDVI
ndvi = median.normalizedDifference(['B8', 'B4'])
```

**Referência:**
```
Gorelick, N. et al. (2017). Google Earth Engine: Planetary-scale geospatial 
analysis for everyone. Remote Sensing of Environment, 202, 18-27.
```

### 10.2. Colecções Úteis no GEE

| Colecção | ID | Resolução | Frequência |
|----------|-----|-----------|------------|
| Sentinel-2 SR | COPERNICUS/S2_SR_HARMONIZED | 10-60m | 5 dias |
| Landsat 8/9 | LANDSAT/LC08/C02/T1_L2 | 30m | 16 dias |
| SRTM DEM | USGS/SRTMGL1_003 | 30m | Estático |
| MODIS NDVI | MODIS/006/MOD13Q1 | 250m | 16 dias |
| ERA5 Climate | ECMWF/ERA5/DAILY | 27km | Diário |
| SMAP Soil | NASA/SMAP/SPL4SMGP/007 | 9km | 3 horas |

### 10.3. Cloud Masking Sentinel-2

```python
def mask_s2_clouds(image):
    """
    Máscara de nuvens para Sentinel-2 usando banda QA60.
    """
    qa = image.select('QA60')
    
    # Bits 10 e 11 são nuvens e cirrus
    cloud_bit_mask = 1 << 10
    cirrus_bit_mask = 1 << 11
    
    mask = qa.bitwiseAnd(cloud_bit_mask).eq(0) \
        .And(qa.bitwiseAnd(cirrus_bit_mask).eq(0))
    
    return image.updateMask(mask)
```

---

## 11. Bibliotecas e Ferramentas

### 11.1. Python - Processamento Geoespacial

| Biblioteca | Função | Documentação |
|------------|--------|--------------|
| **GDAL** | I/O raster/vector | gdal.org |
| **Rasterio** | I/O raster (Pythonic) | rasterio.readthedocs.io |
| **Fiona** | I/O vector | fiona.readthedocs.io |
| **GeoPandas** | Análise vector | geopandas.org |
| **Shapely** | Geometrias | shapely.readthedocs.io |
| **PyProj** | Projecções | pyproj4.github.io |

### 11.2. Python - Análise de Terreno

| Biblioteca | Função | Documentação |
|------------|--------|--------------|
| **richdem** | Derivados MDT | richdem.readthedocs.io |
| **pysheds** | Hidrologia | mattbartos.com/pysheds |
| **xarray-spatial** | Análise raster | xarray-spatial.org |
| **rasterstats** | Estatísticas zonais | pythonhosted.org/rasterstats |

### 11.3. Python - Remote Sensing

| Biblioteca | Função | Documentação |
|------------|--------|--------------|
| **earthengine-api** | Google Earth Engine | developers.google.com/earth-engine |
| **pystac-client** | Catálogos STAC | pystac-client.readthedocs.io |
| **rioxarray** | xarray + rasterio | corteva.github.io/rioxarray |

### 11.4. Python - Visualização

| Biblioteca | Função | Documentação |
|------------|--------|--------------|
| **Folium** | Mapas web (Leaflet) | python-visualization.github.io/folium |
| **Leafmap** | Mapas interactivos | leafmap.org |
| **Plotly** | Gráficos interactivos | plotly.com/python |
| **Contextily** | Basemaps | contextily.readthedocs.io |

### 11.5. PostGIS e pgRouting

| Extensão | Função | Documentação |
|----------|--------|--------------|
| **PostGIS** | Dados espaciais | postgis.net |
| **pgRouting** | Análise de redes | pgrouting.org |
| **pg_cron** | Agendamento | github.com/citusdata/pg_cron |

---

## 12. Fontes de Dados Portugal

### 12.1. Dados Geográficos Oficiais

| Fonte | Dados | URL |
|-------|-------|-----|
| **DGT** | MDT LiDAR, Ortofotomapas, COS | dgterritorio.gov.pt |
| **SNIG** | Catálogo nacional | snig.dgterritorio.gov.pt |
| **APA** | Bacias, recursos hídricos | apambiente.pt |
| **SNIRH** | Dados hidrométricos | snirh.apambiente.pt |
| **IPMA** | Dados meteorológicos | ipma.pt |
| **ICNF** | Áreas ardidas, áreas protegidas | icnf.pt |
| **LNEG** | Geologia | lneg.pt |
| **DGADR** | Solos agrícolas | dgadr.gov.pt |
| **INE** | Censos, estatísticas | ine.pt |
| **IFAP** | Parcelas agrícolas | dados.gov.pt |

### 12.2. Dados Abertos

| Portal | Tipo | URL |
|--------|------|-----|
| **dados.gov.pt** | Portal nacional | dados.gov.pt |
| **OpenStreetMap** | Colaborativo | openstreetmap.org |
| **Copernicus** | Satélite | scihub.copernicus.eu |
| **USGS** | Landsat | earthexplorer.usgs.gov |

### 12.3. APIs e Serviços

| Serviço | Tipo | URL |
|---------|------|-----|
| **Google Earth Engine** | Cloud processing | earthengine.google.com |
| **Microsoft Planetary Computer** | STAC catalog | planetarycomputer.microsoft.com |
| **Copernicus Data Space** | Sentinel data | dataspace.copernicus.eu |

---

## 13. Tutoriais e Cursos

### 13.1. Google Earth Engine

| Recurso | Descrição | URL |
|---------|-----------|-----|
| GEE Guides | Documentação oficial | developers.google.com/earth-engine/guides |
| Awesome GEE | Lista de recursos | github.com/giswqs/Awesome-GEE |
| GEE Community | Tutoriais comunidade | developers.google.com/earth-engine/tutorials |

### 13.2. Python GIS

| Recurso | Descrição | URL |
|---------|-----------|-----|
| Geocomputation with Python | Livro online | py.geocompx.org |
| Earth Lab | Tutoriais | earthdatascience.org |
| Automating GIS Processes | Curso U. Helsinki | autogis-site.readthedocs.io |

### 13.3. PostGIS e pgRouting

| Recurso | Descrição | URL |
|---------|-----------|-----|
| PostGIS Workshop | Introdução oficial | postgis.net/workshops |
| pgRouting Workshop | Routing tutorial | workshop.pgrouting.org |

### 13.4. QGIS

| Recurso | Descrição | URL |
|---------|-----------|-----|
| QGIS Documentation | Oficial | docs.qgis.org |
| QGIS Sketches | Tutoriais | sketches.qgis.org |

---

## 14. Artigos e Livros Recomendados

### 14.1. Livros Fundamentais

```
Longley, P.A. et al. (2015). Geographic Information Science and Systems. 
4th Edition. Wiley.

Burrough, P.A. et al. (2015). Principles of Geographical Information Systems. 
3rd Edition. Oxford University Press.

Jensen, J.R. (2015). Introductory Digital Image Processing: 
A Remote Sensing Perspective. 4th Edition. Pearson.

Lillesand, T.M. et al. (2015). Remote Sensing and Image Interpretation. 
7th Edition. Wiley.
```

### 14.2. Artigos Metodológicos Chave

**Hidrologia:**
```
Tarboton, D.G. (1997). A new method for the determination of flow directions 
and upslope areas in grid digital elevation models. 
Water Resources Research, 33(2), 309-319.

O'Callaghan, J.F. & Mark, D.M. (1984). The extraction of drainage networks 
from digital elevation data. Computer Vision, Graphics, and Image Processing, 
28(3), 323-344.
```

**Incêndios:**
```
Miller, J.D. et al. (2009). Calibration and validation of the relative 
differenced Normalized Burn Ratio (RdNBR) to three measures of fire severity 
in the Sierra Nevada and Klamath Mountains, California, USA. 
Remote Sensing of Environment, 113(3), 645-656.
```

**Erosão:**
```
Desmet, P.J.J. & Govers, G. (1996). A GIS procedure for automatically 
calculating the USLE LS factor on topographically complex landscape units. 
Journal of Soil and Water Conservation, 51(5), 427-433.
```

### 14.3. Recursos Online Adicionais

| Recurso | Tipo | URL |
|---------|------|-----|
| GIS Geography | Artigos GIS | gisgeography.com |
| GIS Lounge | Notícias GIS | gislounge.com |
| Spatial Thoughts | Tutoriais | spatialthoughts.com |
| Medium - Towards Data Science | Artigos técnicos | towardsdatascience.com |

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `01_STACK_TECNICO.md` | Bibliotecas e ferramentas utilizadas |
| `04_BACKLOG_PROJECTOS.md` | Projectos que usam estas metodologias |
| `10_NUCLEO_FLORESTAL_RISCOS.md` | Aplicação de USLE, NBR |
| `09_NUCLEO_CARSICO.md` | Aplicação de DRASTIC |
| `08_NUCLEO_URBANO.md` | pgRouting, viewshed |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-28 | 1.0 | Documento inicial com referências organizadas por tema |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
