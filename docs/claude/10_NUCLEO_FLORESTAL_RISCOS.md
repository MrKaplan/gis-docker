# 10 - NÚCLEO FLORESTAL E RISCOS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Projectos do Núcleo](#2-projectos-do-núcleo)
3. [Anchor Projects](#3-anchor-projects)
4. [Análise de Incêndios e Regeneração](#4-análise-de-incêndios-e-regeneração)
5. [Análise de Riscos Naturais](#5-análise-de-riscos-naturais)
6. [Ecologia e Biodiversidade](#6-ecologia-e-biodiversidade)
7. [Dados e Fontes](#7-dados-e-fontes)
8. [Metodologias](#8-metodologias)
9. [Implementação Técnica](#9-implementação-técnica)
10. [Outputs e Entregas](#10-outputs-e-entregas)
11. [Comunicação](#11-comunicação)

---

## 1. Visão Geral

### 1.1. Identificação do Núcleo

| Campo | Valor |
|-------|-------|
| **Prefixo** | NF- |
| **Nome** | Núcleo Florestal e Riscos |
| **Emoji** | 🌲🔥 |
| **Área Geográfica** | Toda a área de estudo |
| **Área aproximada** | ~800 km² |
| **Anchor Projects** | NF-00 (Vulnerabilidade Global), NF-01/PS-07 (Regeneração Pós-Fogo - TESE) |

### 1.2. Contexto Territorial

O Núcleo Florestal e Riscos cobre **toda a área de estudo** e aborda:

- **Floresta:** Ocupação, desflorestação, reflorestação, maturidade
- **Incêndios:** Histórico, regeneração pós-fogo, perigosidade
- **Riscos naturais:** Erosão, derrocadas, cheias
- **Ecologia:** Corredores, fragmentação, espécies invasoras

### 1.3. Relevância

| Aspecto | Descrição |
|---------|-----------|
| **Incêndios** | Região com histórico significativo de área ardida |
| **Riscos** | Combinação de riscos (incêndio + erosão + cheias) |
| **Ecologia** | Fragmentação florestal, invasoras (acácias) |
| **Pessoal** | **Tese de mestrado** sobre regeneração pós-fogo |
| **Prático** | Apoio à gestão florestal e proteção civil |

### 1.4. Importância Estratégica

Este núcleo contém **2 dos 5 Anchor Projects**:

1. **PS-07/NF-01** - Regeneração Pós-Fogo (Tese de Mestrado) - **#1 no portfolio**
2. **NF-00** - Índice de Vulnerabilidade Global - **#5 no portfolio**

### 1.5. Temas Principais

| Tema | Projectos |
|------|-----------|
| **Incêndios** | NF-01, NF-07, NF-08 |
| **Floresta** | NF-02, NF-03, NF-04, NF-05, NF-06 |
| **Riscos** | NF-00, NF-09 |
| **Ecologia** | NF-10, NF-11, NF-12 |
| **Energia** | NF-13, NF-14 |

---

## 2. Projectos do Núcleo

### 2.1. Tabela Resumo

| ID | Nome | Tipo | Proc. | Prior. | Origem |
|----|------|------|-------|--------|--------|
| **NF-00** | ⭐ Vulnerabilidade Global | P+C | 🖥️→🌐 | 🔴 | #269 |
| **NF-01** | ⭐ **Regeneração Pós-Fogo (TESE)** | **P** | 🌍+🌐 | 🔴 | PS-07 |
| NF-02 | Desflorestação | C | 🖥️→🌐 | 🟡 | #387 |
| NF-03 | Reflorestação | C | 🖥️→🌐 | 🟡 | #388 |
| NF-04 | Maturidade Povoamentos | C | 🖥️→🌐 | 🟡 | #389 |
| NF-05 | Forest Carbon | C | 🖥️→🌐 | 🟢 | #394 |
| NF-06 | LAI (Leaf Area Index) | C | 🌍+🌐 | 🟢 | #400 |
| NF-07 | Áreas Ardidas (histórico) | C | 🖥️→🌐 | 🟡 | ICNF |
| NF-08 | Perigosidade Incêndio | C | 🖥️→🌐 | 🟡 | Novo |
| NF-09 | Susceptibilidade Derrocadas | C | 🖥️→🌐 | 🟡 | #277 |
| NF-10 | Acácias Invasoras | C+A | 🌍+🖥️ | 🟡 | #376 |
| NF-11 | Corredores Ecológicos | A+C | 🖥️→🌐 | 🟡 | #280 |
| NF-12 | Fragmentação Paisagem | C+A | 🖥️→🌐 | 🟡 | #281 |
| NF-13 | Wind Farm Suitability | A | 🖥️→🌐 | 🟢 | #353 |
| NF-14 | Turbine Visibility | A+C | 🖥️→🌐 | 🟢 | #354 |

**Legenda:**
- **Tipo:** F=Ferramenta, P=Projecto, C=Camada, A=Análise
- **Proc.:** 🌐=Online, 🖥️=Desktop, 🌍=GEE
- **Prior.:** 🔴=Alta, 🟡=Média, 🟢=Baixa

---

## 3. Anchor Projects

### 3.1. PS-07/NF-01 - Regeneração Pós-Fogo (TESE DE MESTRADO) ⭐⭐⭐

| Campo | Valor |
|-------|-------|
| **ID** | NF-01 / PS-07 |
| **Tipo** | **Projecto (Anchor #1)** |
| **Prioridade** | 🔴 **MÁXIMA** |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Contexto** | **Tese de Mestrado pessoal** |

#### 3.1.1. Conceito

Este é o **projecto mais importante do portfolio** — a tese de mestrado do autor, focada na análise da regeneração vegetal após incêndios florestais usando séries temporais de 10 anos.

**Título provisório:** *"Análise da regeneração vegetal pós-incêndio no Médio Tejo: uma abordagem multitemporal com detecção remota"*

#### 3.1.2. Objectivos da Tese

1. Caracterizar a dinâmica de regeneração pós-fogo na área de estudo
2. Identificar factores que influenciam a velocidade de recuperação
3. Comparar diferentes tipos de vegetação/uso do solo
4. Desenvolver indicadores de sucesso da regeneração
5. Criar ferramenta de visualização e consulta

#### 3.1.3. Metodologia

```
┌─────────────────────────────────────────────────────────────┐
│                    WORKFLOW DA TESE                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. SELECÇÃO DE ÁREAS ARDIDAS                              │
│     └── Perímetros ICNF (2013-2023)                        │
│     └── Critérios: >100 ha, informação completa            │
│                                                             │
│  2. SÉRIES TEMPORAIS (GEE)                                 │
│     └── Sentinel-2 (2015-2025)                             │
│     └── Landsat 8/9 (2013-2025)                            │
│     └── Índices: NDVI, NBR, NDMI                           │
│                                                             │
│  3. ANÁLISE DE REGENERAÇÃO                                 │
│     └── Trajectórias de recuperação                        │
│     └── Tempo para recuperação (threshold)                 │
│     └── Comparação com áreas não ardidas (controlo)        │
│                                                             │
│  4. FACTORES EXPLICATIVOS                                  │
│     └── Severidade do fogo (dNBR)                         │
│     └── Uso do solo pré-fogo                               │
│     └── Topografia (altitude, declive, exposição)          │
│     └── Clima (precipitação pós-fogo)                      │
│     └── Gestão pós-fogo (reflorestação?)                   │
│                                                             │
│  5. MODELAÇÃO                                              │
│     └── Regressão: Tempo_recuperação ~ Factores            │
│     └── Random Forest para classificação                   │
│                                                             │
│  6. WEBGIS + DASHBOARD                                     │
│     └── Visualização de resultados                         │
│     └── Ferramenta de consulta por área                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

#### 3.1.4. Índices Espectrais

| Índice | Fórmula | Uso |
|--------|---------|-----|
| **NDVI** | (NIR - Red) / (NIR + Red) | Vigor vegetação |
| **NBR** | (NIR - SWIR2) / (NIR + SWIR2) | Severidade fogo |
| **dNBR** | NBR_pré - NBR_pós | Delta de severidade |
| **RdNBR** | dNBR / √(NBR_pré) | Normalizado |
| **NDMI** | (NIR - SWIR1) / (NIR + SWIR1) | Humidade vegetação |

#### 3.1.5. Classes de Severidade (dNBR)

| Classe | dNBR | Descrição |
|--------|------|-----------|
| Não ardido | < 0.1 | Sem alteração |
| Baixa | 0.1 - 0.27 | Chamuscado |
| Média-baixa | 0.27 - 0.44 | Parcialmente consumido |
| Média-alta | 0.44 - 0.66 | Muito afectado |
| Alta | > 0.66 | Totalmente consumido |

#### 3.1.6. Implementação GEE

```javascript
// Google Earth Engine - Série temporal NBR

var firePerimeter = ee.FeatureCollection('users/xxx/fire_2017');
var startDate = '2017-01-01';
var endDate = '2025-01-01';

// Sentinel-2
var s2 = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
  .filterBounds(firePerimeter)
  .filterDate(startDate, endDate)
  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20));

// Adicionar NBR
var addNBR = function(image) {
  var nbr = image.normalizedDifference(['B8', 'B12']).rename('NBR');
  return image.addBands(nbr);
};

var s2NBR = s2.map(addNBR);

// Série temporal mensal
var months = ee.List.sequence(0, 96);  // 8 anos × 12 meses
var nbrTimeSeries = months.map(function(m) {
  var start = ee.Date(startDate).advance(m, 'month');
  var end = start.advance(1, 'month');
  var monthly = s2NBR.filterDate(start, end).median();
  return monthly.set('system:time_start', start.millis());
});

// Calcular média por área ardida
var nbrMean = ee.ImageCollection(nbrTimeSeries)
  .map(function(img) {
    var mean = img.reduceRegion({
      reducer: ee.Reducer.mean(),
      geometry: firePerimeter,
      scale: 10
    });
    return img.set('NBR_mean', mean.get('NBR'));
  });

// Exportar série temporal
Export.table.toDrive({
  collection: nbrMean,
  description: 'NBR_timeseries',
  fileFormat: 'CSV'
});
```

#### 3.1.7. Cronograma da Tese

| Fase | Actividade | Duração |
|------|------------|---------|
| 1 | Revisão bibliográfica | 2 meses |
| 2 | Selecção e preparação de dados | 1 mês |
| 3 | Processamento GEE | 2 meses |
| 4 | Análise estatística | 2 meses |
| 5 | Desenvolvimento WebGIS | 1 mês |
| 6 | Redacção | 3 meses |
| 7 | Revisão e defesa | 1 mês |
| **Total** | | **~12 meses** |

---

### 3.2. NF-00 - Índice de Vulnerabilidade Global ⭐

| Campo | Valor |
|-------|-------|
| **ID** | NF-00 |
| **Tipo** | **Projecto + Camada (Anchor #5)** |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #269 |

#### 3.2.1. Conceito

Criar um **índice integrado de vulnerabilidade** que combine múltiplos riscos naturais:
- Incêndio florestal
- Erosão hídrica
- Derrocadas/deslizamentos
- Cheias

#### 3.2.2. Metodologia

```
VULNERABILIDADE GLOBAL = f(Perigosidade, Exposição, Capacidade)

Componentes:
├── PERIGOSIDADE (Hazard)
│   ├── Incêndio: NF-08
│   ├── Erosão: NA-10 (USLE)
│   ├── Derrocadas: NF-09
│   └── Cheias: NH-05/NH-06
│
├── EXPOSIÇÃO (Exposure)
│   ├── População (Censos)
│   ├── Edificado
│   └── Infraestruturas
│
└── CAPACIDADE (Coping Capacity)
    ├── Acesso a serviços emergência
    └── Cobertura bombeiros
```

#### 3.2.3. Fórmula de Integração

```python
def calculate_global_vulnerability(
    fire_hazard,      # 0-1
    erosion_hazard,   # 0-1
    landslide_hazard, # 0-1
    flood_hazard,     # 0-1
    exposure,         # 0-1
    capacity          # 0-1
):
    """
    Calcula índice de vulnerabilidade global.
    """
    # Combinação de perigosidades (máximo ou média ponderada)
    hazard = np.maximum.reduce([
        fire_hazard * 0.35,
        erosion_hazard * 0.25,
        landslide_hazard * 0.20,
        flood_hazard * 0.20
    ])
    
    # Vulnerabilidade = Hazard × Exposure / Capacity
    vulnerability = (hazard * exposure) / (capacity + 0.1)
    
    # Normalizar 0-1
    return normalize(vulnerability)
```

#### 3.2.4. Outputs

- Mapa de vulnerabilidade global (5 classes)
- Mapas por componente de risco
- Dashboard com estatísticas por freguesia
- Identificação de hotspots prioritários

---

## 4. Análise de Incêndios e Regeneração

### 4.1. NF-07 - Áreas Ardidas (histórico)

| Campo | Valor |
|-------|-------|
| **ID** | NF-07 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Fonte** | ICNF |

**Objectivo:** Compilar e publicar histórico de áreas ardidas.

**Dados:** Perímetros ICNF (2001-presente)

**Análises:**
- Área ardida por ano
- Recorrência de incêndios
- Tendências temporais
- Sazonalidade

**Outputs:**
- Mapa de perímetros por ano
- Mapa de recorrência (nº de vezes ardido)
- Gráficos temporais

---

### 4.2. NF-08 - Perigosidade Incêndio

| Campo | Valor |
|-------|-------|
| **ID** | NF-08 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |

**Objectivo:** Modelar perigosidade de incêndio florestal.

**Factores:**

| Factor | Peso | Fonte |
|--------|------|-------|
| Ocupação do solo | 30% | COS |
| Declive | 20% | MDT |
| Exposição solar | 15% | MDT |
| Histórico de incêndios | 15% | ICNF |
| Distância a estradas | 10% | OSM |
| Densidade populacional | 10% | Censos |

**Metodologia AHP:**
```python
def fire_hazard_index(land_cover, slope, aspect, history, 
                      road_distance, population):
    """
    Calcula índice de perigosidade de incêndio.
    """
    # Reclassificar ocupação do solo
    lc_risk = reclassify_land_cover(land_cover)
    # Eucalipto/Pinheiro = Alto, Agrícola = Baixo, Urbano = Muito Baixo
    
    # Declive (>30% = muito alto)
    slope_risk = classify(slope, [0, 10, 20, 30], [1, 2, 3, 4])
    
    # Exposição (Sul/Oeste = mais risco)
    aspect_risk = classify_aspect(aspect)
    
    # Combinação AHP
    hazard = (
        0.30 * lc_risk +
        0.20 * slope_risk +
        0.15 * aspect_risk +
        0.15 * history_risk +
        0.10 * road_risk +
        0.10 * pop_risk
    )
    
    return hazard
```

---

## 5. Análise de Riscos Naturais

### 5.1. NF-09 - Susceptibilidade Derrocadas

| Campo | Valor |
|-------|-------|
| **ID** | NF-09 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #277 |

**Objectivo:** Modelar susceptibilidade a movimentos de massa.

**Factores:**

| Factor | Descrição | Fonte |
|--------|-----------|-------|
| Declive | Principal factor | MDT |
| Geologia | Litologia, fracturas | LNEG |
| Uso do solo | Cobertura vegetal | COS |
| Curvatura | Perfil e planta | MDT |
| TWI | Saturação potencial | MDT |
| Distância falhas | Fracturação | LNEG |

**Metodologia:**
```
Susceptibilidade = f(Declive, Geologia, Uso_Solo, 
                     Curvatura, TWI, Fracturas)

Método: AHP ou Regressão Logística

Classes:
1. Muito Baixa
2. Baixa
3. Moderada
4. Alta
5. Muito Alta
```

**Validação:** Comparar com inventário de movimentos (se disponível) ou REN.

---

## 6. Ecologia e Biodiversidade

### 6.1. NF-10 - Acácias Invasoras

| Campo | Valor |
|-------|-------|
| **ID** | NF-10 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🖥️ Desktop |
| **Origem** | #376 |

**Objectivo:** Detectar e mapear acácias invasoras usando detecção remota.

**Metodologia:**
```
Abordagem: Detecção da floração (Fevereiro-Março)

1. Identificar período de floração (flores amarelas)
2. Usar Sentinel-2: relação B4/B3 anómala
3. Validação de campo
4. Classificação supervisionada
```

**Implementação GEE:**
```javascript
// Detecção de floração de acácias
var flowering_period = ee.DateRange('2024-02-15', '2024-03-31');

var s2 = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
  .filterBounds(roi)
  .filterDate(flowering_period)
  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 10))
  .median();

// Índice de "amarelo" (floração)
var yellowIndex = s2.expression(
  '(B4 - B3) / (B4 + B3)',
  {'B4': s2.select('B4'), 'B3': s2.select('B3')}
).rename('yellowIndex');

// Threshold para floração
var acacia_potential = yellowIndex.gt(0.15);
```

**Outputs:**
- Mapa de distribuição provável
- Área estimada
- Recomendações de gestão

**Comunicação:** Potencial artigo blog "Como detectar acácias invasoras com satélites".

---

### 6.2. NF-11 - Corredores Ecológicos

| Campo | Valor |
|-------|-------|
| **ID** | NF-11 |
| **Tipo** | Análise + Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #280 |

**Objectivo:** Identificar e mapear corredores ecológicos potenciais.

**Metodologia: Land Facet Corridor**
```
1. Identificar patches de habitat (florestas, matos)
2. Criar superfície de custo (resistência à dispersão)
3. Calcular least-cost paths entre patches
4. Identificar corredores de conectividade
```

**Superfície de custo:**

| Uso do Solo | Custo |
|-------------|-------|
| Floresta nativa | 1 |
| Matos | 2 |
| Agrícola extensivo | 5 |
| Agrícola intensivo | 10 |
| Urbano | 100 |
| Estradas | 50-100 |

**Ferramentas:**
- QGIS: r.cost, r.drain (via GRASS)
- Python: scikit-image, networkx

---

### 6.3. NF-12 - Fragmentação Paisagem

| Campo | Valor |
|-------|-------|
| **ID** | NF-12 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #281 |

**Objectivo:** Calcular métricas de fragmentação da paisagem.

**Ferramenta:** pylandstats (Python)

**Métricas a calcular:**

| Métrica | Descrição | Nível |
|---------|-----------|-------|
| NP | Número de patches | Classe |
| PD | Densidade de patches | Classe |
| LPI | Largest Patch Index | Classe |
| ED | Edge Density | Classe |
| SHAPE | Shape Index médio | Classe |
| COHESION | Coesão do patch | Classe |
| SHDI | Shannon Diversity | Paisagem |
| CONTAG | Contágio | Paisagem |

**Implementação:**
```python
import pylandstats as pls

# Carregar mapa de ocupação do solo
landscape = pls.Landscape('cos_2018.tif')

# Métricas ao nível da paisagem
landscape_metrics = landscape.compute_landscape_metrics_df()

# Métricas por classe
class_metrics = landscape.compute_class_metrics_df()

# Comparação temporal
cos_1995 = pls.Landscape('cos_1995.tif')
cos_2018 = pls.Landscape('cos_2018.tif')

# Mudança de fragmentação
fragmentation_change = compare_landscapes(cos_1995, cos_2018)
```

---

## 7. Dados e Fontes

### 7.1. Dados de Incêndios

| Dado | Fonte | Formato | Actualização |
|------|-------|---------|--------------|
| Perímetros área ardida | ICNF | SHP | Anual |
| Sentinel-2 (NBR) | Copernicus | Raster | 5 dias |
| Landsat (histórico) | USGS | Raster | 16 dias |

### 7.2. Dados de Floresta

| Dado | Fonte | Formato | Actualização |
|------|-------|---------|--------------|
| COS (ocupação solo) | DGT | Vector | ~3 anos |
| Inventário Florestal | ICNF | Vector/Tabular | ~10 anos |
| LiDAR (altura) | DGT | Raster | Variável |

### 7.3. Dados de Riscos

| Dado | Fonte | Formato | Uso |
|------|-------|---------|-----|
| MDT LiDAR | DGT | Raster | Declive, curvatura |
| Geologia | LNEG | Vector | Litologia, falhas |
| REN | CCDR | Vector | Validação |

### 7.4. Dados Climáticos

| Dado | Fonte | Formato | Uso |
|------|-------|---------|-----|
| Precipitação | IPMA | Tabular | Regeneração |
| Temperatura | IPMA | Tabular | Perigosidade |
| Índice FWI | IPMA | Raster | Risco incêndio |

---

## 8. Metodologias

### 8.1. NBR e dNBR

```python
import ee

def calculate_severity(pre_image, post_image):
    """
    Calcula severidade do fogo usando dNBR.
    
    Args:
        pre_image: Imagem pré-fogo
        post_image: Imagem pós-fogo imediata
    
    Returns:
        Imagem de severidade classificada
    """
    # NBR = (NIR - SWIR2) / (NIR + SWIR2)
    nbr_pre = pre_image.normalizedDifference(['B8', 'B12'])
    nbr_post = post_image.normalizedDifference(['B8', 'B12'])
    
    # dNBR
    dnbr = nbr_pre.subtract(nbr_post)
    
    # RdNBR (relativizado)
    rdnbr = dnbr.divide(nbr_pre.abs().sqrt())
    
    # Classificar severidade
    severity = dnbr.where(dnbr.lt(0.1), 0)  # Não ardido
    severity = severity.where(dnbr.gte(0.1).And(dnbr.lt(0.27)), 1)  # Baixa
    severity = severity.where(dnbr.gte(0.27).And(dnbr.lt(0.44)), 2)  # Média-baixa
    severity = severity.where(dnbr.gte(0.44).And(dnbr.lt(0.66)), 3)  # Média-alta
    severity = severity.where(dnbr.gte(0.66), 4)  # Alta
    
    return severity.rename('severity')
```

### 8.2. Trajectória de Recuperação

```python
def analyze_recovery_trajectory(fire_polygon, fire_date, end_date):
    """
    Analisa trajectória de recuperação NDVI pós-fogo.
    """
    # Série temporal mensal
    months = get_months_between(fire_date, end_date)
    
    ndvi_series = []
    for month in months:
        ndvi = get_monthly_ndvi(fire_polygon, month)
        ndvi_series.append({
            'date': month,
            'ndvi_mean': ndvi['mean'],
            'ndvi_std': ndvi['std']
        })
    
    # Calcular métricas de recuperação
    baseline_ndvi = get_pre_fire_ndvi(fire_polygon, fire_date)
    
    recovery_metrics = {
        'time_to_50': find_recovery_time(ndvi_series, baseline_ndvi, 0.5),
        'time_to_80': find_recovery_time(ndvi_series, baseline_ndvi, 0.8),
        'time_to_100': find_recovery_time(ndvi_series, baseline_ndvi, 1.0),
        'max_ndvi': max(s['ndvi_mean'] for s in ndvi_series),
        'recovery_rate': calculate_recovery_rate(ndvi_series)
    }
    
    return ndvi_series, recovery_metrics
```

### 8.3. Análise Multicritério (AHP)

```python
def ahp_weights(comparison_matrix):
    """
    Calcula pesos AHP a partir de matriz de comparação.
    """
    import numpy as np
    
    # Normalizar colunas
    col_sums = comparison_matrix.sum(axis=0)
    normalized = comparison_matrix / col_sums
    
    # Média das linhas = pesos
    weights = normalized.mean(axis=1)
    
    # Verificar consistência (CR < 0.1)
    consistency_ratio = calculate_consistency_ratio(comparison_matrix, weights)
    
    if consistency_ratio > 0.1:
        print(f"Aviso: CR = {consistency_ratio:.3f} > 0.1, matriz inconsistente")
    
    return weights
```

---

## 9. Implementação Técnica

### 9.1. Estrutura de Ficheiros

```
projects/nucleo-florestal-riscos/
│
├── README.md
├── followup.md
│
├── tese/                              # PS-07/NF-01
│   ├── capitulos/
│   ├── figuras/
│   ├── dados/
│   └── referencias.bib
│
├── notebooks/
│   ├── 01_areas_ardidas.ipynb        # NF-07
│   ├── 02_severidade.ipynb           # NF-01
│   ├── 03_regeneracao.ipynb          # NF-01
│   ├── 04_perigosidade.ipynb         # NF-08
│   ├── 05_derrocadas.ipynb           # NF-09
│   ├── 06_vulnerabilidade.ipynb      # NF-00
│   ├── 07_acacias.ipynb              # NF-10
│   ├── 08_corredores.ipynb           # NF-11
│   └── 09_fragmentacao.ipynb         # NF-12
│
├── scripts/
│   ├── gee_nbr_timeseries.js
│   ├── severity.py
│   ├── recovery.py
│   ├── fire_hazard.py
│   ├── landslide.py
│   └── vulnerability.py
│
├── data/
│   ├── fires/
│   ├── forest/
│   └── risks/
│
└── outputs/
    ├── raster/
    ├── vector/
    ├── figures/
    └── tables/
```

### 9.2. Dependências entre Projectos

```
PB-00 (MDT LiDAR)
    │
    ├── NF-08 (Perigosidade Incêndio)
    │
    ├── NF-09 (Susceptibilidade Derrocadas)
    │
    └── Derivados topográficos

NF-07 (Áreas Ardidas Histórico)
    │
    └── NF-01 (Regeneração Pós-Fogo - TESE) ⭐⭐⭐
            │
            └── Dashboard + WebGIS

NF-08 + NF-09 + NA-10 + NH-05
    │
    └── NF-00 (Vulnerabilidade Global) ⭐

COS (Ocupação Solo)
    │
    ├── NF-02 (Desflorestação)
    ├── NF-03 (Reflorestação)
    ├── NF-11 (Corredores)
    └── NF-12 (Fragmentação)

GEE (Sentinel-2)
    │
    ├── NF-01 (NBR/NDVI temporal)
    ├── NF-06 (LAI)
    └── NF-10 (Acácias)
```

---

## 10. Outputs e Entregas

### 10.1. Tese de Mestrado (NF-01/PS-07)

**Entregáveis académicos:**
- Dissertação escrita
- Defesa pública
- Artigo científico (se aceite)

**Entregáveis portfolio:**
- WebGIS de regeneração pós-fogo
- Dashboard com séries temporais
- Código reproduzível no GitHub
- Posts LinkedIn e blog

### 10.2. Dashboard WebGIS

**URL:** `regeneracao.meudominio.pt` ou `meudominio.pt/webgis/regeneracao/`

**Funcionalidades:**
- Mapa de áreas ardidas (seleccionável por ano)
- Série temporal NDVI/NBR por área
- Comparação entre áreas
- Download de dados

### 10.3. Camadas Publicadas

| Camada | Tipo | Formato |
|--------|------|---------|
| Áreas ardidas (por ano) | Vector | PostGIS → Martin |
| Severidade (por incêndio) | Raster | COG → TiTiler |
| Recuperação actual | Raster | COG → TiTiler |
| Perigosidade incêndio | Raster | COG → TiTiler |
| Vulnerabilidade global | Raster | COG → TiTiler |
| Susceptibilidade derrocadas | Raster | COG → TiTiler |
| Acácias (potencial) | Vector | PostGIS → Martin |

---

## 11. Comunicação

### 11.1. LinkedIn Post - Tese

**Headline:** "10 anos de recuperação florestal em mapas: a minha tese de mestrado 🌲🔥"

**Body:**
```
Acabei de entregar a minha tese de mestrado sobre regeneração 
pós-incêndio no Médio Tejo.

O que fiz:
📊 Analisei 10 anos de imagens de satélite (Sentinel-2 + Landsat)
🔥 Estudei a recuperação de X áreas ardidas desde 2013
📈 Identifiquei os factores que mais influenciam a regeneração
🗺️ Criei um WebGIS para visualizar os resultados

Principais descobertas:
- O tempo médio de recuperação é de X anos
- Áreas com eucalipto recuperam mais rápido mas...
- O declive e a severidade são os factores mais importantes

Todo o código e dados estão disponíveis: [GitHub]
Explorem o WebGIS: [link]

#Mestrado #GIS #RemoteSensing #Incêndios #Portugal
```

### 11.2. LinkedIn Post - Vulnerabilidade

**Headline:** "Mapeei os riscos naturais do Médio Tejo: onde se cruzam incêndios, erosão e cheias 🗺️"

**Body:**
```
Criei um índice de vulnerabilidade global que integra:

🔥 Perigosidade de incêndio
💧 Risco de cheia
⛰️ Susceptibilidade a derrocadas
🌧️ Erosão hídrica

O resultado? Um mapa que mostra onde os riscos se acumulam 
e quais as zonas prioritárias para intervenção.

[imagem do mapa]

Dashboard interactivo: [link]

Metodologia: AHP + GIS + dados abertos.

#GIS #Riscos #ProtecçãoCivil #Portugal #OpenData
```

### 11.3. Artigo Blog - Acácias

**Título:** "Detectar acácias invasoras com imagens de satélite: um guia prático"

**Secções:**
1. O problema das acácias em Portugal
2. Por que a floração é a chave
3. Metodologia: índice de "amarelo"
4. Implementação em Google Earth Engine
5. Validação de campo
6. Limitações e melhorias
7. Código disponível

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Dados base (MDT) - PB-00 |
| `06_NUCLEO_AGRICOLA.md` | Complementar (erosão USLE) |
| `07_NUCLEO_HIDRICO.md` | Complementar (cheias) |
| `12_ANCHOR_PROJECTS.md` | Detalhe dos anchor projects |
| `13_BIBLIOGRAFIA.md` | Referências sobre incêndios e riscos |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Conceito em 04_BACKLOG |
| 2025-01-28 | 2.0 | Documento completo, 15 projectos detalhados, tese expandida |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
