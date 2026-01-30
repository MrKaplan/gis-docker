# 06 - NÚCLEO AGRÍCOLA

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Conceito: Observatório Agrícola](#2-conceito-observatório-agrícola)
3. [Projectos do Núcleo](#3-projectos-do-núcleo)
4. [Dados e Fontes](#4-dados-e-fontes)
5. [Metodologias](#5-metodologias)
6. [Implementação Técnica](#6-implementação-técnica)
7. [Outputs e Entregas](#7-outputs-e-entregas)
8. [Comunicação](#8-comunicação)

---

## 1. Visão Geral

### 1.1. Identificação do Núcleo

| Campo | Valor |
|-------|-------|
| **Prefixo** | NA- |
| **Nome** | Núcleo Agrícola |
| **Emoji** | 🌾 |
| **Área Geográfica** | Golegã, Paul do Boquilobo, Lezíria do Tejo |
| **Área aproximada** | ~200 km² |
| **Anchor Project** | NA-00 - Observatório Agrícola + RAMSAR |

### 1.2. Contexto Territorial

O Núcleo Agrícola centra-se na **planície aluvial do Tejo**, uma das áreas agrícolas mais produtivas de Portugal:

- **Golegã:** Capital do cavalo, feira anual, agricultura intensiva
- **Paul do Boquilobo:** Reserva Natural (Ramsar), zona húmida de importância internacional
- **Lezíria:** Solos aluviais férteis, culturas de regadio

### 1.3. Relevância

| Aspecto | Descrição |
|---------|-----------|
| **Económico** | Agricultura de alta produtividade |
| **Ambiental** | Impacto potencial na Reserva Natural |
| **Hídrico** | Interacção com zonas húmidas |
| **Biodiversidade** | Aves migratórias, ecossistemas ripícolas |
| **Conservação** | Sítio RAMSAR de importância internacional |

### 1.4. Temas Principais

- Agricultura e produtividade
- Poluição difusa potencial
- Erosão e degradação de solos
- Biodiversidade e conservação
- Sequestro de carbono
- Monitorização de seca

---

## 2. Conceito: Observatório Agrícola

### 2.1. Ideia Central

O **NA-00 - Observatório Agrícola** é um dos 5 **Anchor Projects** do portfolio. Pretende criar um dashboard/WebGIS que funcione como um "observatório" da actividade agrícola na região, monitorizando:

- Estado das culturas (NDVI temporal)
- Stress hídrico
- Potenciais impactos ambientais
- Evolução temporal da ocupação
- Impacto na Reserva RAMSAR

### 2.2. Estrutura do Observatório

```
OBSERVATÓRIO AGRÍCOLA DA LEZÍRIA + RAMSAR
│
├── 📊 Caracterização Base
│   ├── Solos e capacidade de uso
│   ├── Ocupação actual (COS + IFAP)
│   └── Compatibilidade ocupação vs. potencial
│
├── 📈 Monitorização Contínua
│   ├── Stress hídrico (NDVI temporal) → NA-02
│   ├── Soil moisture (SMAP) → NA-01
│   ├── Índice de seca → NA-05
│   └── NDVI médio por zona → NA-09
│
├── ⚠️ Riscos e Impactos
│   ├── Erosão do solo (USLE) → NA-10, NA-11, NA-12
│   ├── Poluição difusa potencial → NA-04
│   ├── Desertificação (MEDALUS) → NA-06
│   └── Impacto no Paul do Boquilobo
│
├── 🌱 Sustentabilidade
│   ├── Resiliência de culturas → NA-03
│   └── Sequestro de carbono → NA-07, NA-08
│
└── 🦆 Biodiversidade
    ├── Conectividade ecológica
    ├── Benefício para fauna
    └── Zonas buffer RAMSAR
```

### 2.3. Público-Alvo

| Público | Interesse |
|---------|-----------|
| Agricultores | Estado das culturas, stress hídrico, alertas |
| Técnicos municipais | Planeamento, fiscalização, ordenamento |
| Investigadores | Dados abertos, séries temporais, metodologias |
| Público geral | Turismo, percursos, educação ambiental |
| Gestores ambientais | Impacto no Paul, biodiversidade, conservação |
| ICNF | Gestão da Reserva Natural |

---

## 3. Projectos do Núcleo

### 3.1. Tabela Resumo

| ID | Nome | Tipo | Proc. | Prior. | Origem |
|----|------|------|-------|--------|--------|
| **NA-00** | ⭐ Observatório Agrícola | P | 🌐 | 🔴 | Conceito integrador |
| NA-01 | Precision Farming (light) | C | 🌍+🌐 | 🟡 | #1 |
| NA-02 | Water Stress (NDVI temporal) | C | 🌍+🌐 | 🔴 | #12 |
| NA-03 | Crop Resilience | C+A | 🖥️+🌐 | 🟡 | #16 |
| NA-04 | Poluição Difusa Potencial | C | 🖥️→🌐 | 🟡 | #21 |
| NA-05 | Drought Monitoring | C | 🌍+🌐 | 🟡 | #26 |
| NA-06 | Desertificação (MEDALUS) | C | 🖥️→🌐 | 🟡 | #179 |
| NA-07 | Carbon Sequestration (simples) | C | 🖥️→🌐 | 🟢 | #185 |
| NA-08 | Carbon Sequestration (NDVI) | C | 🌍+🌐 | 🟢 | #185 |
| NA-09 | NDVI Temporal (vectorial) | C | 🌍+🌐 | 🟡 | #191 |
| NA-10 | Erosão USLE | C | 🖥️→🌐 | 🟡 | #806 |
| NA-11 | LS Factor | C | 🖥️→🌐 | 🟡 | #808 |
| NA-12 | Erosion Hotspots | C | 🖥️→🌐 | 🟡 | #804 |

**Legenda:**
- **Tipo:** P=Projecto, C=Camada, A=Análise, F=Ferramenta
- **Proc.:** 🌐=Online, 🖥️=Desktop, 🌍=GEE
- **Prior.:** 🔴=Alta, 🟡=Média, 🟢=Baixa

---

### 3.2. NA-01 - Precision Farming (light)

| Campo | Valor |
|-------|-------|
| **ID** | NA-01 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | #1 (Precision Farming) |

**Objectivo:** Demonstrar conceitos de agricultura de precisão com dados abertos.

**Nota:** Versão "light" porque não temos dados de sensores de campo.

**O que podemos fazer:**
- Variabilidade espacial de NDVI por parcela
- Zonas de gestão diferenciada
- Correlação NDVI vs. soil moisture (SMAP)

**O que NÃO podemos fazer (sem dados de campo):**
- Mapas de aplicação variável de fertilizantes
- Dados de yield monitors
- Sensores de solo em tempo real

**Dados:**
- NDVI (Sentinel-2)
- Soil moisture (SMAP)
- Parcelas IFAP

---

### 3.3. NA-02 - Water Stress (NDVI Temporal)

| Campo | Valor |
|-------|-------|
| **ID** | NA-02 |
| **Tipo** | Camada |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | #12 (Water Stress) |

**Objectivo:** Monitorizar o stress hídrico das culturas através de NDVI temporal.

**Dados:**
- Sentinel-2 (bandas B4, B8)
- Série temporal (mensal ou quinzenal)

**Metodologia:**
```python
# NDVI
NDVI = (NIR - Red) / (NIR + Red)
     = (B8 - B4) / (B8 + B4)

# Interpretação
NDVI > 0.6  → Vegetação saudável
NDVI 0.3-0.6 → Vegetação moderada / stress ligeiro
NDVI < 0.3  → Vegetação em stress / solo exposto
```

**Outputs:**
- Série temporal de NDVI (animação/timelapse)
- Mapa de anomalias (desvio da média histórica)
- Dashboard com evolução semanal/mensal

**Processamento:** Google Earth Engine (recomendado para séries longas)

---

### 3.4. NA-03 - Crop Resilience

| Campo | Valor |
|-------|-------|
| **ID** | NA-03 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop + 🌐 Online |
| **Origem** | #16 (Crop Resilience) |

**Objectivo:** Avaliar a resiliência das culturas a eventos extremos.

**Abordagem:**
1. Analisar NDVI durante eventos de seca/calor
2. Comparar recuperação pós-evento
3. Identificar culturas/parcelas mais resilientes

**Dados:**
- COS (ocupação do solo)
- IFAP (parcelas agrícolas)
- NDVI temporal (GEE)

**Futuro:** Classificador ML para prever resiliência

---

### 3.5. NA-04 - Poluição Difusa Potencial

| Campo | Valor |
|-------|-------|
| **ID** | NA-04 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #21 (Agricultural Pollution) |

**Objectivo:** Criar um índice de risco de poluição difusa agrícola.

**IMPORTANTE:** Este é um índice de **risco potencial**, não uma medição real de poluição.

**Factores do modelo:**
```
Risco = f(Uso solo, Declive, Proximidade água, Flow accumulation)

Componentes:
1. Tipo de cultura (intensidade de inputs)
   - Hortícolas: Alto
   - Milho regadio: Alto
   - Prado permanente: Baixo
   
2. Declive (potencial de escorrência)
   - > 15%: Alto
   - 5-15%: Médio
   - < 5%: Baixo
   
3. Proximidade a linhas de água
   - < 50m: Alto
   - 50-200m: Médio
   - > 200m: Baixo
   
4. Flow accumulation (concentração de escoamento)
```

**Outputs:**
- Mapa de risco (3-5 classes)
- Zonas prioritárias de intervenção
- Impacto potencial no Paul do Boquilobo

---

### 3.6. NA-05 - Drought Monitoring

| Campo | Valor |
|-------|-------|
| **ID** | NA-05 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | #26 (Drought) |

**Objectivo:** Criar um índice de seca agrícola combinando múltiplas fontes.

**Componentes:**
```
Índice de Seca = f(NDVI anomaly, Soil moisture, Precipitação)

Dados:
- NDVI: Sentinel-2
- Soil moisture: SMAP/SMOS
- Precipitação: IPMA
```

**Outputs:**
- Mapa de índice de seca (actualizado periodicamente)
- Série temporal por zona/freguesia
- Alertas automáticos

---

### 3.7. NA-06 - Desertificação (MEDALUS)

| Campo | Valor |
|-------|-------|
| **ID** | NA-06 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #179 (Desertification) |

**Objectivo:** Aplicar o índice MEDALUS de susceptibilidade à desertificação.

**Metodologia:**
```
ESAs (Environmentally Sensitive Areas) = f(SQI, CQI, VQI, MQI)

Onde:
- SQI = Soil Quality Index
- CQI = Climate Quality Index
- VQI = Vegetation Quality Index
- MQI = Management Quality Index
```

**Dados necessários:**
- Tipo de solo, textura, profundidade
- Precipitação, evapotranspiração
- Coberto vegetal (COS)
- Práticas agrícolas (simplificado)

---

### 3.8. NA-07 - Carbon Sequestration (simples)

| Campo | Valor |
|-------|-------|
| **ID** | NA-07 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #185 (Carbon Sequestration) |

**Objectivo:** Estimar o sequestro de carbono com base em factores tabelados.

**Metodologia:**
```
Carbono = Σ (Área_classe × Factor_sequestro_classe)

Factores exemplo (tC/ha/ano):
- Floresta mista: 2.5
- Montado: 1.5
- Prado permanente: 1.0
- Cultura anual: 0.2
```

**Limitações:** Valores médios, não considera idade, densidade, gestão.

---

### 3.9. NA-08 - Carbon Sequestration (NDVI)

| Campo | Valor |
|-------|-------|
| **ID** | NA-08 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | #185 (Carbon Sequestration) |

**Objectivo:** Estimar biomassa/carbono usando NDVI como proxy.

**Metodologia:**
```
Biomassa ∝ f(NDVI_integral)

NDVI_integral = Σ NDVI ao longo do ano
             ≈ Produtividade primária
             ∝ Carbono fixado
```

**Nota:** Requer calibração com dados de campo para valores absolutos.

---

### 3.10. NA-09 - NDVI Temporal (vectorial)

| Campo | Valor |
|-------|-------|
| **ID** | NA-09 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | #191 (NDVI by Zone) |

**Objectivo:** Calcular estatísticas de NDVI por unidades administrativas ou parcelas.

**Outputs:**
- NDVI médio por freguesia
- NDVI médio por parcela IFAP
- Série temporal agregada
- Comparação inter-anual

**Vantagem:** Permite análise estatística em vez de apenas visualização raster.

---

### 3.11. NA-10 - Erosão USLE

| Campo | Valor |
|-------|-------|
| **ID** | NA-10 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #806 (USLE Soil Loss) |

**Objectivo:** Calcular a perda de solo potencial usando a equação USLE.

**Equação USLE:**
```
A = R × K × LS × C × P

Onde:
A  = Perda de solo (ton/ha/ano)
R  = Factor de erosividade da chuva
K  = Factor de erodibilidade do solo
LS = Factor topográfico (comprimento e declive)
C  = Factor de coberto vegetal
P  = Factor de práticas de conservação
```

**Dados necessários:**

| Factor | Fonte |
|--------|-------|
| R | Calculado de dados IPMA ou valores tabelados |
| K | Carta de solos + tabelas de erodibilidade |
| LS | Derivado do MDT LiDAR (PB-00) |
| C | Ocupação do solo (COS) |
| P | Assumir 1 ou mapear se dados disponíveis |

**Outputs:**
- Mapa de perda de solo (ton/ha/ano)
- Classificação (tolerável, moderada, alta, muito alta)
- Comparação com categoria REN "erosão hídrica"

---

### 3.12. NA-11 - LS Factor

| Campo | Valor |
|-------|-------|
| **ID** | NA-11 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #808 (LS Factor) |
| **Dependência** | PB-00 (MDT LiDAR) |

**Objectivo:** Calcular o factor topográfico LS da equação USLE.

**Metodologia:**
```python
# Factor LS combina comprimento (L) e declive (S)
LS = (flow_acc × cell_size / 22.13)^0.4 × S_factor

Onde S_factor depende do declive:
- Se slope < 9%: S = 10.8 × sin(slope) + 0.03
- Se slope >= 9%: S = 16.8 × sin(slope) - 0.5
```

**Nota:** Camada intermédia para USLE, mas útil por si só.

---

### 3.13. NA-12 - Erosion Hotspots

| Campo | Valor |
|-------|-------|
| **ID** | NA-12 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #804 (Erosion Hotspots) |
| **Dependência** | NA-10 (USLE) |

**Objectivo:** Identificar zonas críticas de erosão para intervenção prioritária.

**Critérios de selecção:**
```
Hotspot = USLE > threshold AND (proximidade_água OR declive_alto)

Priorização:
1. Perda de solo muito alta (>50 ton/ha/ano)
2. Adjacente a linhas de água
3. Sem coberto vegetal permanente
4. Sem práticas de conservação
```

**Outputs:**
- Mapa de hotspots (pontos/polígonos)
- Ranking de prioridade
- Área total afectada por classe

---

## 4. Dados e Fontes

### 4.1. Dados Vectoriais

| Dado | Fonte | URL/Acesso | Formato |
|------|-------|------------|---------|
| Parcelas agrícolas | IFAP | dados.gov.pt | SHP/GPKG |
| COS (várias datas) | DGT | SNIG | SHP/GPKG |
| Carta de Solos | DGADR | SNIG | SHP |
| Capacidade Uso Solo | DGADR | SNIG | SHP |
| Limites Paul Boquilobo | ICNF | SNIG | SHP |
| Percursos pedestres | OSM | Overpass | GeoJSON |
| Sítios RAMSAR | ICNF | SNIG | SHP |
| REN (erosão hídrica) | CCDR | SNIG | SHP |

### 4.2. Dados Raster

| Dado | Fonte | Resolução | Frequência |
|------|-------|-----------|------------|
| Sentinel-2 (NDVI) | Copernicus | 10m | 5 dias |
| SMAP Soil Moisture | NASA | 9km | 2-3 dias |
| SMOS Soil Moisture | ESA | 35km | 2-3 dias |
| MDT LiDAR | DGT | 2m | Estático |

### 4.3. Dados Tabulares

| Dado | Fonte | Frequência |
|------|-------|------------|
| Precipitação | IPMA | Diário |
| Temperatura | IPMA | Diário |
| Evapotranspiração | IPMA/SNIRH | Diário |
| Factores K (erodibilidade) | Bibliografia | Estático |
| Factores C (coberto) | Bibliografia | Estático |

### 4.4. Descobertas Importantes

**Parcelas IFAP disponíveis como dados abertos:**
- Parcelas agrícolas do IFAP em dados.gov.pt
- Permite análise ao nível da parcela
- Identificação de culturas
- Estatísticas mais precisas

---

## 5. Metodologias

### 5.1. NDVI Temporal (GEE)

```python
# Google Earth Engine
import ee

def get_ndvi_timeseries(geometry, start_date, end_date):
    """
    Obtém série temporal de NDVI para uma geometria.
    """
    collection = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED') \
        .filterBounds(geometry) \
        .filterDate(start_date, end_date) \
        .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20))
    
    def add_ndvi(image):
        ndvi = image.normalizedDifference(['B8', 'B4']).rename('NDVI')
        return image.addBands(ndvi)
    
    collection_ndvi = collection.map(add_ndvi)
    
    return collection_ndvi.select('NDVI')
```

### 5.2. USLE - Factor LS

```python
import richdem as rd
import numpy as np

def calculate_ls_factor(dem_path, cell_size=2):
    """
    Calcula o factor LS da USLE.
    """
    dem = rd.LoadGDAL(dem_path)
    
    # Slope em radianos
    slope_deg = rd.TerrainAttribute(dem, attrib='slope_degrees')
    slope_rad = np.radians(slope_deg)
    
    # Flow accumulation como proxy do comprimento
    flow_acc = rd.FlowAccumulation(dem, method='D8')
    
    # LS factor (fórmula simplificada)
    L = (flow_acc * cell_size / 22.13) ** 0.4
    S = np.where(
        slope_deg < 9,
        10.8 * np.sin(slope_rad) + 0.03,
        16.8 * np.sin(slope_rad) - 0.5
    )
    
    LS = L * S
    
    return LS
```

### 5.3. Índice de Poluição Difusa

```python
def calculate_pollution_risk(
    land_use: np.ndarray,
    slope: np.ndarray,
    water_distance: np.ndarray,
    flow_acc: np.ndarray
) -> np.ndarray:
    """
    Calcula índice de risco de poluição difusa.
    """
    # Normalizar componentes (0-1)
    lu_risk = normalize_land_use_risk(land_use)
    slope_risk = normalize(slope, 0, 30)  # 0-30% -> 0-1
    water_risk = 1 - normalize(water_distance, 0, 500)  # Inverso
    flow_risk = normalize(np.log1p(flow_acc), 0, 10)
    
    # Combinar com pesos
    risk = (
        0.35 * lu_risk +
        0.25 * slope_risk +
        0.25 * water_risk +
        0.15 * flow_risk
    )
    
    return risk

def normalize_land_use_risk(land_use):
    """
    Atribui risco por tipo de uso do solo.
    """
    risk_map = {
        'horticolas': 0.9,
        'milho_regadio': 0.8,
        'vinha': 0.6,
        'olival': 0.4,
        'prado_permanente': 0.2,
        'floresta': 0.1,
    }
    # Aplicar mapeamento...
    return risk_array
```

### 5.4. MEDALUS Simplificado

```python
def calculate_medalus_esa(sqi, cqi, vqi, mqi):
    """
    Calcula o índice ESAs do MEDALUS.
    
    ESAs = (SQI × CQI × VQI × MQI)^(1/4)
    
    Classes:
    < 1.17: Não afectado
    1.17-1.225: Potencial
    1.225-1.375: Frágil (F1, F2, F3)
    > 1.375: Crítico (C1, C2, C3)
    """
    esa = (sqi * cqi * vqi * mqi) ** 0.25
    return esa
```

---

## 6. Implementação Técnica

### 6.1. Estrutura de Ficheiros

```
projects/nucleo-agricola-boquilobo/
│
├── README.md
├── followup.md
│
├── config/
│   └── params.yaml
│
├── notebooks/
│   ├── 01_dados_base.ipynb
│   ├── 02_ndvi_stress.ipynb
│   ├── 03_poluicao_difusa.ipynb
│   ├── 04_erosao_usle.ipynb
│   ├── 05_drought_index.ipynb
│   ├── 06_carbon_simple.ipynb
│   ├── 07_carbon_ndvi.ipynb
│   ├── 08_medalus.ipynb
│   └── 09_dashboard.ipynb
│
├── scripts/
│   ├── ndvi.py
│   ├── usle.py
│   ├── pollution_index.py
│   ├── drought.py
│   └── medalus.py
│
├── data/
│   ├── input/
│   │   ├── ifap_parcelas.gpkg
│   │   ├── cos_2018.gpkg
│   │   ├── solos.gpkg
│   │   └── paul_boquilobo.gpkg
│   └── processed/
│
└── outputs/
    ├── raster/
    ├── vector/
    └── figures/
```

### 6.2. Pipeline de Actualização Automática

Para camadas que mudam periodicamente (NDVI, soil moisture, drought):

```python
# cronjob semanal
def update_agricultural_monitoring():
    """
    Actualiza camadas de monitorização agrícola.
    """
    # 1. Obter últimos dados Sentinel-2
    ndvi = get_latest_ndvi()
    
    # 2. Obter soil moisture
    sm = get_latest_soil_moisture()
    
    # 3. Calcular anomalias
    ndvi_anomaly = calculate_anomaly(ndvi, ndvi_baseline)
    
    # 4. Actualizar índice de seca
    drought_index = calculate_drought_index(ndvi_anomaly, sm)
    
    # 5. Agregar por zona (vectorial)
    stats_freguesia = aggregate_by_zone(drought_index, freguesias)
    stats_parcela = aggregate_by_zone(drought_index, parcelas_ifap)
    
    # 6. Guardar e publicar
    save_to_postgis(stats_freguesia, 'drought_freguesia')
    save_to_postgis(stats_parcela, 'drought_parcela')
    export_cog(drought_index, 'drought_raster.tif')
    
    # 7. Notificar se anomalia crítica
    if drought_index.max() > THRESHOLD:
        send_alert()
```

### 6.3. Dependências entre Projectos

```
PB-00 (MDT LiDAR)
    │
    ├── NA-10 (USLE)
    │       │
    │       └── NA-12 (Erosion Hotspots)
    │
    ├── NA-11 (LS Factor)
    │       │
    │       └── NA-10 (USLE)
    │
    └── NA-04 (Poluição Difusa)

GEE (Sentinel-2)
    │
    ├── NA-02 (Water Stress NDVI)
    │
    ├── NA-05 (Drought Monitoring)
    │
    ├── NA-08 (Carbon NDVI)
    │
    └── NA-09 (NDVI Vectorial)

NA-02 + NA-05 + NA-10 + NA-04
    │
    └── NA-00 (Observatório Agrícola) ⭐
```

---

## 7. Outputs e Entregas

### 7.1. Dashboard WebGIS

**URL:** `agricultura.meudominio.pt` ou `meudominio.pt/webgis/agricultura/`

**Funcionalidades:**
- Mapa interactivo com todas as camadas
- Filtros por tipo de análise
- Série temporal de NDVI (gráfico + slider)
- Download de dados (GeoJSON, GeoTIFF)
- Informação sobre parcelas (popup)
- Comparação com zona RAMSAR

### 7.2. Camadas Publicadas

| Camada | Tipo | Actualização | Formato |
|--------|------|--------------|---------|
| Parcelas IFAP | Vector | Anual | PostGIS → Martin |
| Ocupação COS | Vector | Quando novo COS | PostGIS → Martin |
| Paul Boquilobo | Vector | Estática | PostGIS → Martin |
| NDVI actual | Raster | Semanal | COG → TiTiler |
| Stress hídrico | Raster | Semanal | COG → TiTiler |
| Índice seca | Raster | Semanal | COG → TiTiler |
| Poluição difusa | Raster | Estática | COG → TiTiler |
| Erosão USLE | Raster | Estática | COG → TiTiler |
| Hotspots erosão | Vector | Estática | PostGIS → Martin |
| MEDALUS | Raster | Estática | COG → TiTiler |
| NDVI por freguesia | Vector | Semanal | PostGIS → Martin |

### 7.3. Relatórios / Fichas Técnicas

Documentos PDF com:
- Metodologia detalhada
- Resultados principais
- Mapas de síntese
- Recomendações de intervenção
- Limitações e incertezas

---

## 8. Comunicação

### 8.1. LinkedIn Post - Observatório Agrícola

**Headline:** "Lancei um Observatório Agrícola open source para a Lezíria do Tejo 🌾"

**Body:**
```
Combinando dados de satélite, informação de solos e parcelas agrícolas, 
criei um dashboard de monitorização agrícola para a região da Golegã 
e Paul do Boquilobo (Reserva RAMSAR).

O observatório inclui:
📊 Análise de stress hídrico (NDVI temporal)
🗺️ Compatibilidade solo vs. ocupação
⚠️ Risco de erosão e poluição difusa
🌱 Estimativa de sequestro de carbono
🦆 Impacto potencial na Reserva Natural

Dados abertos + código no GitHub.

#GIS #Agricultura #RemoteSensing #OpenData #Portugal #RAMSAR
```

### 8.2. Artigo Blog

**Título:** "Monitorização agrícola com dados de satélite: um observatório open source para a Lezíria do Tejo"

**Secções:**
1. Porquê monitorizar agricultura com satélite
2. A região da Lezíria e o Paul do Boquilobo (contexto RAMSAR)
3. Dados utilizados (Sentinel-2, IFAP, etc.)
4. Metodologias (NDVI, USLE, índice de poluição)
5. Resultados e dashboard interactivo
6. Limitações e próximos passos

### 8.3. Contactos Potenciais

| Entidade | Interesse | Timing |
|----------|-----------|--------|
| Câmara da Golegã | Planeamento, promoção | Fase 3 |
| ICNF (Paul Boquilobo) | Gestão da reserva RAMSAR | Fase 3 |
| DRAP Centro | Agricultura regional | Fase 4 |
| Associações de agricultores | Informação prática | Fase 4 |
| IPMA | Dados meteorológicos | Durante |

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Dados base necessários (MDT) |
| `07_NUCLEO_HIDRICO.md` | Complementar (bacias, água) |
| `12_ANCHOR_PROJECTS.md` | Detalhe do NA-00 como Anchor |
| `13_BIBLIOGRAFIA.md` | Referências e metodologias |
| `14_DADOS_NECESSARIOS.md` | Lista de dados e fontes |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial (como 06_TEMA_1-AGRO.md) |
| 2025-01-28 | 2.0 | Conversão para Núcleo Agrícola, nova nomenclatura NA-, alinhamento com backlog actualizado, adição RAMSAR/MEDALUS |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
