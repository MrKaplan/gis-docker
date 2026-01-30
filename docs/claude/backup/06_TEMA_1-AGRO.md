# 06 - TEMA 1: AGRICULTURA

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Conceito: Observatório Agrícola](#2-conceito-observatório-agrícola)
3. [Projectos Detalhados](#3-projectos-detalhados)
4. [Dados e Fontes](#4-dados-e-fontes)
5. [Metodologias](#5-metodologias)
6. [Implementação Técnica](#6-implementação-técnica)
7. [Outputs e Entregas](#7-outputs-e-entregas)
8. [Comunicação](#8-comunicação)

---

## 1. Visão Geral

### 1.1. Zona Temática

| Campo | Valor |
|-------|-------|
| **Nome** | Zona Agrícola |
| **Emoji** | 🌾 |
| **Localização** | Golegã, Paul do Boquilobo, Lezíria do Tejo |
| **Área aproximada** | ~200 km² |
| **Temática** | Agricultura, impacto ambiental, biodiversidade |

### 1.2. Contexto Territorial

A zona agrícola centra-se na **planície aluvial do Tejo**, uma das áreas agrícolas mais produtivas de Portugal:

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

---

## 2. Conceito: Observatório Agrícola

### 2.1. Ideia Central

Criar um **dashboard/WebGIS** que funcione como um "observatório" da actividade agrícola na região, monitorizando:

- Estado das culturas
- Stress hídrico
- Potenciais impactos ambientais
- Evolução temporal

### 2.2. Estrutura do Observatório

```
OBSERVATÓRIO AGRÍCOLA DA LEZÍRIA
│
├── 📊 Caracterização Base
│   ├── Solos e capacidade de uso
│   ├── Ocupação actual (COS + IFAP)
│   └── Compatibilidade ocupação vs. potencial
│
├── 📈 Monitorização
│   ├── Stress hídrico (NDVI temporal)
│   ├── Soil moisture (SMAP)
│   └── Índice de seca
│
├── ⚠️ Riscos e Impactos
│   ├── Erosão do solo (USLE)
│   ├── Poluição difusa potencial
│   └── Impacto no Paul do Boquilobo
│
├── 🦆 Biodiversidade
│   ├── Conectividade ecológica
│   └── Benefício para fauna
│
└── 🚶 Turismo
    ├── Percursos pedestres
    └── Pontos de interesse
```

### 2.3. Público-Alvo

| Público | Interesse |
|---------|-----------|
| Agricultores | Estado das culturas, stress hídrico |
| Técnicos municipais | Planeamento, fiscalização |
| Investigadores | Dados abertos, séries temporais |
| Público geral | Turismo, percursos |
| Gestores ambientais | Impacto no Paul, biodiversidade |

---

## 3. Projectos Detalhados

### 3.1. ZA-01 - Solos e Capacidade de Uso

| Campo | Valor |
|-------|-------|
| **ID** | ZA-01 |
| **Prioridade** | 🟡 Média |
| **Dependências** | Nenhuma (dados externos) |

**Objectivo:** Mapear os solos e a sua capacidade de uso agrícola.

**Dados:**
- Carta de Solos de Portugal (DGADR)
- Carta de Capacidade de Uso do Solo

**Outputs:**
- Mapa de tipos de solo
- Mapa de capacidade de uso (classes A a E)
- Estatísticas por freguesia

**Análise:**
```
Capacidade de Uso:
A - Sem limitações (agricultura intensiva)
B - Limitações moderadas
C - Limitações acentuadas
D - Limitações severas
E - Sem aptidão agrícola
```

---

### 3.2. ZA-02 - Ocupação Agrícola Temporal

| Campo | Valor |
|-------|-------|
| **ID** | ZA-02 |
| **Prioridade** | 🟡 Média |
| **Origem** | #13 (Historical Agricultural Land) |

**Objectivo:** Analisar a evolução da ocupação agrícola ao longo do tempo.

**Dados:**
- COS 1995, 2007, 2010, 2015, 2018 (DGT)
- Parcelas IFAP (dados abertos)

**Outputs:**
- Mapas de ocupação por ano
- Mapa de mudanças (change detection)
- Gráfico de evolução temporal
- Matriz de transição

**Análise de mudanças:**
```python
# Exemplo de matriz de transição
transicoes = {
    "Agrícola → Urbano": X ha,
    "Agrícola → Floresta": X ha,
    "Floresta → Agrícola": X ha,
    "Permanente": X ha
}
```

---

### 3.3. ZA-03 - Compatibilidade Ocupação vs Solo

| Campo | Valor |
|-------|-------|
| **ID** | ZA-03 |
| **Prioridade** | 🟡 Média |
| **Dependências** | ZA-01, ZA-02 |

**Objectivo:** Avaliar se a ocupação actual é compatível com a capacidade do solo.

**Análise:**
```
Sobreposição: Capacidade de Uso × Ocupação Actual

Situações:
✅ Compatível: Agricultura em solos classe A/B
⚠️ Subaproveitado: Solo classe A com floresta/mato
❌ Sobreexplorado: Agricultura intensiva em solo classe D/E
```

**Outputs:**
- Mapa de compatibilidade (3 classes)
- Estatísticas de área por classe
- Identificação de zonas críticas

---

### 3.4. ZA-04 - Stress Hídrico (NDVI Temporal)

| Campo | Valor |
|-------|-------|
| **ID** | ZA-04 |
| **Prioridade** | 🔴 Alta |
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
- Mapa de anomalias (desvio da média)
- Dashboard com evolução

**Processamento:** Google Earth Engine (recomendado para séries longas)

---

### 3.5. ZA-05 - Poluição Difusa Potencial

| Campo | Valor |
|-------|-------|
| **ID** | ZA-05 |
| **Prioridade** | 🟡 Média |
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

### 3.6. ZA-06 - Erosão Agrícola (USLE)

| Campo | Valor |
|-------|-------|
| **ID** | ZA-06 |
| **Prioridade** | 🟡 Média |
| **Origem** | #804, #806, #808 |

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
| LS | Derivado do MDT (ZH-00) |
| C | Ocupação do solo (COS) |
| P | Assumir 1 ou mapear se dados disponíveis |

**Outputs:**
- Mapa de perda de solo (ton/ha/ano)
- Classificação (tolerável, moderada, alta, muito alta)
- Comparação com categoria REN "erosão hídrica"

---

### 3.7. ZA-07 - Benefício para Biodiversidade

| Campo | Valor |
|-------|-------|
| **ID** | ZA-07 |
| **Prioridade** | 🟢 Baixa |
| **Dependências** | Limites Paul do Boquilobo |

**Objectivo:** Avaliar o potencial das parcelas agrícolas para beneficiar a biodiversidade.

**Factores:**
```
Benefício = f(Proximidade ao Paul, Tipo cultura, Conectividade)

Critérios positivos:
+ Proximidade à Reserva Natural
+ Culturas extensivas / pousio
+ Sebes e bordaduras
+ Conectividade com corredores ecológicos

Critérios negativos:
- Agricultura intensiva junto ao Paul
- Monocultura
- Ausência de vegetação natural
```

**Outputs:**
- Mapa de potencial de benefício (classes)
- Identificação de parcelas prioritárias para conversão
- Buffer zones recomendadas

---

### 3.8. ZA-08 - Turismo e Percursos

| Campo | Valor |
|-------|-------|
| **ID** | ZA-08 |
| **Prioridade** | 🟢 Baixa |
| **Dependências** | Nenhuma |

**Objectivo:** Mapear recursos turísticos e percursos pedestres na zona agrícola.

**Dados:**
- OSM (trilhos, POIs)
- Percursos marcados (PR)
- Pontos de observação de aves

**Outputs:**
- Mapa de percursos
- Pontos de interesse (quintas, miradouros, observatórios)
- Sugestão de novos percursos

---

### 3.9. ZA-09 - Precision Farming (Light)

| Campo | Valor |
|-------|-------|
| **ID** | ZA-09 |
| **Prioridade** | 🟢 Baixa |
| **Origem** | #1 (Precision Farming) |

**Objectivo:** Demonstrar conceitos de agricultura de precisão com dados abertos.

**Nota:** Versão "light" porque não temos dados de sensores de campo.

**O que podemos fazer:**
- Variabilidade espacial de NDVI por parcela
- Zonas de gestão diferenciada
- Correlação NDVI vs. soil moisture

**O que NÃO podemos fazer:**
- Mapas de aplicação variável de fertilizantes
- Dados de yield monitors
- Sensores de solo em tempo real

---

### 3.10. ZA-10 - Resiliência de Culturas

| Campo | Valor |
|-------|-------|
| **ID** | ZA-10 |
| **Prioridade** | 🟢 Baixa |
| **Origem** | #16 (Crop Resilience) |

**Objectivo:** Avaliar a resiliência das culturas a eventos extremos.

**Abordagem:**
1. Analisar NDVI durante eventos de seca/calor
2. Comparar recuperação pós-evento
3. Identificar culturas/parcelas mais resilientes

**Futuro:** Classificador ML para prever resiliência

---

### 3.11. ZA-11 - Produtividade NDVI vs Meteo

| Campo | Valor |
|-------|-------|
| **ID** | ZA-11 |
| **Prioridade** | 🟢 Baixa |
| **Origem** | #17 (Crop Productivity) |

**Objectivo:** Correlacionar NDVI com variáveis meteorológicas.

**Análise:**
```
NDVI ~ Precipitação + Temperatura + Radiação

Questões:
- Qual o lag entre chuva e resposta do NDVI?
- Quais culturas respondem mais a eventos extremos?
- Tendências de longo prazo
```

---

### 3.12. ZA-12 - Índice de Seca

| Campo | Valor |
|-------|-------|
| **ID** | ZA-12 |
| **Prioridade** | 🟡 Média |
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
- Série temporal
- Alertas

---

## 4. Dados e Fontes

### 4.1. Dados Vectoriais

| Dado | Fonte | URL/Acesso | Formato |
|------|-------|------------|---------|
| Parcelas agrícolas | IFAP | dados.gov.pt | SHP |
| COS (várias datas) | DGT | SNIG | SHP/GPKG |
| Carta de Solos | DGADR | SNIG | SHP |
| Capacidade Uso Solo | DGADR | SNIG | SHP |
| Limites Paul Boquilobo | ICNF | SNIG | SHP |
| Percursos pedestres | OSM | Overpass | GeoJSON |

### 4.2. Dados Raster

| Dado | Fonte | Resolução | Frequência |
|------|-------|-----------|------------|
| Sentinel-2 (NDVI) | Copernicus | 10m | 5 dias |
| SMAP Soil Moisture | NASA | 9km | 2-3 dias |
| SMOS Soil Moisture | ESA | 35km | 2-3 dias |

### 4.3. Dados Tabulares

| Dado | Fonte | Frequência |
|------|-------|------------|
| Precipitação | IPMA | Diário |
| Temperatura | IPMA | Diário |
| Evapotranspiração | IPMA/SNIRH | Diário |

### 4.4. Descoberta: Parcelas IFAP

**Importante:** Durante o planeamento descobrimos que as parcelas agrícolas do IFAP estão disponíveis como dados abertos em dados.gov.pt!

Isto permite:
- Análise ao nível da parcela
- Identificação de culturas
- Estatísticas mais precisas

---

## 5. Metodologias

### 5.1. NDVI Temporal

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
# Cálculo do factor LS
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
    # (simplificação - idealmente usar contributing area)
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
```

---

## 6. Implementação Técnica

### 6.1. Estrutura de Ficheiros

```
projects/zona-agricola-boquilobo/
│
├── README.md
├── followup.md
│
├── config/
│   └── params.yaml
│
├── notebooks/
│   ├── 01_solos_capacidade.ipynb
│   ├── 02_ocupacao_temporal.ipynb
│   ├── 03_compatibilidade.ipynb
│   ├── 04_ndvi_stress.ipynb
│   ├── 05_poluicao_difusa.ipynb
│   ├── 06_erosao_usle.ipynb
│   └── 07_dashboard.ipynb
│
├── scripts/
│   ├── ndvi.py
│   ├── usle.py
│   └── pollution_index.py
│
├── data/
│   └── (dados específicos)
│
└── outputs/
    ├── raster/
    ├── vector/
    └── figures/
```

### 6.2. Pipeline de Actualização

Para dados que mudam (NDVI, soil moisture):

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
    
    # 5. Guardar e publicar
    save_and_publish(drought_index)
```

---

## 7. Outputs e Entregas

### 7.1. Dashboard WebGIS

**URL:** `agricultura.meudominio.pt` ou `meudominio.pt/webgis/agricultura/`

**Funcionalidades:**
- Mapa interactivo com todas as camadas
- Filtros por tipo de análise
- Série temporal de NDVI (gráfico + slider)
- Download de dados
- Informação sobre parcelas (popup)

### 7.2. Camadas Publicadas

| Camada | Tipo | Actualização |
|--------|------|--------------|
| Solos | Vector (PostGIS) | Estática |
| Capacidade Uso | Vector (PostGIS) | Estática |
| Ocupação COS | Vector (PostGIS) | Quando novo COS |
| Parcelas IFAP | Vector (PostGIS) | Anual |
| NDVI actual | Raster (COG) | Semanal |
| Stress hídrico | Raster (COG) | Semanal |
| Índice poluição | Raster (COG) | Estática |
| Erosão (USLE) | Raster (COG) | Estática |

### 7.3. Relatório / Ficha Técnica

Documento PDF com:
- Metodologia
- Resultados principais
- Mapas de síntese
- Recomendações

---

## 8. Comunicação

### 8.1. LinkedIn Post - Observatório Agrícola

**Headline:** "Lancei um Observatório Agrícola open source para a Lezíria do Tejo 🌾"

**Body:**
```
Combinando dados de satélite, informação de solos e parcelas agrícolas, 
criei um dashboard de monitorização agrícola para a região da Golegã 
e Paul do Boquilobo.

O observatório inclui:
📊 Análise de stress hídrico (NDVI temporal)
🗺️ Compatibilidade solo vs. ocupação
⚠️ Risco de erosão e poluição difusa
🦆 Impacto potencial na Reserva Natural

Dados abertos + código no GitHub.

#GIS #Agricultura #RemoteSensing #OpenData #Portugal
```

### 8.2. Artigo Blog

**Título:** "Monitorização agrícola com dados de satélite: um observatório open source"

**Secções:**
1. Porquê monitorizar agricultura com satélite
2. A região da Lezíria e o Paul do Boquilobo
3. Dados utilizados (Sentinel-2, IFAP, etc.)
4. Metodologias (NDVI, USLE, índice de poluição)
5. Resultados e dashboard
6. Limitações e próximos passos

### 8.3. Contactos Potenciais

| Entidade | Interesse |
|----------|-----------|
| Câmara da Golegã | Planeamento, promoção |
| ICNF (Paul Boquilobo) | Gestão da reserva |
| DRAP Centro | Agricultura regional |
| Associações de agricultores | Informação prática |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `03_AREA_ESTUDO.md` - Definição da Zona Agrícola
- `04_BACKLOG_PROJECTOS.md` - Lista de projectos ZA-*
- `05_PROJECTO_BASE_BIOFISICO.md` - Dados base necessários

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
