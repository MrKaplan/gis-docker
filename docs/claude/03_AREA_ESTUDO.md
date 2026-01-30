# 03 - ÁREA DE ESTUDO

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Delimitação Geográfica](#2-delimitação-geográfica)
3. [Bacias Hidrográficas](#3-bacias-hidrográficas)
4. [Concelhos e Freguesias](#4-concelhos-e-freguesias)
5. [Caracterização Territorial](#5-caracterização-territorial)
6. [Zonas Temáticas](#6-zonas-temáticas)
7. [Fontes de Dados Base](#7-fontes-de-dados-base)
8. [Justificação das Escolhas](#8-justificação-das-escolhas)
9. [Tarefas Pendentes](#9-tarefas-pendentes)

---

## 1. Visão Geral

### 1.1. Região: Médio Tejo

A área de estudo centra-se na região do **Médio Tejo**, no centro de Portugal, abrangendo parte dos distritos de Santarém e Leiria.

### 1.2. Critério Principal de Delimitação

> **Bacias hidrográficas completas**

A área não é delimitada por limites administrativos, mas sim por **limites hidrológicos naturais**, especificamente as bacias dos rios **Almonda** e **Alviela**.

**Razão:** Bacias completas permitem análises hidrológicas "fechadas" - toda a água que entra e sai da área pode ser contabilizada.

### 1.3. Área Aproximada

| Métrica | Valor Estimado |
|---------|----------------|
| Área total | ~1.500 - 2.000 km² |
| Extensão N-S | ~50 km |
| Extensão E-W | ~40 km |

*Nota: Valores a confirmar após delimitação exacta no QGIS*

---

## 2. Delimitação Geográfica

### 2.1. Limites Cardeais

| Direcção | Limite | Referência |
|----------|--------|------------|
| **Norte** | Ligeiramente acima de Tomar | Não cortar a cidade |
| **Este** | Albufeira de Castelo de Bode | Incluir a albufeira |
| **Sul** | Abrantes, Polje de Minde, Paul do Boquilobo | Incluir zonas húmidas |
| **Oeste** | A definir com base nos limites das bacias | Provavelmente Serra de Aire |

### 2.2. Elementos a Incluir Obrigatoriamente

| Elemento | Tipo | Razão de Inclusão |
|----------|------|-------------------|
| **Tomar** | Urbano | Centro urbano principal, análises de acessibilidade |
| **Abrantes** | Urbano | Segundo centro urbano, diversidade |
| **Castelo de Bode** | Albufeira | Análises de reservatórios, eutrofização |
| **Paul do Boquilobo** | Zona húmida | Ramsar, biodiversidade, impacto agrícola |
| **Polje de Minde** | Geomorfologia | Carso, inundações sazonais, StoryMap |
| **Nascentes do Almonda** | Hidrologia | Sistema cársico, grutas |
| **Rio Alviela** | Hidrologia | Abastecimento histórico de Lisboa |
| **Serra de Aire e Candeeiros** | Geomorfologia | Parte do sistema cársico (parcial) |

### 2.3. Mapa Conceptual

```
                    N
                    ↑
    ┌───────────────────────────────────┐
    │           Serra de Aire           │
    │              (parcial)            │
    │                                   │
    │    ┌─────────┐                    │
    │    │  TOMAR  │                    │
    │    └─────────┘     ┌────────────┐ │
    │         │          │  CASTELO   │ │
    │    Rio Nabão       │  DE BODE   │ │
    │         │          │ (albufeira)│ │
    │         ▼          └────────────┘ │
    │  ┌──────────────┐                 │
    │  │Nascentes     │    Rio Zêzere   │
    │  │Almonda       │        │        │
W ──│  │(grutas)      │        │        │── E
    │  └──────────────┘        │        │
    │         │                │        │
    │    Rio Almonda           │        │
    │         │          ┌─────────┐    │
    │         │          │ABRANTES │    │
    │    ┌────▼────┐     └─────────┘    │
    │    │ POLJE   │           │        │
    │    │ MINDE   │           │        │
    │    └─────────┘           │        │
    │         │                │        │
    │    Rio Alviela           │        │
    │         │                │        │
    │    ┌────▼──────────┐     │        │
    │    │    PAUL DO    │     │        │
    │    │   BOQUILOBO   │◄────┘        │
    │    │   (Ramsar)    │              │
    │    └───────────────┘              │
    │              │                    │
    │              ▼                    │
    │         Rio Tejo                  │
    └───────────────────────────────────┘
                    ↓
                    S
```

### 2.4. Coordenadas Aproximadas (WGS84)

| Canto | Latitude | Longitude |
|-------|----------|-----------|
| NW | 39.70° N | -8.65° W |
| NE | 39.70° N | -8.05° W |
| SE | 39.25° N | -8.05° W |
| SW | 39.25° N | -8.65° W |

*Nota: Coordenadas aproximadas, a ajustar com base nos limites das bacias*

---

## 3. Bacias Hidrográficas

### 3.1. Bacia do Rio Almonda

| Característica | Valor/Descrição |
|----------------|-----------------|
| **Área** | ~250 km² (estimativa) |
| **Nascente** | Grutas de Mira de Aire / Olhos de Água do Alviela |
| **Foz** | Confluência com Rio Tejo (Golegã) |
| **Comprimento** | ~45 km |
| **Sistema** | Cársico |

**Características especiais:**
- Nascentes em grutas (sistema cársico ativo)
- Perda de água para o sistema subterrâneo
- Torres Novas como principal centro urbano

### 3.2. Bacia do Rio Alviela

| Característica | Valor/Descrição |
|----------------|-----------------|
| **Área** | ~350 km² (estimativa) |
| **Nascente** | Olhos de Água do Alviela (Alcanena) |
| **Foz** | Confluência com Rio Tejo |
| **Comprimento** | ~60 km |
| **Sistema** | Cársico |

**Características especiais:**
- Abastecimento histórico de água a Lisboa (Aqueduto das Águas Livres)
- Nascente monumental (Olhos de Água)
- Zona industrial de curtumes em Alcanena
- Paul do Boquilobo na zona terminal

### 3.3. Sub-bacias e Ribeiras

| Sub-bacia | Bacia Principal | Notas |
|-----------|-----------------|-------|
| Ribeira de Bezelga | Almonda | Afluente esquerdo |
| Ribeira de Alvorão | Alviela | Afluente direito |
| Ribeira de Minde | Alviela | Drena o Polje de Minde |

### 3.4. Interacção com Outras Bacias

| Bacia | Relação |
|-------|---------|
| **Rio Nabão** | Passa em Tomar, confluência com Zêzere |
| **Rio Zêzere** | Castelo de Bode, confluência com Tejo |
| **Rio Tejo** | Receptor final de todas as bacias |

**Decisão:** Incluir parcialmente as bacias do Nabão e Zêzere apenas onde necessário para cobrir Tomar e Castelo de Bode, mas não como bacias completas.

---

## 4. Concelhos e Freguesias

### 4.1. Concelhos Totalmente Incluídos

| Concelho | Distrito | Área (km²) | População |
|----------|----------|------------|-----------|
| Torres Novas | Santarém | 270 | ~36.000 |
| Alcanena | Santarém | 128 | ~14.000 |
| Golegã | Santarém | 84 | ~5.500 |

### 4.2. Concelhos Parcialmente Incluídos

| Concelho | Distrito | Parte Incluída |
|----------|----------|----------------|
| Tomar | Santarém | Maior parte |
| Abrantes | Santarém | Zona norte/oeste |
| Entroncamento | Santarém | Parcialmente |
| Constância | Santarém | Parcialmente |
| Santarém | Santarém | Zona norte (Boquilobo) |
| Ourém | Santarém | Zona sul |
| Porto de Mós | Leiria | Zona este (Serra de Aire) |

### 4.3. Comunidade Intermunicipal

A área sobrepõe-se parcialmente à **CIM Médio Tejo**, que inclui:
- Abrantes, Alcanena, Constância, Entroncamento, Ferreira do Zêzere, Mação, Ourém, Sardoal, Sertã, Tomar, Torres Novas, Vila de Rei, Vila Nova da Barquinha

---

## 5. Caracterização Territorial

### 5.1. Diversidade Territorial

| Categoria | Elementos | Localização |
|-----------|-----------|-------------|
| **Urbano** | Cidades médias | Tomar, Abrantes, Torres Novas |
| **Rural** | Agricultura, povoamento disperso | Golegã, Boquilobo |
| **Hídrico** | Albufeira, rios, zonas húmidas | Castelo de Bode, Paul do Boquilobo |
| **Geomorfológico** | Carso, poljes | Polje de Minde, Serra de Aire |
| **Turístico** | Património UNESCO | Convento de Cristo (Tomar) |

### 5.2. Ocupação do Solo (COS)

| Classe | % Estimada | Localização Principal |
|--------|------------|----------------------|
| Floresta | 40% | Serra, encostas |
| Agrícola | 35% | Vale do Tejo, Golegã |
| Urbano | 10% | Cidades e vilas |
| Matos/Vegetação esparsa | 10% | Serra de Aire |
| Água | 5% | Castelo de Bode, rios |

### 5.3. Riscos e Vulnerabilidades

| Risco | Nível | Zonas Afectadas |
|-------|-------|-----------------|
| **Incêndio florestal** | Alto | Serra, florestas |
| **Cheias** | Médio-Alto | Zonas ribeirinhas, Boquilobo |
| **Erosão** | Médio | Encostas agrícolas |
| **Seca** | Médio | Zonas agrícolas |
| **Subsidência cársica** | Localizado | Polje de Minde, áreas calcárias |

### 5.4. Instrumentos de Gestão Territorial

| Instrumento | Âmbito | Relevância |
|-------------|--------|------------|
| **PNPOT** | Nacional | Enquadramento geral |
| **PROT-OVT** | Regional (Oeste e Vale do Tejo) | Directrizes regionais |
| **PDM** | Municipal | Ordenamento local |
| **POAAP Castelo de Bode** | Albufeira | Gestão da albufeira |
| **PNSAC** | Parque Natural Serra Aire e Candeeiros | Área protegida |
| **Paul do Boquilobo** | Reserva Natural | Zona húmida protegida |

### 5.5. Condicionantes (REN/RAN)

| Condicionante | Descrição | Impacto nos Projectos |
|---------------|-----------|----------------------|
| **REN** | Reserva Ecológica Nacional | Zonas non-aedificandi |
| **RAN** | Reserva Agrícola Nacional | Protecção de solos agrícolas |
| **Domínio Público Hídrico** | Margens de cursos de água | Faixas de protecção |
| **Áreas Protegidas** | PNSAC, Paul do Boquilobo | Restrições de uso |

---

## 6. Zonas Temáticas

### 6.1. Conceito

Em vez de analisar todo o território de forma homogénea, a área de estudo é organizada em **Zonas Temáticas** (ou Núcleos de Análise), onde análises específicas fazem mais sentido.

### 6.2. Zonas Definidas

#### 🌾 ZONA AGRÍCOLA - Golegã / Paul do Boquilobo

| Característica | Descrição |
|----------------|-----------|
| **Localização** | Planície aluvial do Tejo, Golegã, envolvente do Paul |
| **Área aproximada** | ~200 km² |
| **Temática principal** | Agricultura, impacto ambiental, biodiversidade |

**Análises previstas:**
- Solos e capacidade de uso
- Ocupação agrícola temporal (séries COS)
- Compatibilidade ocupação vs. potencial do solo
- Stress hídrico das culturas (NDVI temporal)
- Poluição difusa potencial (impacto no Ramsar)
- Erosão do solo
- Benefício para biodiversidade
- Turismo e percursos pedestres

**Dados principais:**
- COS (Carta de Ocupação do Solo)
- Parcelas IFAP (dados abertos)
- NDVI Sentinel-2
- Soil moisture (SMAP/SMOS)
- Solos (DGADR)

---

#### 💧 ZONA HÍDRICA - Bacias Almonda + Alviela + Castelo de Bode

| Característica | Descrição |
|----------------|-----------|
| **Localização** | Bacias completas + albufeira |
| **Área aproximada** | ~800 km² |
| **Temática principal** | Hidrologia, qualidade da água, recursos hídricos |

**Análises previstas:**
- Caracterização biofísica (MDT, derivados) - **PROJECTO BASE**
- Rede hidrográfica hierarquizada (Strahler)
- Bacias e sub-bacias (derivadas de LiDAR)
- Zonas de cheia
- Eutrofização temporal
- Reservatórios (níveis, qualidade)
- Upstream/downstream interactivo

**Dados principais:**
- MDT LiDAR (DGT)
- Sentinel-2 (índices água)
- SNIRH (níveis, qualidade)
- APA (bacias oficiais - para comparação)

---

#### 🏙️ ZONA URBANA - Tomar / Abrantes

| Característica | Descrição |
|----------------|-----------|
| **Localização** | Perímetros urbanos e envolvente imediata |
| **Área aproximada** | ~50 km² (perímetros urbanos) |
| **Temática principal** | Urbanismo, acessibilidade, serviços |

**Análises previstas:**
- Escoamento pluvial (stormwater runoff com LiDAR)
- Erosão urbana
- Acessibilidade a serviços (isócronas)
- Walkability
- Análise imobiliária / viewshed
- Cidade dos 15 minutos (adaptada)

**Dados principais:**
- MDT LiDAR alta resolução
- OSM (rede viária, serviços)
- Censos (população)
- Ortofotomapas

---

#### 🗻 ZONA CÁRSICA - Polje de Minde

| Característica | Descrição |
|----------------|-----------|
| **Localização** | Depressão cársica de Minde, Serra de Aire |
| **Área aproximada** | ~30 km² |
| **Temática principal** | Geomorfologia, inundações, património natural |

**Análises previstas:**
- Inundação histórica (StoryMap)
- Geomorfologia cársica
- Subsidência (investigar InSAR)
- Biodiversidade
- Percursos e miradouros

**Dados principais:**
- Dados meteorológicos IPMA (precipitação)
- Sentinel-1 (InSAR - a investigar)
- MDT LiDAR
- Fotografias históricas (se disponíveis)

---

### 6.3. Sobreposição entre Zonas

```
┌──────────────────────────────────────────────────┐
│                                                  │
│           ZONA HÍDRICA (toda a área)             │
│                                                  │
│    ┌────────────────┐    ┌─────────────────┐    │
│    │                │    │                 │    │
│    │  ZONA URBANA   │    │  ZONA CÁRSICA   │    │
│    │  Tomar         │    │  Polje Minde    │    │
│    │  Abrantes      │    │                 │    │
│    │                │    │                 │    │
│    └────────────────┘    └─────────────────┘    │
│                                                  │
│         ┌──────────────────────────┐            │
│         │                          │            │
│         │      ZONA AGRÍCOLA       │            │
│         │      Golegã/Boquilobo    │            │
│         │                          │            │
│         └──────────────────────────┘            │
│                                                  │
└──────────────────────────────────────────────────┘
```

**Nota:** A Zona Hídrica funciona como "base" que cobre toda a área. As outras zonas são "especializações" dentro dessa base.

---

## 7. Fontes de Dados Base

### 7.1. Dados Vectoriais

| Dado | Fonte | Formato | Licença |
|------|-------|---------|---------|
| Limites administrativos | CAOP (DGT) | SHP/GPKG | Aberta |
| Rede hidrográfica | SNIG/APA | SHP | Aberta |
| Rede viária | OSM / IP | SHP/PBF | ODbL / Aberta |
| Parcelas agrícolas | IFAP | SHP | Aberta |
| COS | DGT | SHP/GPKG | Aberta |
| REN/RAN | CCDR/DGADR | SHP | Aberta |
| Bacias hidrográficas | APA | SHP | Aberta |

### 7.2. Dados Raster

| Dado | Fonte | Resolução | Licença |
|------|-------|-----------|---------|
| MDT LiDAR | DGT | 2m | Aberta |
| Ortofotomapas | DGT / ESRI | 25cm - 50cm | Aberta / Basemap |
| Sentinel-2 | ESA/Copernicus | 10m | Aberta |
| Sentinel-1 (SAR) | ESA/Copernicus | 10m | Aberta |
| SMAP Soil Moisture | NASA | 9km | Aberta |

### 7.3. Dados Tabulares / Temporais

| Dado | Fonte | Frequência | Formato |
|------|-------|------------|---------|
| Meteo (precipitação, temp) | IPMA | Diário | API/CSV |
| Níveis albufeiras | SNIRH | Diário | Web/API |
| Qualidade água | SNIRH/APA | Mensal | Web |
| Incêndios | ICNF | Anual | SHP |
| Censos | INE | Decenal | CSV/XLS |

### 7.4. APIs e Serviços

| Serviço | URL | Uso |
|---------|-----|-----|
| DGT WMS/WFS | https://snig.dgterritorio.gov.pt | Dados base |
| iGEO | https://snig.dgterritorio.gov.pt/rndg/srv/por/catalog.search | Catálogo |
| SNIRH | https://snirh.apambiente.pt | Dados hídricos |
| Copernicus Data Space | https://dataspace.copernicus.eu | Sentinel |
| Google Earth Engine | https://earthengine.google.com | Processamento |
| Microsoft Planetary Computer | https://planetarycomputer.microsoft.com | STAC/COG |

---

## 8. Justificação das Escolhas

### 8.1. Porquê esta área?

| Razão | Explicação |
|-------|------------|
| **Conhecimento local** | Área familiar, facilita validação e trabalho de campo |
| **Diversidade** | Urbano + rural + natural + água em área compacta |
| **Dados disponíveis** | Boa cobertura de dados abertos |
| **Relevância profissional** | Alinhado com trabalho em ordenamento do território |
| **Potencial de comunicação** | Projectos com interesse visual e narrativo |

### 8.2. Porquê bacias completas?

| Razão | Explicação |
|-------|------------|
| **Fechamento hidrológico** | Toda a água pode ser contabilizada |
| **Análises integradas** | Upstream → downstream faz sentido |
| **Lógica natural** | Limite ecológico, não administrativo |
| **Comparabilidade** | Permite comparar bacias diferentes |

### 8.3. Porquê zonas temáticas?

| Razão | Explicação |
|-------|------------|
| **Foco** | Análises onde fazem mais sentido |
| **Eficiência** | Não processar dados desnecessários |
| **Narrativa** | Cada zona conta uma história |
| **Portfolio** | Projectos distintos e comunicáveis |

---

## 9. Tarefas Pendentes

### 9.1. Delimitação Exacta

- [ ] Abrir QGIS e delimitar área de estudo
- [ ] Usar bacias APA como referência inicial
- [ ] Ajustar limites para incluir elementos obrigatórios
- [ ] Exportar `extent.geojson` para a pasta do projecto
- [ ] Calcular área exacta

### 9.2. Recolha de Dados Base

- [ ] Descarregar CAOP (limites administrativos)
- [ ] Descarregar rede hidrográfica APA
- [ ] Descarregar COS mais recente
- [ ] Identificar folhas LiDAR necessárias
- [ ] Verificar cobertura Sentinel-2

### 9.3. Validação

- [ ] Verificar se todos os elementos obrigatórios estão incluídos
- [ ] Confirmar disponibilidade de dados para cada zona
- [ ] Documentar quaisquer limitações encontradas

### 9.4. Nome das Zonas

- [ ] Decidir nomenclatura final (Zonas Temáticas? Núcleos de Análise? Áreas de Foco?)

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `00_VISAO_GERAL.md` - Contexto geral
- `04_BACKLOG_PROJECTOS.md` - Projectos por zona
- `05_PROJECTO_BASE_BIOFISICO.md` - Caracterização base da área
- `06_NUCLEO_AGRICOLA.md` - Projectos do Núcleo Agrícola
- `07_NUCLEO_HIDRICO.md` - Projectos do Núcleo Hídrico

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
