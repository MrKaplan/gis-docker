# 09 - NÚCLEO CÁRSICO

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Contexto Geológico](#2-contexto-geológico)
3. [Projectos do Núcleo](#3-projectos-do-núcleo)
4. [StoryMap Polje de Minde](#4-storymap-polje-de-minde)
5. [Dados e Fontes](#5-dados-e-fontes)
6. [Metodologias](#6-metodologias)
7. [Implementação Técnica](#7-implementação-técnica)
8. [Outputs e Entregas](#8-outputs-e-entregas)
9. [Comunicação e Outreach](#9-comunicação-e-outreach)

---

## 1. Visão Geral

### 1.1. Identificação do Núcleo

| Campo | Valor |
|-------|-------|
| **Prefixo** | NC- |
| **Nome** | Núcleo Cársico |
| **Emoji** | 🕳️ |
| **Área Geográfica** | Polje de Minde / Grutas Almonda / Serra de Aire |
| **Área aproximada** | ~30 km² |
| **Anchor Project** | NC-00 - StoryMap Polje de Minde |

### 1.2. Contexto Territorial

O Núcleo Cársico centra-se numa área geológica única em Portugal:

- **Polje de Minde:** Depressão cársica de fundo plano, sujeita a inundações sazonais
- **Grutas do Almonda:** Sistema de grutas activo, nascente do Rio Almonda
- **Serra de Aire e Candeeiros:** Parte do Parque Natural (PNSAC)

### 1.3. Relevância

| Aspecto | Descrição |
|---------|-----------|
| **Geológico** | Único polje verdadeiro em Portugal |
| **Hidrológico** | Sistema cársico activo com nascentes |
| **Patrimonial** | Grutas, arqueologia, paisagem |
| **Riscos** | Inundações sazonais, subsidência |
| **Científico** | Interesse geomorfológico internacional |

### 1.4. O que é um Polje?

Um **polje** (do esloveno "campo") é uma depressão cársica de grande dimensão com:
- Fundo plano e extenso
- Rodeado por vertentes calcárias
- Drenagem subterrânea (ponors/sumidouros)
- Inundação sazonal quando o sistema não consegue drenar

O Polje de Minde é o exemplo mais clássico em Portugal e um dos melhores da Península Ibérica.

### 1.5. Temas Principais

- Geomorfologia cársica
- Inundação sazonal e histórica
- Aquíferos e vulnerabilidade
- Nascentes e grutas
- Biodiversidade cársica
- Percursos e miradouros

---

## 2. Contexto Geológico

### 2.1. Sistema Cársico

```
┌─────────────────────────────────────────────────────────────┐
│                    SERRA DE AIRE                            │
│                    (Calcários)                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │             Zona de Recarga (Infiltração)            │  │
│  └──────────────────────────────────────────────────────┘  │
│                          │                                  │
│                          ▼                                  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Aquífero Cársico                        │  │
│  │         (Circulação subterrânea)                     │  │
│  └──────────────────────────────────────────────────────┘  │
│                          │                                  │
│           ┌──────────────┼──────────────┐                  │
│           ▼              ▼              ▼                  │
│     ┌──────────┐   ┌──────────┐   ┌──────────────┐        │
│     │ Nascente │   │  Polje   │   │ Nascente     │        │
│     │ Almonda  │   │  Minde   │   │ Alviela      │        │
│     │ (Grutas) │   │ (inunda) │   │ (Olhos Água) │        │
│     └──────────┘   └──────────┘   └──────────────┘        │
│                          │                                  │
│                          ▼                                  │
│                    Rio Almonda                              │
└─────────────────────────────────────────────────────────────┘
```

### 2.2. Características Geológicas

| Elemento | Descrição |
|----------|-----------|
| **Rocha** | Calcários jurássicos (Jurássico Médio) |
| **Idade** | ~170-160 milhões de anos |
| **Tipo de carso** | Carso coberto e descoberto |
| **Formas** | Dolinas, uvalas, lapiás, grutas, nascentes |
| **Aquífero** | Aquífero cársico Maciço Calcário Estremenho |

### 2.3. O Polje de Minde

| Característica | Valor |
|----------------|-------|
| **Dimensões** | ~3 km × 1 km |
| **Altitude do fundo** | ~230-240 m |
| **Profundidade** | ~50-100 m abaixo do planalto |
| **Drenagem** | Subterrânea via ponors |
| **Inundação** | Inverno/Primavera (anos húmidos) |

---

## 3. Projectos do Núcleo

### 3.1. Tabela Resumo

| ID | Nome | Tipo | Proc. | Prior. | Origem |
|----|------|------|-------|--------|--------|
| **NC-00** | ⭐ StoryMap Polje de Minde | P | 🌍+🌐 | 🔴 | PS-01 |
| NC-01 | Inundação Histórica | C+A | 🌍+🌐 | 🔴 | Novo |
| NC-02 | Geomorfologia Cársica | C | 🖥️→🌐 | 🟡 | Novo |
| NC-03 | Aquifer Recharge Potential | C | 🖥️→🌐 | 🟡 | #420 |
| NC-04 | Geologia (camada base) | C | 🖥️→🌐 | 🟡 | #423 |
| NC-05 | Permeabilidade Solos | C | 🖥️→🌐 | 🟡 | #456 |
| NC-06 | Aquíferos (contexto) | C | 🖥️→🌐 | 🟡 | #458 |
| NC-07 | DRASTIC (vulnerabilidade) | C | 🖥️→🌐 | 🟡 | #462 |
| NC-08 | Risco Contaminação | C | 🖥️→🌐 | 🟡 | #466 |
| NC-09 | Landform Classification | C | 🖥️→🌐 | 🟢 | #433 |

**Legenda:**
- **Tipo:** F=Ferramenta, P=Projecto, C=Camada, A=Análise
- **Proc.:** 🌐=Online, 🖥️=Desktop, 🌍=GEE
- **Prior.:** 🔴=Alta, 🟡=Média, 🟢=Baixa

---

### 3.2. NC-00 - StoryMap Polje de Minde ⭐

| Campo | Valor |
|-------|-------|
| **ID** | NC-00 |
| **Tipo** | **Projecto (Anchor)** |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | PS-01 |
| **Dependências** | NC-01, NC-02 |

**Ver secção 4 para detalhe completo.**

Este é um **Anchor Project** — um dos projectos mais diferenciadores do portfolio, com potencial de comunicação e outreach local.

---

### 3.3. NC-01 - Inundação Histórica

| Campo | Valor |
|-------|-------|
| **ID** | NC-01 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌍 GEE + 🌐 Online |
| **Origem** | Novo |
| **Dependências** | Dados IPMA, Sentinel-2 |

**Objectivo:** Documentar e mapear eventos de inundação histórica no Polje de Minde.

**Abordagens:**

**A) Detecção Remota (Sentinel-2/GEE):**
```python
# Série temporal NDWI para detectar água
# Períodos de interesse: Invernos chuvosos

def detect_flood_events(roi, start_date, end_date):
    """
    Detecta eventos de inundação usando NDWI.
    """
    s2 = ee.ImageCollection('COPERNICUS/S2_SR') \
        .filterBounds(roi) \
        .filterDate(start_date, end_date) \
        .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20))
    
    def add_ndwi(image):
        ndwi = image.normalizedDifference(['B3', 'B8']).rename('NDWI')
        return image.addBands(ndwi)
    
    s2_ndwi = s2.map(add_ndwi)
    
    # Threshold para água
    water_threshold = 0.3
    
    # Criar máscara de água para cada imagem
    def classify_water(image):
        water = image.select('NDWI').gt(water_threshold)
        return image.addBands(water.rename('water'))
    
    return s2_ndwi.map(classify_water)
```

**B) Dados Históricos:**
- Registos meteorológicos IPMA (precipitação)
- Notícias de jornais locais
- Fotografias históricas (arquivos municipais)
- Testemunhos de residentes

**Outputs:**
- Série temporal de extensão de inundação
- Mapa de máxima extensão histórica
- Correlação precipitação ↔ inundação
- Frequência de eventos por década

---

### 3.4. NC-02 - Geomorfologia Cársica

| Campo | Valor |
|-------|-------|
| **ID** | NC-02 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |
| **Dependências** | PB-00 (MDT LiDAR) |

**Objectivo:** Mapear e classificar formas cársicas a partir do MDT LiDAR.

**Formas a identificar:**

| Forma | Descrição | Método de Detecção |
|-------|-----------|-------------------|
| **Dolinas** | Depressões circulares | TPI negativo, sink detection |
| **Uvalas** | Dolinas coalescidas | Clusters de dolinas |
| **Lapiás** | Fendas na rocha | Rugosidade alta |
| **Vales secos** | Antigos cursos de água | Flow accumulation sem água |
| **Ponors** | Sumidouros | Depressões com drenagem |

**Metodologia:**
```python
import richdem as rd
import numpy as np

def detect_karst_features(dem_path):
    """
    Detecta formas cársicas a partir do MDT.
    """
    dem = rd.LoadGDAL(dem_path)
    
    # 1. TPI (Topographic Position Index) para dolinas
    tpi = rd.TerrainAttribute(dem, attrib='slope_riserun')  # Simplificado
    # TPI real requer análise de vizinhança
    
    # 2. Fill sinks para identificar depressões
    filled = rd.FillDepressions(dem)
    sinks = filled - dem  # Profundidade das depressões
    
    # 3. Rugosidade para lapiás
    tri = rd.TerrainAttribute(dem, attrib='terrain_ruggedness_index')
    
    return {
        'sinks': sinks,
        'tri': tri,
        'tpi': tpi
    }
```

**Outputs:**
- Mapa de dolinas (pontos ou polígonos)
- Classificação de formas cársicas
- Estatísticas (densidade, profundidade média)

---

### 3.5. NC-03 - Aquifer Recharge Potential

| Campo | Valor |
|-------|-------|
| **ID** | NC-03 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #420 |
| **Dependências** | NC-04, NC-05 |

**Objectivo:** Mapear o potencial de recarga do aquífero cársico.

**Factores:**
```
Potencial Recarga = f(Geologia, Permeabilidade, Declive, 
                      Uso_Solo, Precipitação, Fracturas)

Pesos exemplo:
- Geologia: 30%
- Permeabilidade: 25%
- Declive: 15%
- Uso do solo: 15%
- Fracturação: 15%
```

**Classes de aptidão:**

| Classe | Descrição | Características |
|--------|-----------|-----------------|
| Muito Alta | Zonas de recarga principal | Calcário exposto, baixo declive |
| Alta | Recarga significativa | Calcário com cobertura fina |
| Média | Recarga moderada | Calcário coberto |
| Baixa | Recarga limitada | Materiais pouco permeáveis |
| Muito Baixa | Sem recarga | Impermeável |

---

### 3.6. NC-04 - Geologia (camada base)

| Campo | Valor |
|-------|-------|
| **ID** | NC-04 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #423 |
| **Dependências** | Carta Geológica LNEG |

**Objectivo:** Preparar e publicar carta geológica da área.

**Fonte:** LNEG - Carta Geológica de Portugal 1:50.000

**Folhas necessárias:**
- Folha 27-A (Vila Nova de Ourém)
- Folha 27-C (Torres Novas)
- Outras adjacentes conforme necessário

**Processamento:**
1. Download das folhas georreferenciadas
2. Vectorização (se necessário) ou uso de versão vectorial
3. Harmonização de legendas
4. Simplificação para visualização web
5. Publicação em PostGIS → Martin

---

### 3.7. NC-05 - Permeabilidade Solos

| Campo | Valor |
|-------|-------|
| **ID** | NC-05 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #456 |
| **Dependências** | Carta de Solos |

**Objectivo:** Derivar mapa de permeabilidade a partir da textura dos solos.

**Classificação:**

| Textura | Permeabilidade | Classe |
|---------|---------------|--------|
| Arenosa | Alta | 1 |
| Franco-arenosa | Média-alta | 2 |
| Franca | Média | 3 |
| Franco-argilosa | Média-baixa | 4 |
| Argilosa | Baixa | 5 |

**Fonte:** Carta de Solos de Portugal (DGADR/SROA)

---

### 3.8. NC-06 - Aquíferos (contexto)

| Campo | Valor |
|-------|-------|
| **ID** | NC-06 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #458 |
| **Dependências** | Dados APA/SNIRH |

**Objectivo:** Contextualizar os aquíferos da região.

**Aquíferos relevantes:**
- **Maciço Calcário Estremenho:** Principal aquífero cársico
- **Bacia do Tejo-Sado:** Aquíferos detríticos adjacentes

**Dados:**
- Limites dos sistemas aquíferos (APA)
- Pontos de água cadastrados (SNIRH)
- Níveis piezométricos (se disponíveis)

---

### 3.9. NC-07 - DRASTIC (vulnerabilidade)

| Campo | Valor |
|-------|-------|
| **ID** | NC-07 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #462 |
| **Dependências** | NC-04, NC-05, NC-06 |

**Objectivo:** Calcular vulnerabilidade do aquífero usando metodologia DRASTIC.

**DRASTIC = 7 factores:**

| Factor | Descrição | Peso |
|--------|-----------|------|
| **D** | Depth to water (profundidade) | 5 |
| **R** | Recharge (recarga) | 4 |
| **A** | Aquifer media (tipo aquífero) | 3 |
| **S** | Soil media (tipo solo) | 2 |
| **T** | Topography (declive) | 1 |
| **I** | Impact of vadose zone | 5 |
| **C** | Conductivity (condutividade) | 3 |

**Fórmula:**
```
DRASTIC Index = Dr×Dw + Rr×Rw + Ar×Aw + Sr×Sw + Tr×Tw + Ir×Iw + Cr×Cw

Onde:
r = rating (1-10)
w = weight (peso)
```

**Classes de vulnerabilidade:**

| Índice | Vulnerabilidade |
|--------|-----------------|
| < 100 | Baixa |
| 100-140 | Moderada |
| 140-180 | Alta |
| > 180 | Muito Alta |

**Nota:** Em aquíferos cársicos, usar variante DRASTIC-Karst ou COP.

---

### 3.10. NC-08 - Risco Contaminação

| Campo | Valor |
|-------|-------|
| **ID** | NC-08 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #466 |
| **Dependências** | NC-07 |

**Objectivo:** Combinar vulnerabilidade com fontes de contaminação.

**Fórmula:**
```
Risco = Vulnerabilidade × Perigosidade

Onde:
- Vulnerabilidade = DRASTIC (NC-07)
- Perigosidade = Fontes de contaminação ponderadas
```

**Fontes de contaminação a considerar:**

| Fonte | Perigosidade |
|-------|--------------|
| Agricultura intensiva | Alta |
| Pecuária | Alta |
| Indústria | Muito Alta |
| Estradas principais | Média |
| Urbanização | Média |
| Lixeiras/Aterros | Muito Alta |
| Fossas sépticas | Média-Alta |

---

### 3.11. NC-09 - Landform Classification

| Campo | Valor |
|-------|-------|
| **ID** | NC-09 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #433 |
| **Dependências** | PB-00 (MDT) |

**Objectivo:** Classificar automaticamente formas de relevo usando TPI.

**Metodologia Weiss (2001):**
```python
def classify_landforms_tpi(dem, inner_radius, outer_radius):
    """
    Classifica landforms usando TPI multi-escala.
    
    Classes:
    1. Vales/Depressões (TPI muito negativo)
    2. Planícies baixas (TPI negativo, baixo declive)
    3. Encostas (TPI neutro)
    4. Planícies altas (TPI positivo, baixo declive)
    5. Cumes/Cristas (TPI muito positivo)
    """
    # Calcular TPI em duas escalas
    tpi_small = calculate_tpi(dem, inner_radius)
    tpi_large = calculate_tpi(dem, outer_radius)
    
    # Classificar
    # ...
```

**Classes de landforms:**

| Classe | TPI pequena | TPI grande | Descrição |
|--------|-------------|------------|-----------|
| Vales profundos | - - | - - | Canyons, vales encaixados |
| Vales rasos | - - | neutro | Vales de fundo plano |
| Planícies | neutro | neutro | Superfícies planas |
| Encostas abertas | neutro | - | Encostas superiores |
| Cumes | + + | + + | Cristas, picos |
| Depressões locais | - - | + | Dolinas! |

---

## 4. StoryMap Polje de Minde

### 4.1. Conceito

O **NC-00 - StoryMap Polje de Minde** é um **Anchor Project** — um dos projectos mais diferenciadores do portfolio.

**O que é:** Uma narrativa interactiva que conta a história do Polje de Minde, combinando:
- Mapas interactivos
- Séries temporais de inundação
- Fotografias históricas
- Explicações geológicas
- Contexto cultural e patrimonial

### 4.2. Estrutura do StoryMap

```
STORYMAP: POLJE DE MINDE
│
├── 1. INTRODUÇÃO
│   ├── O que é um polje?
│   ├── Localização
│   └── Porque é especial
│
├── 2. GEOLOGIA
│   ├── Formação do carso
│   ├── Sistema de grutas
│   └── Mapa geológico interactivo
│
├── 3. A INUNDAÇÃO
│   ├── Como funciona
│   ├── Série temporal NDWI
│   ├── Slider antes/depois
│   └── Eventos históricos marcantes
│
├── 4. VIDA NO POLJE
│   ├── Agricultura adaptada
│   ├── Povoamento
│   └── Testemunhos
│
├── 5. BIODIVERSIDADE
│   ├── Habitats únicos
│   ├── Espécies de interesse
│   └── PNSAC
│
├── 6. FUTURO
│   ├── Alterações climáticas
│   ├── Pressões e ameaças
│   └── Conservação
│
└── 7. EXPLORE
    ├── Percursos pedestres
    ├── Miradouros
    └── Como visitar
```

### 4.3. Componentes Interactivos

**A) Mapa de inundação temporal:**
```javascript
// Slider temporal para ver evolução da inundação
const timeSlider = L.control.timeSlider({
    data: floodExtents,  // GeoJSON com datas
    property: 'date',
    format: 'YYYY-MM-DD',
    onUpdate: function(date) {
        updateFloodLayer(date);
    }
});
```

**B) Comparação antes/depois:**
```html
<!-- Slider de comparação de imagens -->
<div class="comparison-slider">
    <img class="before" src="polje_seco.jpg" alt="Polje sem água">
    <img class="after" src="polje_inundado.jpg" alt="Polje inundado">
    <div class="slider-handle"></div>
</div>
```

**C) Mapa geológico interactivo:**
- Clique em unidades para ver descrição
- Toggle de camadas
- Perfil geológico interactivo

### 4.4. Tecnologia

| Componente | Tecnologia |
|------------|------------|
| Framework | StoryMapJS (Knight Lab) ou Scrollama |
| Mapas | Leaflet |
| Dados temporais | GEE → COG |
| Hosting | GitHub Pages / Netlify |
| Design | CSS custom |

### 4.5. Fontes de Conteúdo

| Tipo | Fonte | Uso |
|------|-------|-----|
| Imagens satélite | Sentinel-2 (GEE) | Série temporal inundação |
| Fotografias históricas | Arquivos municipais | Comparação temporal |
| Dados meteo | IPMA | Correlação precipitação |
| Geologia | LNEG | Contexto geológico |
| Biodiversidade | ICNF/PNSAC | Habitats e espécies |
| Testemunhos | Entrevistas locais | Elemento humano |

---

## 5. Dados e Fontes

### 5.1. Dados Raster

| Dado | Fonte | Resolução | Uso |
|------|-------|-----------|-----|
| MDT LiDAR | DGT | 2m | Geomorfologia, dolinas |
| Sentinel-2 | Copernicus | 10m | NDWI, inundação |
| Landsat | USGS | 30m | Série histórica longa |

### 5.2. Dados Vectoriais

| Dado | Fonte | Uso |
|------|-------|-----|
| Carta Geológica | LNEG | Geologia, litologia |
| Carta de Solos | DGADR | Permeabilidade |
| Limites Aquíferos | APA | Contexto hidrogeológico |
| Limites PNSAC | ICNF | Área protegida |
| Pontos de água | SNIRH | Nascentes, furos |

### 5.3. Dados Tabulares

| Dado | Fonte | Frequência |
|------|-------|------------|
| Precipitação | IPMA | Diária |
| Níveis piezométricos | SNIRH | Variável |
| Eventos de inundação | Notícias, arquivos | Histórico |

---

## 6. Metodologias

### 6.1. Detecção de Inundação com NDWI

```python
import ee

def create_flood_timeseries(roi, start_year, end_year):
    """
    Cria série temporal de extensão de inundação no Polje.
    """
    # Meses de interesse (Inverno/Primavera)
    months = [11, 12, 1, 2, 3, 4]
    
    flood_events = []
    
    for year in range(start_year, end_year + 1):
        for month in months:
            # Ajustar ano para meses de inverno
            actual_year = year if month > 6 else year + 1
            
            # Filtrar Sentinel-2
            start_date = f"{actual_year}-{month:02d}-01"
            end_date = ee.Date(start_date).advance(1, 'month')
            
            s2 = ee.ImageCollection('COPERNICUS/S2_SR') \
                .filterBounds(roi) \
                .filterDate(start_date, end_date) \
                .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 30))
            
            if s2.size().getInfo() > 0:
                # Composite mensal
                composite = s2.median()
                
                # NDWI
                ndwi = composite.normalizedDifference(['B3', 'B8'])
                
                # Máscara de água
                water = ndwi.gt(0.3)
                
                # Área de água
                area = water.multiply(ee.Image.pixelArea()).reduceRegion(
                    reducer=ee.Reducer.sum(),
                    geometry=roi,
                    scale=10
                ).get('nd')
                
                flood_events.append({
                    'date': start_date,
                    'water_area_m2': area
                })
    
    return flood_events
```

### 6.2. Detecção de Dolinas

```python
import numpy as np
from scipy import ndimage

def detect_dolines(dem, min_depth=2, min_area=100):
    """
    Detecta dolinas no MDT.
    
    Args:
        dem: Array do MDT
        min_depth: Profundidade mínima em metros
        min_area: Área mínima em pixels
    
    Returns:
        Array com dolinas identificadas
    """
    # 1. Fill sinks
    from richdem import FillDepressions
    filled = FillDepressions(dem)
    
    # 2. Calcular profundidade das depressões
    depth = filled - dem
    
    # 3. Threshold de profundidade
    depressions = depth > min_depth
    
    # 4. Label connected components
    labeled, num_features = ndimage.label(depressions)
    
    # 5. Filtrar por área
    dolines = np.zeros_like(dem)
    for i in range(1, num_features + 1):
        mask = labeled == i
        area = np.sum(mask)
        if area >= min_area:
            dolines[mask] = i
    
    return dolines
```

### 6.3. DRASTIC Simplificado

```python
def calculate_drastic(depth, recharge, aquifer, soil, topography, impact, conductivity):
    """
    Calcula índice DRASTIC de vulnerabilidade.
    
    Todos os inputs devem ser rasters classificados (1-10).
    """
    # Pesos standard
    weights = {
        'D': 5,  # Depth
        'R': 4,  # Recharge
        'A': 3,  # Aquifer
        'S': 2,  # Soil
        'T': 1,  # Topography
        'I': 5,  # Impact
        'C': 3   # Conductivity
    }
    
    drastic = (
        depth * weights['D'] +
        recharge * weights['R'] +
        aquifer * weights['A'] +
        soil * weights['S'] +
        topography * weights['T'] +
        impact * weights['I'] +
        conductivity * weights['C']
    )
    
    return drastic
```

---

## 7. Implementação Técnica

### 7.1. Estrutura de Ficheiros

```
projects/nucleo-carsico-polje/
│
├── README.md
├── followup.md
│
├── storymap/
│   ├── index.html
│   ├── css/
│   ├── js/
│   ├── images/
│   └── data/
│
├── notebooks/
│   ├── 01_flood_detection.ipynb    # NC-01
│   ├── 02_geomorphology.ipynb      # NC-02
│   ├── 03_recharge.ipynb           # NC-03
│   ├── 04_geology.ipynb            # NC-04
│   ├── 05_drastic.ipynb            # NC-07
│   └── 06_storymap_data.ipynb      # NC-00
│
├── scripts/
│   ├── flood_gee.py
│   ├── doline_detection.py
│   ├── drastic.py
│   └── export_storymap.py
│
├── data/
│   ├── geology/
│   ├── flood_extents/
│   └── photos/
│
└── outputs/
    ├── raster/
    ├── vector/
    └── storymap/
```

### 7.2. Dependências entre Projectos

```
PB-00 (MDT LiDAR)
    │
    ├── NC-02 (Geomorfologia)
    │       │
    │       └── NC-09 (Landform Classification)
    │
    └── NC-03 (Recharge)
            │
            └── NC-07 (DRASTIC)
                    │
                    └── NC-08 (Risco Contaminação)

GEE (Sentinel-2)
    │
    └── NC-01 (Inundação Histórica)
            │
            └── NC-00 (StoryMap) ⭐

NC-04 (Geologia) + NC-05 (Solos) + NC-06 (Aquíferos)
    │
    └── NC-07 (DRASTIC)
```

---

## 8. Outputs e Entregas

### 8.1. StoryMap WebGIS

**URL:** `polje.meudominio.pt` ou `meudominio.pt/storymap/polje/`

**Funcionalidades:**
- Narrativa interactiva scrollytelling
- Mapas embebidos com Leaflet
- Slider temporal de inundação
- Comparação antes/depois
- Galerias de fotografias
- Mobile responsive

### 8.2. Camadas Publicadas

| Camada | Tipo | Formato |
|--------|------|---------|
| Extensão inundação (por data) | Vector | PostGIS → Martin |
| Máxima inundação histórica | Vector | PostGIS → Martin |
| Geologia | Vector | PostGIS → Martin |
| Dolinas | Vector | PostGIS → Martin |
| DRASTIC vulnerabilidade | Raster | COG → TiTiler |
| Potencial recarga | Raster | COG → TiTiler |

### 8.3. Dados para Download

```
polje-minde-dados-v1.0.zip
├── README.md
├── LICENSE (CC BY 4.0)
├── vector/
│   ├── flood_extents.gpkg
│   ├── dolines.gpkg
│   └── geology_simplified.gpkg
├── raster/
│   ├── drastic.cog.tif
│   └── recharge_potential.cog.tif
└── metadata/
    └── methodology.md
```

---

## 9. Comunicação e Outreach

### 9.1. LinkedIn Post - StoryMap

**Headline:** "O único verdadeiro Polje de Portugal: contei a história em mapas interactivos 🗺️"

**Body:**
```
O Polje de Minde é uma das formações geológicas mais fascinantes 
de Portugal - uma depressão cársica que inunda sazonalmente, 
criando uma paisagem única.

Criei um StoryMap interactivo que conta a história deste lugar:

🌊 Série temporal de 10 anos de inundações (Sentinel-2)
🗻 Explicação da geologia cársica
📸 Fotografias históricas e actuais
🗺️ Mapas interactivos

Explorem em: [link]

Este projecto será oferecido à Junta de Freguesia de Minde 
como ferramenta de divulgação do seu património natural.

#GIS #Geologia #StoryMap #Portugal #OpenData
```

### 9.2. Outreach - Junta de Freguesia

**Objectivo:** Oferecer o StoryMap à Junta de Freguesia de Minde.

**Abordagem:**
1. Preparar StoryMap completo
2. Contactar Junta por email com preview
3. Propor reunião de apresentação
4. Disponibilizar gratuitamente
5. Pedir autorização para mencionar colaboração

**Template de email:**

```
Assunto: Proposta de colaboração - StoryMap do Polje de Minde

Exmos. Senhores,

O meu nome é [Nome] e sou profissional de Sistemas de 
Informação Geográfica.

Desenvolvi um projecto sobre o Polje de Minde que penso ser 
do interesse da vossa Junta de Freguesia: um "StoryMap" 
interactivo que conta a história desta formação geológica 
única em Portugal.

O StoryMap inclui:
- Série temporal de inundações com imagens de satélite
- Explicação acessível da geologia cársica
- Mapas interactivos
- Fotografias históricas e actuais

Gostaria de propor uma reunião para apresentar o projecto e 
discutir como poderia ser útil para a divulgação do 
património natural da vossa freguesia.

O projecto seria disponibilizado gratuitamente.

Fico ao dispor.
[Assinatura]
```

### 9.3. Artigo Blog

**Título:** "Mapear o invisível: como detectar inundações sazonais com imagens de satélite"

**Secções:**
1. Introdução ao Polje de Minde
2. Porque é difícil mapear inundações temporárias
3. Metodologia: NDWI e detecção de água
4. Implementação em Google Earth Engine
5. Resultados: 10 anos de inundações
6. Criação do StoryMap
7. Conclusões

### 9.4. Contactos Potenciais

| Entidade | Interesse | Timing |
|----------|-----------|--------|
| Junta de Minde | Divulgação local | Após StoryMap pronto |
| CM Alcanena | Turismo, património | Fase 4 |
| PNSAC/ICNF | Conservação | Fase 4 |
| Universidades | Investigação | Se artigo |
| Centro Ciência Viva | Divulgação | Fase 4 |

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Dados base (MDT) - PB-00 |
| `07_NUCLEO_HIDRICO.md` | Complementar (hidrologia cársica) |
| `12_ANCHOR_PROJECTS.md` | Detalhe do NC-00 como Anchor |
| `13_BIBLIOGRAFIA.md` | Referências sobre carso |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Conceito em 04_BACKLOG (como ZC-) |
| 2025-01-28 | 2.0 | Documento completo, nomenclatura NC-, 10 projectos detalhados, StoryMap expandido |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
