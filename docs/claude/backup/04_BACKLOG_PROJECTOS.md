# 04 - BACKLOG DE PROJECTOS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Projectos por Zona Temática](#2-projectos-por-zona-temática)
3. [Projectos Standalone](#3-projectos-standalone)
4. [Grupos Integrados](#4-grupos-integrados)
5. [Análise de Temas - Estado](#5-análise-de-temas---estado)
6. [Temas Analisados (Detalhe)](#6-temas-analisados-detalhe)
7. [Temas Por Analisar](#7-temas-por-analisar)
8. [Matriz de Prioridades](#8-matriz-de-prioridades)
9. [Roadmap Sugerido](#9-roadmap-sugerido)

---

## 1. Visão Geral

### 1.1. Origem dos Projectos

Os projectos foram seleccionados a partir de uma lista de ~1000 aplicações GIS (fonte: gisgeography.com), filtrados por:
- Viabilidade técnica no stack definido
- Relevância para a área de estudo
- Interesse para portfolio/comunicação
- Disponibilidade de dados

NOTA: É importante também fazer a distinção entre o que será uma camada e o que será um projecto propriamente dito

### 1.2. Organização

Os projectos estão organizados em:

| Tipo | Descrição |
|------|-----------|
| **Por Zona** | Projectos específicos de cada zona temática |
| **Standalone** | Projectos independentes, não ligados a zonas |
| **Grupos Integrados** | Projectos que combinam várias análises |
| **News ON GIS** | Projectos reactivos a notícias/actualidade |

### 1.3. Nomenclatura de IDs

| Prefixo | Significado | Exemplo |
|---------|-------------|---------|
| `ZA-` | Zona Agrícola | ZA-01 |
| `ZH-` | Zona Hídrica | ZH-01 |
| `ZU-` | Zona Urbana | ZU-01 |
| `ZC-` | Zona Cársica | ZC-01 |
| `PS-` | Projecto Standalone | PS-01 |
| `GI-` | Grupo Integrado | GI-01 |
| `NG-` | News ON GIS | NG-YYYY-MM-DD |

---

## 2. Projectos por Zona Temática

### 2.1. 🌾 ZONA AGRÍCOLA - Golegã / Paul do Boquilobo

| ID | Projecto | Origem | Prioridade | Dados Principais |
|----|----------|--------|------------|------------------|
| **ZA-00** | **Observatório Agrícola** | Conceito integrador | 🔴 Alta | Todos abaixo |
| ZA-01 | Solos e Capacidade de Uso | Novo | 🟡 Média | Carta solos DGADR |
| ZA-02 | Ocupação Agrícola Temporal | #13 | 🟡 Média | COS séries, IFAP |
| ZA-03 | Compatibilidade Ocupação vs Solo | Novo | 🟡 Média | ZA-01 + ZA-02 |
| ZA-04 | Stress Hídrico (NDVI temporal) | #12 | 🔴 Alta | Sentinel-2 NDVI |
| ZA-05 | Poluição Difusa Potencial | #21 | 🟡 Média | Uso solo, declive, proximidade água |
| ZA-06 | Erosão Agrícola | #804, #806 | 🟡 Média | USLE components |
| ZA-07 | Benefício Biodiversidade | Novo | 🟢 Baixa | Proximidade Paul, conectividade |
| ZA-08 | Turismo e Percursos | Novo | 🟢 Baixa | OSM, trilhos |
| ZA-09 | Precision Farming (light) | #1 | 🟢 Baixa | NDVI, SMAP, IFAP |
| ZA-10 | Resiliência Culturas | #16 | 🟢 Baixa | COS + IFAP + ML futuro |
| ZA-11 | Produtividade NDVI vs Meteo | #17 | 🟢 Baixa | NDVI + IPMA |
| ZA-12 | Seca / Drought Index | #26 | 🟡 Média | NDVI, SMAP, precipitação |

**Output principal:** Dashboard/WebGIS "Observatório Agrícola da Lezíria"

---

### 2.2. 💧 ZONA HÍDRICA - Bacias Almonda + Alviela + Castelo de Bode

| ID | Projecto | Origem | Prioridade | Dados Principais |
|----|----------|--------|------------|------------------|
| **ZH-00** | **Caracterização Biofísica** | #538 | 🔴 **PRIORITÁRIO** | MDT LiDAR |
| ZH-01 | Rede Hidrográfica (Strahler) | #98 | 🔴 Alta | Flow accumulation |
| ZH-02 | Bacias e Sub-bacias | #525 | 🔴 Alta | MDT LiDAR |
| ZH-03 | Flow Direction / Accumulation | #527, #534 | 🔴 Alta | MDT |
| ZH-04 | TWI (Topographic Wetness Index) | #526 | 🟡 Média | MDT |
| ZH-05 | Zonas de Cheia | #539 | 🟡 Média | MDT, histórico |
| ZH-06 | Eutrofização Temporal | #372 | 🟡 Média | Sentinel-2 (NDWI, Chl-a) |
| ZH-07 | Reservatórios (Castelo de Bode) | #547 | 🟡 Média | SNIRH, Sentinel-2 |
| ZH-08 | Upstream/Downstream Interactivo | #548 | 🔴 Alta | ZH-03 + API |
| ZH-09 | SCIMAP / Poluição Pontual | #109 | 🟡 Média | Lixeiras + flow |
| ZH-10 | Sedimentação / Erosão Hídrica | #524 | 🟡 Média | USLE, comparar REN |
| ZH-11 | Comparar Bacias LiDAR vs APA | Novo | 🟢 Baixa | ZH-02 vs oficial |

**Output principal:** 
- Projecto Base de Caracterização (ZH-00)
- WebGIS interactivo com upstream/downstream (ZH-08)
- Potencial artigo: "Evolução eutrofização reservatórios Médio Tejo"

---

### 2.3. 🏙️ ZONA URBANA - Tomar / Abrantes

| ID | Projecto | Origem | Prioridade | Dados Principais |
|----|----------|--------|------------|------------------|
| **ZU-00** | **Acessibilidade Urbana** | Conceito integrador | 🔴 Alta | Todos abaixo |
| ZU-01 | Isócronas (a pé, carro, bici) | P15 | 🔴 Alta | OSM, pgRouting |
| ZU-02 | Walkability | #754 | 🔴 Alta | OSM, passeios, declive |
| ZU-03 | Acesso a Serviços | #752, #772 | 🟡 Média | POIs, isócronas |
| ZU-04 | Transportes Públicos | #782 | 🟡 Média | GTFS se disponível |
| ZU-05 | Escoamento Pluvial (Stormwater) | #377 | 🟡 Média | MDT LiDAR urbano |
| ZU-06 | Erosão Urbana | #524 | 🟢 Baixa | MDT, impermeabilização |
| ZU-07 | Análise Imobiliária | #737, #747 | 🟢 Baixa | Preços, localização |
| ZU-08 | Viewshed / Vistas Panorâmicas | #739 | 🟡 Média | MDT, pontos interesse |
| ZU-09 | Cidade 15 Minutos (adaptada) | Novo | 🟡 Média | ZU-01 + ZU-03 |
| ZU-10 | Distance Decay (a definir) | #784 | 🟢 Baixa | A definir |

**Output principal:** Dashboard "Acessibilidade Urbana" com isócronas interactivas

---

### 2.4. 🗻 ZONA CÁRSICA - Polje de Minde

| ID | Projecto | Origem | Prioridade | Dados Principais |
|----|----------|--------|------------|------------------|
| **ZC-00** | **StoryMap Polje de Minde** | PS-01 | 🔴 Alta | Vários |
| ZC-01 | Inundação Histórica | Novo | 🔴 Alta | IPMA, fotos, testemunhos |
| ZC-02 | Geomorfologia Cársica | Novo | 🟡 Média | MDT, geologia |
| ZC-03 | Subsidência (InSAR) | Novo | 🟢 Baixa | Sentinel-1 (investigar) |
| ZC-04 | Biodiversidade | Novo | 🟢 Baixa | Habitats, espécies |
| ZC-05 | Percursos e Miradouros | #811 | 🟢 Baixa | OSM, MDT viewshed |

**Output principal:** StoryMap interactivo para oferecer à Junta de Freguesia

---

## 3. Projectos Standalone

Projectos independentes das zonas temáticas.

| ID | Nome | Descrição | Prioridade | Output |
|----|------|-----------|------------|--------|
| **PS-01** | Polje de Minde StoryMap | Narrativa inundação histórica | 🔴 Alta | StoryMap (= ZC-00) |
| **PS-02** | Aldeia do Xisto 3D | Modelo 3D + impressão | 🟡 Média | Modelo STL, post LinkedIn |
| **PS-03** | Villa Romana 3D | Reconstrução arqueológica | 🟢 Baixa | Modelo 3D |
| **PS-04** | Lixeiras Clandestinas | Mapeamento + recolha campo | 🟡 Média | WebGIS, Limpar Portugal |
| **PS-05** | News ON GIS | Mini-projectos reactivos | 🟡 Média | Série de posts |
| **PS-06** | GEE Timelapses | Animações temporais | 🟡 Média | GIFs, portfolio |

### 3.1. PS-02 - Aldeia do Xisto 3D (Detalhe)

**Conceito:** Perpetuar memória de aldeias abandonadas através de modelo 3D impresso.

**Workflow:**
1. Seleccionar aldeia (ex: Dornes, Fajão, ou aldeia mais pequena)
2. Extrair MDT LiDAR da zona
3. Adicionar edifícios (OSM ou digitalização manual)
4. Gerar modelo STL (QGIS + Qgis2threejs ou Blender)
5. Imprimir 3D (Fablab ou serviço online)
6. Contactar câmara municipal
7. Comunicar (LinkedIn + Blog)

**Narrativa:** "Há várias formas de perpetuar a memória das aldeias abandonadas do interior. Esta é uma delas."

---

### 3.2. PS-04 - Lixeiras Clandestinas (Detalhe)

**Conceito:** Mapeamento colaborativo de lixeiras ilegais com recolha de campo.

**Workflow:**
1. Criar formulário de recolha (KoboToolbox ou similar)
2. Recolher dados no terreno
3. Classificar por tipo, volume, risco
4. Análise de risco (proximidade água, declive, flow direction)
5. Publicar WebGIS
6. Contactar Limpar Portugal e câmaras

**Dados a recolher:**
- Localização GPS
- Tipo de resíduos
- Volume estimado
- Fotografias
- Acessibilidade
- Proximidade a água

---

### 3.3. PS-05 - News ON GIS (Detalhe)

**Conceito:** Série de mini-projectos reactivos a notícias e eventos actuais.

**Fontes de ideias:**
- Notícias que vês
- Google Trends
- Google Alerts (cheias, incêndios, etc.)
- Redes sociais

**Estrutura por projecto:**
```
news-on-gis/
└── YYYY-MM-DD-titulo-curto/
    ├── README.md
    ├── followup.md
    ├── notebooks/
    └── outputs/
```

**Exemplos potenciais:**
- Incêndio florestal → Mapa de área ardida + NBR
- Cheia → Extensão inundada + população afectada
- Seca → Dashboard de reservatórios
- Evento sísmico → Mapa de intensidade + edifícios

---

### 3.4. PS-06 - GEE Timelapses (Detalhe)

**Conceito:** Usar Google Earth Engine para gerar animações temporais.

**Como funciona:**
- Código Python/JavaScript chama API do GEE
- Processamento pesado corre nos servidores Google
- Resultado (GIF/vídeo) é descarregado

**Ideias de timelapses:**
- Expansão urbana (Landsat 30 anos)
- Variação NDVI sazonal
- Nível de reservatórios
- Área ardida ao longo dos anos
- Desertificação / abandono agrícola

**Impacto:** Muito visual, excelente para LinkedIn e portfolio.

---

## 4. Grupos Integrados

Projectos que combinam várias análises numa entrega coesa.

### 4.1. GI-01 - Acessibilidade e Serviços Urbanos

**Combina:**
- ZU-01 (Isócronas)
- ZU-02 (Walkability)
- ZU-03 (Acesso a Serviços)
- ZU-04 (Transportes Públicos)
- ZU-09 (Cidade 15 Minutos)

**Output:** Dashboard integrado de acessibilidade urbana

---

### 4.2. GI-02 - Análise Imobiliária e Viewshed

**Combina:**
- ZU-07 (Análise Imobiliária)
- ZU-08 (Viewshed)
- ZU-01 (Isócronas - distância a serviços)

**Output:** Ferramenta de avaliação imobiliária com componente de vistas

---

### 4.3. GI-03 - Riscos Geomorfológicos

**Combina:**
- ZA-06 (Erosão Agrícola)
- ZH-10 (Erosão Hídrica)
- ZU-06 (Erosão Urbana)
- #277 (Susceptibilidade a deslizamentos - a analisar)

**Output:** Mapa integrado de riscos geomorfológicos

---

### 4.4. GI-04 - Dashboard Ambiental Automático

**Combina:**
- ZH-07 (Reservatórios)
- ZA-12 (Seca)
- #801 (Soil Moisture automático)
- P08 (Scraping ambiental diário)

**Output:** Dashboard com camadas actualizadas automaticamente via cron

---

## 5. Análise de Temas - Estado

### 5.1. Resumo

| Tema | Números | Descrição | Estado |
|------|---------|-----------|--------|
| 1 | 1-50 | Agricultura | ✅ Completo |
| 2 | 51-173 | Água e Hidrologia | ✅ Completo |
| 3 | 174-191, 368-382 | Clima e Ambiente | ⏳ Pendente |
| 4 | 419-434, 456-468 | Geologia e Solos | ⏳ Pendente |
| 5 | 385-406 | Floresta e Vegetação | ⏳ Pendente |
| 6 | 278-316 | Ecologia e Biodiversidade | ⏳ Pendente |
| 7 | 65-77, 575-606 | Urbanismo e Planeamento | ⏳ Pendente |
| 8 | 110-162, 579, 594, 613 | Transportes e Mobilidade | ⏳ Pendente |
| 9 | 51-62, 498-519 | Turismo e Património | ⏳ Pendente |
| 10 | 469-495 | Saúde e Social | ⏳ Pendente |
| 11 | 250-277 | Desastres e Emergência | ⏳ Pendente |
| 12 | 342-356, 590-635 | Infraestruturas e Utilities | ⏳ Pendente |
| 13 | 134-161, 318, 332 | Economia e Negócios | ⏳ Pendente |
| 14 | 435-455 | Geostatística (técnicas) | ⏳ Pendente |

### 5.2. Projectos Já Escolhidos (lista 625-1000)

Da análise parcial da lista 625-1000, já foram escolhidos:

| # | Projecto | Zona | Notas |
|---|----------|------|-------|
| 737 | Home Evaluation | ZU-07 | Avaliação imobiliária |
| 739 | Viewshed | ZU-08 | Muito interessante |
| 747 | Comparative Real Estate | ZU-07 | €/m² comparativo |
| 752 | Real Estate Metrics | ZU-03 | Distância a serviços |
| 754 | Walkability | ZU-02 | ⭐ Favorito |
| 772 | Needs of Services | ZU-03 | Populações marginalizadas |
| 782 | Public Transportation | ZU-04 | Transportes públicos |
| 784 | Distance Decay | ZU-10 | Pensar projecto diferente |
| 801 | Soil Moisture | GI-04 | Camada automática |
| 804 | Erosion Hotspots | GI-03 | Identificar zonas críticas |
| 806 | USLE | ZA-06, ZH-10 | Perda de solo |
| 808 | LS Factor | ZA-06 | Parte da USLE |
| 811 | Miradouros | ZC-05 | Existentes + potenciais |

---

## 6. Temas Analisados (Detalhe)

### 6.1. TEMA 1 - AGRICULTURA ✅

**Projectos originais analisados:** 1-50

| # | Projecto Original | Decisão | Mapeado para |
|---|-------------------|---------|--------------|
| 1 | Precision Farming | ✅ Sim (light) | ZA-09 |
| 12 | Water Stress | ✅ Sim | ZA-04 |
| 13 | Historical Agricultural Land | 🟡 Talvez | ZA-02 |
| 16 | Crop Resilience | ✅ Sim | ZA-10 |
| 17 | Crop Productivity NDVI | 🟡 Talvez | ZA-11 |
| 21 | Agricultural Pollution | ✅ Sim | ZA-05 |
| 24 | Farm Preservation | ❌ Não | - |
| 26 | Drought | ✅ Sim | ZA-12 |

**Conceito resultante:** Observatório Agrícola centrado na Golegã/Boquilobo

---

### 6.2. TEMA 2 - ÁGUA/HIDROLOGIA ✅

**Projectos originais analisados:** 51-173 (parcial), 368-382, 520-550

| # | Projecto Original | Decisão | Mapeado para |
|---|-------------------|---------|--------------|
| 98 | Stream Order (Strahler) | ✅ Sim | ZH-01 |
| 109 | SCIMAP / Pollution | ✅ Sim | ZH-09 |
| 372 | Eutrophication | ✅ Sim | ZH-06 |
| 377 | Stormwater Runoff | ✅ Sim | ZU-05 |
| 524 | Sedimentation Rate | ✅ Sim | ZH-10 |
| 525 | Catchment Areas | ✅ Sim | ZH-02 |
| 526 | TWI | ✅ Sim | ZH-04 |
| 527 | Flow Direction | ✅ Sim | ZH-03 |
| 534 | Flow Accumulation | ✅ Sim | ZH-03 |
| 537 | Aqueduct | ❌ Não | - |
| 538 | Contour Lines / Base | ✅ **PRIORITÁRIO** | ZH-00 |
| 539 | Flood Extents | ✅ Sim | ZH-05 |
| 547 | Water Shortage | ✅ Sim | ZH-07 |
| 548 | Upstream/Downstream | ✅ Sim | ZH-08 |
| 550 | Oxbows | ❌ Não | - |

**Conceito resultante:** 
- Projecto Base de Caracterização Biofísica (ZH-00) - **PRIORITÁRIO**
- Funcionalidade interactiva upstream/downstream (ZH-08)

---

## 7. Temas Por Analisar

### 7.1. TEMA 3 - Clima e Ambiente

**Números:** 174-191, 368-382

**Projectos potencialmente interessantes:**
- Microclimas urbanos
- Ilhas de calor
- Qualidade do ar
- Alterações climáticas locais

---

### 7.2. TEMA 4 - Geologia e Solos

**Números:** 419-434, 456-468

**Projectos potencialmente interessantes:**
- Carta geológica
- Susceptibilidade a movimentos de massa
- Capacidade de uso do solo
- Recursos minerais

---

### 7.3. TEMA 5 - Floresta e Vegetação

**Números:** 385-406

**Projectos potencialmente interessantes:**
- Risco de incêndio
- Área ardida (NBR)
- Inventário florestal
- Recuperação pós-fogo

---

### 7.4. TEMA 6 - Ecologia e Biodiversidade

**Números:** 278-316

**Projectos potencialmente interessantes:**
- Conectividade ecológica
- Habitats prioritários
- Corredores verdes
- Espécies invasoras

---

### 7.5. TEMA 7 - Urbanismo e Planeamento

**Números:** 65-77, 575-606

**Projectos potencialmente interessantes:**
- Análise de PDM
- Expansão urbana
- Densidade populacional
- Vazios urbanos

---

### 7.6. TEMA 8 - Transportes e Mobilidade

**Números:** 110-162, 579, 594, 613

**Projectos potencialmente interessantes:**
- Análise de tráfego
- Infraestrutura ciclável
- Acidentes rodoviários
- Acessibilidade regional

---

### 7.7. TEMA 9 - Turismo e Património

**Números:** 51-62, 498-519

**Projectos potencialmente interessantes:**
- Rotas turísticas
- Património classificado
- Capacidade de carga
- Geoturismo

---

### 7.8. TEMA 10 - Saúde e Social

**Números:** 469-495

**Projectos potencialmente interessantes:**
- Acesso a cuidados de saúde
- Envelhecimento populacional
- Isolamento social
- Equipamentos sociais

---

### 7.9. TEMA 11 - Desastres e Emergência

**Números:** 250-277

**Projectos potencialmente interessantes:**
- Susceptibilidade a cheias
- Risco sísmico
- Planeamento de emergência
- Evacuação

---

### 7.10. TEMA 12 - Infraestruturas e Utilities

**Números:** 342-356, 590-635

**Projectos potencialmente interessantes:**
- Rede eléctrica
- Saneamento
- Telecomunicações
- Energias renováveis (solar, eólico)

---

### 7.11. TEMA 13 - Economia e Negócios

**Números:** 134-161, 318, 332

**Projectos potencialmente interessantes:**
- Análise de mercado
- Localização de negócios
- Catchment areas comerciais
- Emprego

---

### 7.12. TEMA 14 - Geostatística (Técnicas)

**Números:** 435-455

**Nota:** Este tema é mais sobre técnicas do que projectos. Usar como referência metodológica.

**Técnicas potencialmente úteis:**
- Interpolação (IDW, Kriging)
- Autocorrelação espacial
- Clustering espacial
- Regressão geográfica (GWR)

---

## 8. Matriz de Prioridades

### 8.1. Critérios de Priorização

| Critério | Peso | Descrição |
|----------|------|-----------|
| **Impacto Portfolio** | 30% | Visibilidade, comunicabilidade |
| **Aprendizagem Técnica** | 25% | Skills desenvolvidas |
| **Dependências** | 20% | Alimenta outros projectos |
| **Facilidade** | 15% | Dados disponíveis, complexidade |
| **Interesse Pessoal** | 10% | Motivação |

### 8.2. Top 10 Prioritários

| Rank | ID | Projecto | Razão |
|------|-----|----------|-------|
| 1 | **ZH-00** | Caracterização Biofísica | Base para tudo, aprende stack |
| 2 | **ZH-08** | Upstream/Downstream | WebGIS interactivo, diferenciador |
| 3 | **ZU-01** | Isócronas | pgRouting, muito visual |
| 4 | **ZU-02** | Walkability | ⭐ Favorito, cidade 15 min |
| 5 | **PS-01/ZC-00** | StoryMap Polje Minde | Narrativa forte, contacto autarquia |
| 6 | **ZA-04** | Stress Hídrico NDVI | GEE, série temporal |
| 7 | **PS-02** | Aldeia Xisto 3D | Muito visual, emocional |
| 8 | **ZH-06** | Eutrofização Temporal | Potencial artigo |
| 9 | **PS-04** | Lixeiras Clandestinas | Projecto pessoal, campo |
| 10 | **GI-04** | Dashboard Automático | Demonstra automação |

### 8.3. Quick Wins (Rápidos de fazer)

| ID | Projecto | Tempo Estimado | Notas |
|----|----------|----------------|-------|
| ZH-01 | Stream Order | 2-4h | Fácil se MDT pronto |
| ZH-04 | TWI | 2-4h | Uma linha de código |
| PS-06 | GEE Timelapse | 4-8h | Templates disponíveis |
| ZC-05 | Miradouros | 4-8h | Viewshed simples |

---

## 9. Roadmap Sugerido

### 9.1. Fase 1 - Fundações (Mês 1-2)

**Objectivo:** Stack funcional + Projecto Base

| Semana | Actividade |
|--------|------------|
| 1-2 | Setup stack Docker |
| 3-4 | ZH-00: Download e processamento MDT |
| 5-6 | ZH-00: Derivados de terreno |
| 7-8 | ZH-00: Hidrologia base + documentação |

**Entregáveis:**
- Stack operacional
- Dados base disponíveis
- Primeiro post LinkedIn

---

### 9.2. Fase 2 - Primeiros Projectos (Mês 3-4)

**Objectivo:** 3-4 projectos completos + comunicação

| Projecto | Tempo | Notas |
|----------|-------|-------|
| ZH-08 (Upstream/Downstream) | 2-3 semanas | API + WebGIS |
| ZU-01 (Isócronas) | 1-2 semanas | pgRouting |
| PS-01 (StoryMap Polje) | 2 semanas | Narrativa + contacto |
| PS-06 (Timelapse) | 1 semana | Quick win visual |

**Entregáveis:**
- 4 projectos no portfolio
- 4+ posts LinkedIn
- 2+ artigos blog

---

### 9.3. Fase 3 - Expansão (Mês 5-6)

**Objectivo:** Zonas temáticas + automação

| Projecto | Tempo | Notas |
|----------|-------|-------|
| ZU-02 (Walkability) | 2 semanas | Favorito |
| ZA-00 (Observatório Agrícola) | 3-4 semanas | Dashboard integrado |
| GI-04 (Dashboard Automático) | 2 semanas | Cron jobs |
| PS-02 (Aldeia 3D) | 2 semanas | Contacto câmara |

**Entregáveis:**
- 2 dashboards funcionais
- Modelo 3D impresso
- Automação demonstrada

---

### 9.4. Fase 4 - Consolidação (Mês 7+)

**Objectivo:** Completar zonas + artigos + visibilidade

| Actividade |
|------------|
| Completar projectos das 4 zonas |
| Analisar temas 3-14 pendentes |
| Escrever artigo técnico para submissão |
| News ON GIS conforme oportunidades |
| PS-04 (Lixeiras) com trabalho de campo |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `03_AREA_ESTUDO.md` - Definição das zonas temáticas
- `05_PROJECTO_BASE_BIOFISICO.md` - Detalhe do ZH-00
- `06_TEMA1_AGRICULTURA.md` - Detalhe projectos agrícolas
- `07_TEMA2_AGUA.md` - Detalhe projectos hídricos
- `10_PROXIMOS_PASSOS.md` - Roadmap detalhado

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
