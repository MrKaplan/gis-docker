# 04 - BACKLOG DE PROJECTOS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Legenda e Nomenclatura](#2-legenda-e-nomenclatura)
3. [Anchor Projects](#3-anchor-projects)
4. [Projecto Base Transversal](#4-projecto-base-transversal)
5. [Núcleo Agrícola](#5-núcleo-agrícola)
6. [Núcleo Hídrico](#6-núcleo-hídrico)
7. [Núcleo Urbano](#7-núcleo-urbano)
8. [Núcleo Cársico](#8-núcleo-cársico)
9. [Núcleo Florestal e Riscos](#9-núcleo-florestal-e-riscos)
10. [Núcleo Turismo e Património](#10-núcleo-turismo-e-património)
11. [Projectos Standalone](#11-projectos-standalone)
12. [Matriz de Prioridades](#12-matriz-de-prioridades)
13. [Roadmap](#13-roadmap)

---

## 1. Visão Geral

### 1.1. Origem dos Projectos

Os projectos foram seleccionados a partir de:
- Lista de ~1000 aplicações GIS (fonte: gisgeography.com)
- Ideias próprias e necessidades do território
- Projectos pessoais (tese de mestrado, Limpar Portugal)

**Critérios de selecção:**
- Viabilidade técnica no stack definido
- Relevância para a área de estudo (Médio Tejo)
- Interesse para portfolio e comunicação
- Disponibilidade de dados abertos

### 1.2. Organização por Núcleos de Análise

Os projectos estão organizados em **Núcleos de Análise** — zonas geográficas e temáticas onde as análises fazem mais sentido:

| Núcleo | Área Geográfica | Temas Principais |
|--------|-----------------|------------------|
| 🌾 **Agrícola** | Golegã / Paul do Boquilobo | Agricultura, poluição difusa, biodiversidade |
| 💧 **Hídrico** | Bacias Almonda + Alviela + Castelo de Bode | Hidrologia, qualidade água, clima |
| 🏙️ **Urbano** | Tomar / Abrantes | Urbanismo, mobilidade, economia |
| 🕳️ **Cársico** | Polje de Minde | Geomorfologia, aquíferos, inundação |
| 🌲 **Florestal/Riscos** | Toda a área | Floresta, incêndios, erosão, riscos naturais |
| 🏛️ **Turismo/Património** | Toda a área | Percursos, miradouros, modelos 3D |

### 1.3. Estatísticas do Backlog

| Categoria | Quantidade |
|-----------|------------|
| Anchor Projects | 5 |
| Projectos Standalone | 5 |
| Camadas/Análises por Núcleo | ~80 |
| **Total** | ~90 |

---

## 2. Legenda e Nomenclatura

### 2.1. Tipo de Output

| Código | Tipo | Descrição |
|--------|------|-----------|
| **F** | Ferramenta | Interactivo no WebGIS (user interage) |
| **P** | Projecto | Conjunto de outputs, narrativa, comunicação |
| **C** | Camada | Layer estática para visualização |
| **A** | Análise | Metodologia/estudo com resultados |

### 2.2. Processamento

| Código | Local | Descrição |
|--------|-------|-----------|
| 🌐 | Online | Processamento no servidor Oracle Cloud |
| 🖥️ | Desktop | Processamento local em QGIS/Python |
| 🌍 | GEE | Google Earth Engine (séries temporais, raster pesado) |

### 2.3. Prioridade

| Símbolo | Nível | Descrição |
|---------|-------|-----------|
| 🔴 | Alta | Fazer primeiro, base para outros |
| 🟡 | Média | Importante mas não urgente |
| 🟢 | Baixa | Nice to have |
| ⭐ | Anchor | Projecto âncora (prioritário) |

### 2.4. Nomenclatura de IDs

| Prefixo | Significado | Exemplo |
|---------|-------------|---------|
| `NA-` | Núcleo Agrícola | NA-01 |
| `NH-` | Núcleo Hídrico | NH-01 |
| `NU-` | Núcleo Urbano | NU-01 |
| `NC-` | Núcleo Cársico | NC-01 |
| `NF-` | Núcleo Florestal/Riscos | NF-01 |
| `NT-` | Núcleo Turismo/Património | NT-01 |
| `PS-` | Projecto Standalone | PS-01 |
| `PB-` | Projecto Base | PB-01 |

---

## 3. Anchor Projects

Os **Anchor Projects** são os projectos âncora do portfolio — os mais completos, diferenciadores e com maior potencial de comunicação.

| # | ID | Nome | Núcleo | Justificação |
|---|-----|------|--------|--------------|
| ⭐1 | **PS-07** | **Regeneração Pós-Fogo (Tese Mestrado)** | Florestal | Tese pessoal, série temporal 10 anos, análise multifactorial |
| ⭐2 | **PB-00** | **Caracterização Biofísica** | Base | Alimenta todos os outros, open data, GitHub, reproduzível |
| ⭐3 | **NU-00** | **Atlas Urbano Interactivo** | Urbano | Integra walkability, isócronas, viewshed, 3D |
| ⭐4 | **NA-00** | **Observatório Agrícola + RAMSAR** | Agrícola | Agricultura + conservação + água, dashboard |
| ⭐5 | **NF-00** | **Índice de Vulnerabilidade Global** | Riscos | Integra derrocadas, cheias, incêndios, erosão |

### 3.1. Detalhe dos Anchor Projects

Ver documento `12_ANCHOR_PROJECTS.md` para descrição completa de cada um.

---

## 4. Projecto Base Transversal

O **Projecto Base** é transversal a todos os núcleos e deve ser feito primeiro.

| ID | Nome | Tipo | Proc. | Prior. | Descrição |
|----|------|------|-------|--------|-----------|
| **PB-00** | ⭐ Caracterização Biofísica | P | 🖥️→🌐 | 🔴 | **PRIORITÁRIO** - Base para tudo |

### 4.1. Camadas do Projecto Base (todas derivadas do MDT LiDAR)

| ID | Camada | Tipo | Proc. | Descrição |
|----|--------|------|-------|-----------|
| PB-01 | MDT (Digital Terrain Model) | C | 🖥️→🌐 | Modelo digital de terreno 2m/5m |
| PB-02 | Declive (Slope) | C | 🖥️→🌐 | Inclinação do terreno em graus/% |
| PB-03 | Exposição (Aspect) | C | 🖥️→🌐 | Orientação das vertentes |
| PB-04 | Curvatura | C | 🖥️→🌐 | Curvatura do terreno |
| PB-05 | Curvas de Nível | C | 🖥️→🌐 | Isolinhas altimétricas |
| PB-06 | Hillshade | C | 🖥️→🌐 | Relevo sombreado para visualização |
| PB-07 | TWI (Topographic Wetness Index) | C | 🖥️→🌐 | Índice de humidade topográfica |
| PB-08 | TPI (Topographic Position Index) | C | 🖥️→🌐 | Posição topográfica relativa |
| PB-09 | TRI (Topographic Ruggedness Index) | C | 🖥️→🌐 | Rugosidade do terreno |
| PB-10 | Flow Direction | C | 🖥️ | Direcção de escoamento |
| PB-11 | Flow Accumulation | C | 🖥️ | Acumulação de fluxo |
| PB-12 | Bacias Hidrográficas | C | 🖥️→🌐 | Derivadas do LiDAR |
| PB-13 | Rede de Drenagem | C | 🖥️→🌐 | Linhas de água derivadas |
| PB-14 | Stream Order (Strahler) | C | 🖥️→🌐 | Hierarquia da rede hídrica |
| PB-15 | Landform Classification | C | 🖥️→🌐 | Classificação automática de formas de relevo |

**Características:**
- Todos os scripts em Python (reproduzíveis)
- Parametrizáveis (mudar valor, re-executar)
- Dados disponíveis para download (open data)
- Código no GitHub

---

## 5. Núcleo Agrícola

**🌾 Área:** Golegã / Paul do Boquilobo (Reserva RAMSAR)

| ID | Nome | Tipo | Proc. | Prior. | Origem | Dados Principais |
|----|------|------|-------|--------|--------|------------------|
| **NA-00** | ⭐ Observatório Agrícola | P | 🌐 | 🔴 | Conceito | Dashboard integrado |
| NA-01 | Precision Farming (light) | C | 🌍+🌐 | 🟡 | #1 | NDVI, SMAP, IFAP |
| NA-02 | Water Stress (NDVI temporal) | C | 🌍+🌐 | 🔴 | #12 | Sentinel-2 NDVI |
| NA-03 | Crop Resilience | C+A | 🖥️+🌐 | 🟡 | #16 | COS + IFAP |
| NA-04 | Poluição Difusa Potencial | C | 🖥️→🌐 | 🟡 | #21 | Uso solo, declive, proximidade água |
| NA-05 | Drought Monitoring | C | 🌍+🌐 | 🟡 | #26 | NDVI, SMAP, precipitação |
| NA-06 | Desertificação (MEDALUS) | C | 🖥️→🌐 | 🟡 | #179 | Índice MEDALUS |
| NA-07 | Carbon Sequestration (simples) | C | 🖥️→🌐 | 🟢 | #185 | Área × factor |
| NA-08 | Carbon Sequestration (NDVI) | C | 🌍+🌐 | 🟢 | #185 | NDVI como proxy biomassa |
| NA-09 | NDVI Temporal (vectorial) | C | 🌍+🌐 | 🟡 | #191 | Média por zona/freguesia |
| NA-10 | Erosão USLE | C | 🖥️→🌐 | 🟡 | #806 | Perda de solo |
| NA-11 | LS Factor | C | 🖥️→🌐 | 🟡 | #808 | Factor topográfico USLE |
| NA-12 | Erosion Hotspots | C | 🖥️→🌐 | 🟡 | #804 | Zonas críticas |

**Output principal:** Dashboard "Observatório Agrícola da Lezíria" com monitorização automática.

---

## 6. Núcleo Hídrico

**💧 Área:** Bacias Almonda + Alviela + Albufeira Castelo de Bode

| ID | Nome | Tipo | Proc. | Prior. | Origem | Dados Principais |
|----|------|------|-------|--------|--------|------------------|
| NH-01 | Rede Hidrográfica (Strahler) | C | 🖥️→🌐 | 🔴 | #98 | Flow accumulation |
| NH-02 | Bacias e Sub-bacias | C | 🖥️→🌐 | 🔴 | #525 | MDT LiDAR |
| NH-03 | Flow Direction / Accumulation | C | 🖥️ | 🔴 | #527,534 | MDT |
| NH-04 | TWI | C | 🖥️→🌐 | 🟡 | #526 | MDT |
| NH-05 | Zonas de Cheia | C | 🖥️→🌐 | 🟡 | #539 | MDT, histórico |
| NH-06 | Flood Risk (simples) | C | 🖥️→🌐 | 🟡 | #263 | TWI + proximidade água |
| NH-07 | Eutrofização Temporal | C | 🌍+🌐 | 🟡 | #372 | Sentinel-2 (NDWI, Chl-a) |
| NH-08 | Reservatórios (Castelo de Bode) | C+A | 🌍+🌐 | 🟡 | #547 | SNIRH, Sentinel-2 |
| **NH-09** | **Upstream/Downstream Interactivo** | **F** | 🌐 | 🔴 | #548 | API + PostGIS + Leaflet |
| NH-10 | SCIMAP / Poluição Pontual | C+A | 🖥️→🌐 | 🟡 | #109 | Lixeiras + flow direction |
| NH-11 | Sedimentação / Erosão Hídrica | C | 🖥️→🌐 | 🟡 | #524 | USLE, comparar REN |
| NH-12 | Comparar Bacias LiDAR vs APA | A | 🖥️ | 🟢 | Novo | Validação metodológica |
| NH-13 | Stormwater Runoff (urbano) | C | 🖥️→🌐 | 🟡 | #377 | MDT LiDAR urbano |
| NH-14 | Ilhas de Calor (LST) | C | 🌍+🌐 | 🟡 | #180 | Landsat LST temporal |
| NH-15 | Matriz Sensibilidade Ambiental | C | 🖥️→🌐 | 🟡 | #368 | Sobreposição condicionantes |

**Output principal:** 
- WebGIS interactivo com ferramenta upstream/downstream
- Potencial artigo: "Evolução eutrofização reservatórios Médio Tejo"

---

## 7. Núcleo Urbano

**🏙️ Área:** Tomar / Abrantes

| ID | Nome | Tipo | Proc. | Prior. | Origem | Dados Principais |
|----|------|------|-------|--------|--------|------------------|
| **NU-00** | ⭐ Atlas Urbano Interactivo | P | 🌐 | 🔴 | Conceito | Dashboard integrado |
| NU-01 | Viewshed / Line of Sight | A+C | 🖥️→🌐 | 🟡 | #65 | MDT |
| NU-02 | Noise Exposure | C | 🖥️→🌐 | 🟢 | #66 | Vias, indústria |
| NU-03 | Solar Exposure | C | 🖥️→🌐 | 🟡 | #69 | MDT, edifícios |
| NU-04 | Shadow Analysis | C | 🖥️→🌐 | 🟢 | #72 | Edifícios 3D |
| **NU-05** | **Service Areas (Isócronas)** | **F** | 🌐 | 🔴 | #579 | pgRouting, OSM |
| NU-06 | Landfill Suitability | A | 🖥️→🌐 | 🟢 | #583 | Multicritério |
| NU-07 | Green Roofs Potential | C | 🖥️→🌐 | 🟢 | #585 | Edifícios, exposição |
| **NU-08** | **Walkshed** | **F** | 🌐 | 🔴 | #596 | pgRouting |
| NU-09 | 3D Viewshed | A | 🖥️→🌐 | 🟡 | #597 | MDT + edifícios |
| NU-10 | Space Syntax | A+C | 🖥️→🌐 | 🟡 | #602 | depthmapX, rede viária |
| NU-11 | Building Constraints | C | 🖥️→🌐 | 🟡 | #606 | REN, RAN, PDM |
| **NU-12** | **Travel Time** | **F** | 🌐 | 🟡 | #132 | pgRouting |
| NU-13 | Expansão Urbana (suitability) | C | 🖥️→🌐 | 🟡 | #575 | Multicritério |
| NU-14 | LUCIS (conflitos uso solo) | C | 🖥️→🌐 | 🟡 | #576 | Sobreposição aptidões |
| NU-15 | Food Deserts | C | 🌐 | 🟡 | #578 | Isócronas supermercados |
| NU-16 | Distance to Healthcare | C | 🌐 | 🟡 | #474 | Isócronas saúde |
| NU-17 | Cluster Analysis (saúde) | A | 🖥️→🌐 | 🟢 | #477 | Se dados disponíveis |
| NU-18 | Sky View Factor | C | 🖥️→🌐 | 🟢 | #295 | Luz natural, microclimas |
| NU-19 | Market Share / Trade Area | A+C | 🌐 | 🟡 | #134,332 | Áreas influência |
| NU-20 | Property Index | C | 🖥️→🌐 | 🟢 | #148 | Índice atractividade (sem preços reais) |
| NU-21 | Suitability Infraestrutura Regional | A | 🖥️→🌐 | 🟡 | Novo | Escola/hospital/hiper multicritério |

**Output principal:** Dashboard "Atlas Urbano" com isócronas interactivas, walkability, viewshed.

---

## 8. Núcleo Cársico

**🕳️ Área:** Polje de Minde / Grutas Almonda

| ID | Nome | Tipo | Proc. | Prior. | Origem | Dados Principais |
|----|------|------|-------|--------|--------|------------------|
| **NC-00** | ⭐ StoryMap Polje de Minde | P | 🌍+🌐 | 🔴 | PS-01 | NDWI temporal, narrativa |
| NC-01 | Inundação Histórica | C+A | 🌍+🌐 | 🔴 | Novo | IPMA, Sentinel-2 |
| NC-02 | Geomorfologia Cársica | C | 🖥️→🌐 | 🟡 | Novo | MDT, geologia |
| NC-03 | Aquifer Recharge Potential | C | 🖥️→🌐 | 🟡 | #420 | Permeabilidade, declive |
| NC-04 | Geologia (camada base) | C | 🖥️→🌐 | 🟡 | #423 | Carta geológica LNEG |
| NC-05 | Permeabilidade Solos | C | 🖥️→🌐 | 🟡 | #456 | Textura solos |
| NC-06 | Aquíferos (contexto) | C | 🖥️→🌐 | 🟡 | #458 | SNIRH/APA |
| NC-07 | DRASTIC (vulnerabilidade) | C | 🖥️→🌐 | 🟡 | #462 | 7 factores |
| NC-08 | Risco Contaminação | C | 🖥️→🌐 | 🟡 | #466 | DRASTIC × fontes |
| NC-09 | Landform Classification | C | 🖥️→🌐 | 🟢 | #433 | TPI automático |

**Output principal:** StoryMap interactivo para oferecer à Junta de Freguesia de Minde.

---

## 9. Núcleo Florestal e Riscos

**🌲🔥 Área:** Toda a área de estudo

| ID | Nome | Tipo | Proc. | Prior. | Origem | Dados Principais |
|----|------|------|-------|--------|--------|------------------|
| **NF-00** | ⭐ Vulnerabilidade Global | P+C | 🖥️→🌐 | 🔴 | #269 | Índice multi-risco |
| **NF-01** | ⭐ **Regeneração Pós-Fogo (TESE)** | **P** | 🌍+🌐 | 🔴 | PS-07 | NBR/NDVI 10 anos |
| NF-02 | Desflorestação | C | 🖥️→🌐 | 🟡 | #387 | Transições COS |
| NF-03 | Reflorestação | C | 🖥️→🌐 | 🟡 | #388 | Transições COS |
| NF-04 | Maturidade Povoamentos | C | 🖥️→🌐 | 🟡 | #389 | LiDAR CHM + COS |
| NF-05 | Forest Carbon | C | 🖥️→🌐 | 🟢 | #394 | Área × factor |
| NF-06 | LAI (Leaf Area Index) | C | 🌍+🌐 | 🟢 | #400 | Sentinel-2 |
| NF-07 | Áreas Ardidas (histórico) | C | 🖥️→🌐 | 🟡 | ICNF | Perímetros ICNF |
| NF-08 | Perigosidade Incêndio | C | 🖥️→🌐 | 🟡 | Novo | Múltiplos factores |
| NF-09 | Susceptibilidade Derrocadas | C | 🖥️→🌐 | 🟡 | #277 | AHP multicritério |
| NF-10 | Acácias Invasoras | C+A | 🌍+🖥️ | 🟡 | #376 | Detecção floração Fev-Mar |
| NF-11 | Corredores Ecológicos | A+C | 🖥️→🌐 | 🟡 | #280 | Land Facet Corridor |
| NF-12 | Fragmentação Paisagem | C+A | 🖥️→🌐 | 🟡 | #281 | pylandstats |
| NF-13 | Wind Farm Suitability | A | 🖥️→🌐 | 🟢 | #353 | Multicritério |
| NF-14 | Turbine Visibility | A+C | 🖥️→🌐 | 🟢 | #354 | Viewshed turbinas |

**Output principal:** 
- WebGIS "Regeneração Pós-Fogo" (tese de mestrado)
- Mapa de vulnerabilidade global integrando todos os riscos

---

## 10. Núcleo Turismo e Património

**🏛️ Área:** Toda a área de estudo

| ID | Nome | Tipo | Proc. | Prior. | Origem | Dados Principais |
|----|------|------|-------|--------|--------|------------------|
| NT-01 | Percursos Pedestres | C | 🖥️→🌐 | 🟡 | Novo | OSM, trilhos existentes |
| NT-02 | Miradouros (existentes) | C | 🖥️→🌐 | 🟡 | Novo | Localização conhecida |
| NT-03 | Miradouros (potenciais) | C+A | 🖥️→🌐 | 🟡 | Novo | Viewshed analysis |
| NT-04 | Viewsheds Turísticos | A+C | 🖥️→🌐 | 🟡 | Novo | Pontos de interesse |
| **NT-05** | **Aldeia do Xisto 3D** | **P** | 🖥️ | 🟡 | PS-02 | LiDAR + Qgis2threejs |
| **NT-06** | **Villa Romana 3D** | **P** | 🖥️ | 🟢 | PS-03 | Plantas arqueológicas |

**Output principal:** 
- Modelo 3D impresso da Aldeia do Xisto
- Modelo 3D da Villa Romana para visualização

---

## 11. Projectos Standalone

Projectos independentes que não se encaixam directamente num núcleo.

| ID | Nome | Tipo | Proc. | Prior. | Descrição |
|----|------|------|-------|--------|-----------|
| **PS-01** | StoryMap Polje de Minde | P | 🌍+🌐 | 🔴 | = NC-00, narrativa inundação histórica |
| **PS-02** | Aldeia do Xisto 3D | P | 🖥️ | 🟡 | = NT-05, impressão 3D |
| **PS-03** | Villa Romana 3D | P | 🖥️ | 🟢 | = NT-06, reconstrução arqueológica |
| **PS-04** | Lixeiras Clandestinas | P | 🖥️+🌐 | 🟡 | Mapeamento colaborativo, recolha campo |
| **PS-06** | GEE Timelapses | P | 🌍 | 🟡 | Animações temporais para portfolio |
| **PS-07** | ⭐ Regeneração Pós-Fogo (TESE) | P | 🌍+🌐 | 🔴 | = NF-01, tese de mestrado |

### 11.1. PS-04 - Lixeiras Clandestinas (Detalhe)

**Conceito:** Mapeamento colaborativo de lixeiras ilegais com recolha de campo.

**Workflow:**
1. Criar formulário de recolha (KoboToolbox)
2. Recolher dados no terreno
3. Classificar por tipo, volume, risco
4. Análise de risco (buffer, proximidade água, flow direction)
5. Publicar WebGIS
6. Contactar Limpar Portugal e câmaras

**Integração com outros projectos:**
- NH-10 (SCIMAP / Poluição Pontual)
- NC-08 (Risco Contaminação)

---

## 12. Matriz de Prioridades

### 12.1. Critérios de Priorização

| Critério | Peso | Descrição |
|----------|------|-----------|
| **Impacto Portfolio** | 30% | Visibilidade, comunicabilidade |
| **Aprendizagem Técnica** | 25% | Skills desenvolvidas |
| **Dependências** | 20% | Alimenta outros projectos |
| **Facilidade** | 15% | Dados disponíveis, complexidade |
| **Interesse Pessoal** | 10% | Motivação |

### 12.2. Top 10 Prioritários

| Rank | ID | Projecto | Razão |
|------|-----|----------|-------|
| 1 | **PS-07/NF-01** | ⭐ Regeneração Pós-Fogo (TESE) | Tese pessoal, demonstra série temporal |
| 2 | **PB-00** | ⭐ Caracterização Biofísica | Base para tudo, open data, GitHub |
| 3 | **NH-09** | Upstream/Downstream Interactivo | WebGIS diferenciador, ferramenta única |
| 4 | **NU-05/08** | Isócronas + Walkshed | pgRouting, muito visual |
| 5 | **NC-00/PS-01** | StoryMap Polje Minde | Narrativa forte, contacto autarquia |
| 6 | **NA-02** | Water Stress NDVI | GEE, série temporal, automação |
| 7 | **PS-02/NT-05** | Aldeia Xisto 3D | Muito visual, emocional |
| 8 | **NH-07** | Eutrofização Temporal | Potencial artigo científico |
| 9 | **NF-10** | Acácias Invasoras | Original, artigo blog, validação campo |
| 10 | **NF-00** | Vulnerabilidade Global | Integra vários riscos |

### 12.3. Quick Wins (Rápidos de fazer)

| ID | Projecto | Tempo | Notas |
|----|----------|-------|-------|
| PB-14 | Stream Order | 2-4h | Fácil se MDT pronto |
| PB-07 | TWI | 2-4h | Uma linha de código |
| PS-06 | GEE Timelapse | 4-8h | Templates disponíveis |
| NT-03 | Miradouros potenciais | 4-8h | Viewshed simples |

---

## 13. Roadmap

### 13.1. Fase 1 - Fundações (Mês 1-2)

**Objectivo:** Stack funcional + Projecto Base + Início da Tese

| Semana | Actividade |
|--------|------------|
| 1-2 | Setup stack Docker completo |
| 3-4 | PB-00: Download e processamento MDT LiDAR |
| 5-6 | PB-00: Derivados de terreno (todas as camadas) |
| 7-8 | PS-07: Início da tese (definir área ardida, preparar dados) |

**Entregáveis:**
- Stack operacional
- Dados base disponíveis para download
- Primeiro post LinkedIn (projecto base)

### 13.2. Fase 2 - Tese + Primeiros Projectos (Mês 3-4)

**Objectivo:** Avançar tese + 3-4 projectos completos

| Projecto | Tempo | Notas |
|----------|-------|-------|
| PS-07 (Regeneração Pós-Fogo) | Contínuo | Tese - prioridade máxima |
| NH-09 (Upstream/Downstream) | 2-3 semanas | API + WebGIS interactivo |
| NU-05/08 (Isócronas/Walkshed) | 1-2 semanas | pgRouting |
| PS-01/NC-00 (StoryMap Polje) | 2 semanas | Narrativa + contacto Junta |

**Entregáveis:**
- 4 projectos no portfolio
- 4+ posts LinkedIn
- Contacto com Junta de Freguesia de Minde

### 13.3. Fase 3 - Expansão Núcleos (Mês 5-6)

**Objectivo:** Completar núcleos + automação

| Projecto | Tempo | Notas |
|----------|-------|-------|
| NA-00 (Observatório Agrícola) | 3-4 semanas | Dashboard integrado |
| NU-00 (Atlas Urbano) | 2-3 semanas | Integração |
| PS-02/NT-05 (Aldeia 3D) | 2 semanas | Impressão + contacto câmara |
| NF-10 (Acácias) | 2 semanas | Artigo blog + validação |

**Entregáveis:**
- 2 dashboards funcionais
- Modelo 3D impresso
- Artigo blog acácias invasoras

### 13.4. Fase 4 - Consolidação (Mês 7+)

**Objectivo:** Completar tese + artigos + visibilidade

| Actividade |
|------------|
| Finalizar tese de mestrado |
| Completar projectos de todos os núcleos |
| Escrever artigo técnico para submissão |
| PS-04 (Lixeiras) com trabalho de campo |
| Contactos com câmaras municipais |

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `05_PROJECTO_BASE_BIOFISICO.md` | Detalhe do PB-00 |
| `06_NUCLEO_AGRICOLA.md` | Detalhe projectos agrícolas |
| `07_NUCLEO_HIDRICO.md` | Detalhe projectos hídricos |
| `08_NUCLEO_URBANO.md` | Detalhe projectos urbanos |
| `09_NUCLEO_CARSICO.md` | Detalhe projectos cársicos |
| `10_NUCLEO_FLORESTAL_RISCOS.md` | Detalhe projectos florestais e riscos |
| `11_NUCLEO_TURISMO_PATRIMONIO.md` | Detalhe projectos turismo |
| `12_ANCHOR_PROJECTS.md` | Detalhe dos 5 anchor projects |
| `13_BIBLIOGRAFIA.md` | Referências e metodologias |
| `14_DADOS_NECESSARIOS.md` | Lista de dados e fontes |
| `15_PROXIMOS_PASSOS.md` | Roadmap detalhado |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |
| 2025-01-28 | 2.0 | Reorganização por Núcleos de Análise, adição de todos os projectos aprovados, colunas Tipo/Processamento, Anchor Projects, remoção PS-05 |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
