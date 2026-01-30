# 11 - NÚCLEO TURISMO E PATRIMÓNIO

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Projectos do Núcleo](#2-projectos-do-núcleo)
3. [Percursos e Miradouros](#3-percursos-e-miradouros)
4. [Modelos 3D](#4-modelos-3d)
5. [Património Cultural](#5-património-cultural)
6. [Dados e Fontes](#6-dados-e-fontes)
7. [Metodologias](#7-metodologias)
8. [Implementação Técnica](#8-implementação-técnica)
9. [Outputs e Entregas](#9-outputs-e-entregas)
10. [Comunicação e Outreach](#10-comunicação-e-outreach)

---

## 1. Visão Geral

### 1.1. Identificação do Núcleo

| Campo | Valor |
|-------|-------|
| **Prefixo** | NT- |
| **Nome** | Núcleo Turismo e Património |
| **Emoji** | 🏛️ |
| **Área Geográfica** | Toda a área de estudo |
| **Área aproximada** | ~800 km² |
| **Projectos Destaque** | NT-05 (Aldeia do Xisto 3D), NT-06 (Villa Romana 3D) |

### 1.2. Contexto Territorial

O Núcleo Turismo e Património abrange **toda a área de estudo** e foca-se em:

- **Percursos pedestres:** Rotas existentes e potenciais
- **Miradouros:** Existentes e potenciais (viewshed analysis)
- **Modelos 3D:** Aldeias históricas, sítios arqueológicos
- **Património cultural:** Monumentos, sítios classificados

### 1.3. Relevância

| Aspecto | Descrição |
|---------|-----------|
| **Turístico** | Região rica em património (Convento de Cristo UNESCO) |
| **Cultural** | Aldeias históricas, sítios arqueológicos romanos |
| **Natural** | Paisagens únicas (Castelo de Bode, Serra de Aire) |
| **Emocional** | Preservação da memória de aldeias abandonadas |
| **Portfolio** | Projectos muito visuais, alto impacto comunicação |

### 1.4. Património na Área de Estudo

| Património | Localização | Classificação |
|------------|-------------|---------------|
| **Convento de Cristo** | Tomar | UNESCO / Monumento Nacional |
| **Castelo de Tomar** | Tomar | Monumento Nacional |
| **Aqueduto dos Pegões** | Tomar | Monumento Nacional |
| **Castelo de Abrantes** | Abrantes | Monumento Nacional |
| **Grutas de Mira de Aire** | Serra de Aire | Património Natural |
| **Paul do Boquilobo** | Golegã | Reserva RAMSAR |
| **Aldeias do Xisto** | Serra | Património Vernacular |
| **Villae Romanas** | Vários | Arqueologia |

### 1.5. Temas Principais

| Tema | Projectos |
|------|-----------|
| **Percursos** | NT-01 |
| **Miradouros** | NT-02, NT-03, NT-04 |
| **Modelos 3D** | NT-05, NT-06 |

---

## 2. Projectos do Núcleo

### 2.1. Tabela Resumo

| ID | Nome | Tipo | Proc. | Prior. | Origem |
|----|------|------|-------|--------|--------|
| NT-01 | Percursos Pedestres | C | 🖥️→🌐 | 🟡 | Novo |
| NT-02 | Miradouros (existentes) | C | 🖥️→🌐 | 🟡 | Novo |
| NT-03 | Miradouros (potenciais) | C+A | 🖥️→🌐 | 🟡 | Novo |
| NT-04 | Viewsheds Turísticos | A+C | 🖥️→🌐 | 🟡 | Novo |
| **NT-05** | **Aldeia do Xisto 3D** | **P** | 🖥️ | 🟡 | PS-02 |
| **NT-06** | **Villa Romana 3D** | **P** | 🖥️ | 🟢 | PS-03 |

**Legenda:**
- **Tipo:** F=Ferramenta, P=Projecto, C=Camada, A=Análise
- **Proc.:** 🌐=Online, 🖥️=Desktop, 🌍=GEE
- **Prior.:** 🔴=Alta, 🟡=Média, 🟢=Baixa

### 2.2. Quick Wins

Este núcleo tem alguns **quick wins** — projectos rápidos de executar:

| ID | Nome | Tempo Est. | Notas |
|----|------|-----------|-------|
| NT-03 | Miradouros potenciais | 4-8h | Viewshed simples |
| NT-01 | Percursos Pedestres | 4-8h | OSM + validação |

---

## 3. Percursos e Miradouros

### 3.1. NT-01 - Percursos Pedestres

| Campo | Valor |
|-------|-------|
| **ID** | NT-01 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |

**Objectivo:** Compilar e publicar rede de percursos pedestres da região.

**Fontes de dados:**

| Fonte | Tipo | Cobertura |
|-------|------|-----------|
| OpenStreetMap | highway=path, footway | Variável |
| Wikiloc | GPX tracks | Popular |
| Percursos Pedestres Sinalizados (PPS) | Oficial | PR, GR |
| Câmaras Municipais | Oficial | Local |

**Extracção OSM:**
```python
import osmnx as ox

# Definir área de estudo
place = "Médio Tejo, Portugal"

# Extrair rede pedestre
G = ox.graph_from_place(place, network_type='walk')

# Converter para GeoDataFrame
nodes, edges = ox.graph_to_gdfs(G)

# Filtrar por tipo
footpaths = edges[edges['highway'].isin(['footway', 'path', 'track'])]
```

**Atributos a incluir:**

| Atributo | Descrição |
|----------|-----------|
| nome | Nome do percurso |
| tipo | PR, GR, local, informal |
| distancia | Comprimento em km |
| dificuldade | Fácil, Moderado, Difícil |
| duracao | Tempo estimado |
| desnivel | Desnível acumulado |
| circular | Sim/Não |
| sinalizado | Sim/Não |

**Outputs:**
- Mapa de percursos (WebGIS)
- Perfis de elevação
- Ficha de cada percurso (PDF/Web)

---

### 3.2. NT-02 - Miradouros (existentes)

| Campo | Valor |
|-------|-------|
| **ID** | NT-02 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |

**Objectivo:** Mapear miradouros existentes e conhecidos.

**Fontes:**
- OpenStreetMap (tourism=viewpoint)
- Google Maps
- Wikiloc (POIs)
- Conhecimento local

**Extracção OSM:**
```python
import osmnx as ox

# Extrair miradouros
viewpoints = ox.features_from_place(
    "Médio Tejo, Portugal",
    tags={'tourism': 'viewpoint'}
)
```

**Atributos:**

| Atributo | Descrição |
|----------|-----------|
| nome | Nome do miradouro |
| altitude | Altitude (m) |
| acesso | Carro, a pé, ambos |
| infraestrutura | Estacionamento, WC, etc. |
| vista | Descrição da vista |
| coordenadas | Lat/Lon |

---

### 3.3. NT-03 - Miradouros (potenciais)

| Campo | Valor |
|-------|-------|
| **ID** | NT-03 |
| **Tipo** | Camada + Análise |
| **Prioridade** | 🟡 Média (Quick Win) |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |
| **Dependências** | PB-00 (MDT) |

**Objectivo:** Identificar locais com potencial para miradouros usando viewshed analysis.

**Metodologia:**

```python
import richdem as rd
import numpy as np

def find_potential_viewpoints(dem, min_elevation_percentile=90, 
                               min_visibility_area=1000000):
    """
    Identifica pontos com potencial para miradouros.
    
    Critérios:
    1. Altitude elevada (percentil 90+)
    2. Grande área visível (viewshed)
    3. Próximo de acesso (estrada)
    """
    
    # 1. Filtrar por altitude
    high_points = dem > np.percentile(dem, min_elevation_percentile)
    
    # 2. Para cada ponto alto, calcular viewshed
    candidates = []
    for point in get_high_points(dem, high_points):
        viewshed = calculate_viewshed(dem, point)
        visible_area = np.sum(viewshed) * cell_size**2
        
        if visible_area >= min_visibility_area:
            candidates.append({
                'location': point,
                'visible_area': visible_area,
                'elevation': dem[point]
            })
    
    return candidates
```

**Critérios de selecção:**

| Critério | Peso | Descrição |
|----------|------|-----------|
| Área visível | 40% | Maior viewshed = melhor |
| Diversidade paisagem | 20% | Ver água, montanha, urbano |
| Acessibilidade | 20% | Distância a estrada |
| Altitude relativa | 20% | Destaque no terreno |

**Outputs:**
- Mapa de pontos potenciais (ranking)
- Viewshed de cada candidato
- Recomendações para validação de campo

---

### 3.4. NT-04 - Viewsheds Turísticos

| Campo | Valor |
|-------|-------|
| **ID** | NT-04 |
| **Tipo** | Análise + Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |
| **Dependências** | PB-00 (MDT), NT-02 |

**Objectivo:** Calcular e visualizar o que se vê de cada ponto turístico importante.

**Pontos de interesse para viewshed:**

| Local | Tipo | Interesse |
|-------|------|-----------|
| Convento de Cristo | Monumento | O que se vê do convento |
| Castelo de Tomar | Monumento | Panorama 360° |
| Castelo de Abrantes | Monumento | Vista sobre o Tejo |
| Miradouros existentes | Turístico | Validar/documentar vista |
| Barragem Castelo de Bode | Infraestrutura | Vista sobre albufeira |

**Implementação QGIS/GRASS:**
```
r.viewshed input=dem output=viewshed coordinates=x,y observer_elevation=1.7
```

**Outputs:**
- Mapa de visibilidade para cada ponto
- Viewshed cumulativo (zonas mais visíveis)
- Mapa de "zonas escondidas" (nunca visíveis de pontos turísticos)

---

## 4. Modelos 3D

### 4.1. NT-05 - Aldeia do Xisto 3D (PS-02)

| Campo | Valor |
|-------|-------|
| **ID** | NT-05 / PS-02 |
| **Tipo** | **Projecto** |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop |
| **Origem** | PS-02 |

#### 4.1.1. Conceito

**"Há várias formas de perpetuar a memória das aldeias abandonadas do interior. Esta é uma delas."**

Este projecto cria um **modelo 3D físico** de uma aldeia histórica para:
- Preservar a memória do património vernacular
- Criar um objecto tangível para oferecer à autarquia
- Demonstrar capacidades de modelação 3D
- Gerar conteúdo muito visual para portfolio

#### 4.1.2. Selecção da Aldeia

**Candidatas na área de estudo:**

| Aldeia | Concelho | Características | LiDAR |
|--------|----------|-----------------|-------|
| Dornes | Ferreira do Zêzere | Península no Zêzere, torre templária | ✅ |
| Álvaro | Oleiros | Aldeia do Xisto, bem preservada | Verificar |
| Outras aldeias serranas | Vários | A investigar | Verificar |

**Critérios de selecção:**

| Critério | Peso |
|----------|------|
| Cobertura LiDAR | Essencial |
| Interesse visual | Alto |
| Acessibilidade (para fotos) | Médio |
| Abandono/Preservação | Médio |
| Ligação à área de estudo | Médio |

#### 4.1.3. Workflow Técnico

```
┌─────────────────────────────────────────────────────────────┐
│                    WORKFLOW ALDEIA 3D                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. DADOS                                                   │
│     ├── Download MDT LiDAR (DGT)                           │
│     ├── Ortofotomapa (DGT)                                 │
│     └── Edifícios (OSM ou digitalização)                   │
│                                                             │
│  2. PROCESSAMENTO QGIS                                     │
│     ├── Recortar área de interesse                         │
│     ├── Criar hillshade para contexto                      │
│     └── Preparar camada de edifícios com altura            │
│                                                             │
│  3. MODELAÇÃO 3D                                           │
│     ├── Qgis2threejs (visualização web)                    │
│     ├── BlenderGIS (modelo detalhado)                      │
│     └── Exportar STL/OBJ                                   │
│                                                             │
│  4. IMPRESSÃO 3D                                           │
│     ├── Preparar ficheiro (escala, base)                   │
│     ├── Imprimir (Fablab ou serviço online)                │
│     └── Pós-processamento (pintura opcional)               │
│                                                             │
│  5. DOCUMENTAÇÃO                                           │
│     ├── Fotografias do modelo                              │
│     ├── Vídeo 360° do modelo digital                       │
│     └── Artigo blog com tutorial                           │
│                                                             │
│  6. OUTREACH                                               │
│     ├── Contactar câmara municipal                         │
│     ├── Propor oferta do modelo                            │
│     └── LinkedIn post                                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

#### 4.1.4. Ferramentas

| Ferramenta | Uso |
|------------|-----|
| **QGIS** | Processamento inicial, recorte |
| **Qgis2threejs** | Visualização 3D web, exportação |
| **Blender + BlenderGIS** | Modelação detalhada (opcional) |
| **MeshLab** | Simplificação de malha |
| **Cura / PrusaSlicer** | Preparação para impressão |

#### 4.1.5. Especificações do Modelo

| Parâmetro | Valor |
|-----------|-------|
| Escala | 1:1000 ou 1:2000 |
| Dimensões físicas | ~20×20 cm |
| Exagero vertical | 1.5× a 2× |
| Material | PLA (impressão FDM) |
| Resolução | 0.2mm layer height |
| Tempo impressão | ~10-20 horas |

#### 4.1.6. Qgis2threejs - Configuração

```python
# Configuração típica para modelo 3D
settings = {
    'dem_layer': 'mdt_lidar',
    'dem_resolution': 2,  # metros
    'vertical_exaggeration': 1.5,
    'buildings_layer': 'edificios',
    'building_height_field': 'altura',
    'base_height': 10,  # metros de base
    'export_format': 'glTF'  # ou STL
}
```

---

### 4.2. NT-06 - Villa Romana 3D (PS-03)

| Campo | Valor |
|-------|-------|
| **ID** | NT-06 / PS-03 |
| **Tipo** | **Projecto** |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop |
| **Origem** | PS-03 |

#### 4.2.1. Conceito

Criar uma **reconstrução 3D** de uma villa romana da região para visualização e divulgação arqueológica.

**Diferença do NT-05:** Este projecto é uma **reconstrução hipotética** baseada em plantas arqueológicas, não um modelo do estado actual.

#### 4.2.2. Villae Romanas na Região

| Sítio | Concelho | Estado | Dados |
|-------|----------|--------|-------|
| Villa de Cardílio | Torres Novas | Escavada, musealizada | Plantas disponíveis |
| Outras villae | A investigar | Variável | A investigar |

#### 4.2.3. Workflow

```
1. INVESTIGAÇÃO
   ├── Obter plantas arqueológicas
   ├── Pesquisar paralelos (outras villae)
   └── Definir elementos a reconstruir

2. MODELAÇÃO
   ├── Criar planta base (2D)
   ├── Extrudir paredes
   ├── Adicionar telhados
   ├── Texturizar
   └── Adicionar elementos (colunas, mosaicos)

3. VISUALIZAÇÃO
   ├── Renderização estática
   ├── Animação walkthrough
   └── Visualização interactiva (web)

4. COMUNICAÇÃO
   ├── Vídeo explicativo
   ├── Artigo blog
   └── Contacto com museu/câmara
```

#### 4.2.4. Ferramentas

| Ferramenta | Uso |
|------------|-----|
| **Blender** | Modelação e renderização |
| **SketchUp** | Modelação rápida (alternativa) |
| **Three.js** | Visualização web |
| **Unity/Unreal** | Experiência interactiva (avançado) |

---

## 5. Património Cultural

### 5.1. Inventário de Património

**Objectivo:** Criar inventário georreferenciado do património da região.

**Categorias:**

| Categoria | Exemplos |
|-----------|----------|
| **Religioso** | Igrejas, capelas, conventos |
| **Militar** | Castelos, muralhas, torres |
| **Civil** | Solares, pontes, aquedutos |
| **Arqueológico** | Villae, castros, dólmens |
| **Industrial** | Moinhos, lagares, fábricas |
| **Natural** | Grutas, formações geológicas |
| **Vernacular** | Aldeias, arquitectura tradicional |

**Fontes de dados:**

| Fonte | URL | Tipo |
|-------|-----|------|
| DGPC (SIPA) | monumentos.gov.pt | Classificados |
| Turismo de Portugal | visitportugal.com | Turístico |
| Câmaras Municipais | Sites locais | Local |
| OpenStreetMap | osm.org | Colaborativo |
| Wikipedia | pt.wikipedia.org | Informação |

### 5.2. Integração com Outros Núcleos

O património está presente em vários núcleos:

| Núcleo | Património Relacionado |
|--------|----------------------|
| **Cársico** | Grutas, Polje de Minde |
| **Hídrico** | Paul do Boquilobo (RAMSAR) |
| **Urbano** | Centros históricos |
| **Agrícola** | Paisagem cultural da Lezíria |

---

## 6. Dados e Fontes

### 6.1. Dados Vectoriais

| Dado | Fonte | Formato |
|------|-------|---------|
| Percursos pedestres | OSM | Vector |
| Miradouros | OSM | Pontos |
| Património classificado | DGPC | Vector |
| Edifícios | OSM / DGT | Vector |
| Rede viária | OSM | Vector |

### 6.2. Dados Raster

| Dado | Fonte | Resolução | Uso |
|------|-------|-----------|-----|
| MDT LiDAR | DGT | 2m | Modelos 3D, viewshed |
| Ortofotomapas | DGT | 25-50cm | Contexto, texturas |
| Hillshade | Derivado | 2m | Visualização |

### 6.3. Outras Fontes

| Fonte | Tipo | Uso |
|-------|------|-----|
| Wikiloc | GPX tracks | Percursos populares |
| Google Street View | Imagens | Validação, fotos |
| Arquivos municipais | Documentos | História, plantas |
| IPPAR/DGPC | Fichas | Informação património |

---

## 7. Metodologias

### 7.1. Viewshed Analysis

```python
import richdem as rd
import numpy as np

def calculate_viewshed(dem, observer_point, observer_height=1.7, 
                       target_height=0, max_distance=None):
    """
    Calcula viewshed a partir de um ponto.
    
    Args:
        dem: Array do MDT
        observer_point: (row, col) do observador
        observer_height: Altura do observador (m)
        target_height: Altura do alvo (m)
        max_distance: Distância máxima de análise (m)
    
    Returns:
        Array binário (1=visível, 0=não visível)
    """
    rows, cols = dem.shape
    viewshed = np.zeros_like(dem, dtype=np.uint8)
    
    obs_row, obs_col = observer_point
    obs_elevation = dem[obs_row, obs_col] + observer_height
    
    for r in range(rows):
        for c in range(cols):
            if r == obs_row and c == obs_col:
                viewshed[r, c] = 1
                continue
            
            # Calcular linha de visão
            target_elevation = dem[r, c] + target_height
            
            # Verificar se há obstrução
            is_visible = check_line_of_sight(
                dem, 
                (obs_row, obs_col, obs_elevation),
                (r, c, target_elevation)
            )
            
            viewshed[r, c] = 1 if is_visible else 0
    
    return viewshed
```

### 7.2. Extracção de Percursos OSM

```python
import osmnx as ox
import geopandas as gpd

def extract_hiking_trails(place_name, buffer_m=1000):
    """
    Extrai trilhos pedestres do OpenStreetMap.
    """
    # Tags relevantes
    tags = {
        'highway': ['path', 'footway', 'track', 'bridleway'],
        'route': 'hiking'
    }
    
    # Extrair
    trails = ox.features_from_place(place_name, tags=tags)
    
    # Filtrar e limpar
    trails = trails[trails.geometry.type.isin(['LineString', 'MultiLineString'])]
    
    # Adicionar comprimento
    trails['length_km'] = trails.geometry.length / 1000
    
    return trails
```

### 7.3. Preparação para Impressão 3D

```python
def prepare_dem_for_3d_print(dem, scale=1000, vertical_exag=1.5, 
                              base_height_mm=10, resolution_mm=0.2):
    """
    Prepara MDT para impressão 3D.
    
    Args:
        dem: Array do MDT (metros)
        scale: Escala do modelo (1:scale)
        vertical_exag: Exagero vertical
        base_height_mm: Altura da base em mm
        resolution_mm: Resolução vertical da impressora
    
    Returns:
        Array preparado para exportação STL
    """
    # Converter para escala do modelo
    dem_scaled = dem / scale * 1000  # metros → mm
    
    # Aplicar exagero vertical
    dem_exag = dem_scaled * vertical_exag
    
    # Normalizar (mínimo = 0)
    dem_norm = dem_exag - dem_exag.min()
    
    # Adicionar base
    dem_with_base = dem_norm + base_height_mm
    
    # Quantizar para resolução da impressora
    dem_quantized = np.round(dem_with_base / resolution_mm) * resolution_mm
    
    return dem_quantized
```

---

## 8. Implementação Técnica

### 8.1. Estrutura de Ficheiros

```
projects/nucleo-turismo-patrimonio/
│
├── README.md
├── followup.md
│
├── percursos/                          # NT-01
│   ├── data/
│   │   ├── osm_trails.gpkg
│   │   └── pr_trails.gpkg
│   ├── notebooks/
│   │   └── extract_trails.ipynb
│   └── outputs/
│       └── trails_webgis.geojson
│
├── miradouros/                         # NT-02, NT-03, NT-04
│   ├── data/
│   │   └── viewpoints.gpkg
│   ├── notebooks/
│   │   ├── existing_viewpoints.ipynb
│   │   └── potential_viewpoints.ipynb
│   └── outputs/
│       ├── viewpoints.geojson
│       └── viewsheds/
│
├── aldeia-3d/                          # NT-05 / PS-02
│   ├── README.md
│   ├── followup.md
│   ├── data/
│   │   ├── mdt_clip.tif
│   │   └── buildings.gpkg
│   ├── qgis/
│   │   └── aldeia_3d.qgz
│   ├── models/
│   │   ├── aldeia.stl
│   │   ├── aldeia.obj
│   │   └── aldeia.gltf
│   ├── renders/
│   │   └── preview.png
│   └── print/
│       └── aldeia_print_ready.stl
│
└── villa-romana/                       # NT-06 / PS-03
    ├── README.md
    ├── data/
    │   └── plantas/
    ├── blender/
    │   └── villa.blend
    ├── renders/
    └── web/
        └── viewer/
```

### 8.2. Dependências entre Projectos

```
PB-00 (MDT LiDAR)
    │
    ├── NT-03 (Miradouros potenciais)
    │       │
    │       └── Viewshed analysis
    │
    ├── NT-04 (Viewsheds turísticos)
    │
    └── NT-05 (Aldeia 3D)
            │
            └── Modelo para impressão

OSM
    │
    ├── NT-01 (Percursos pedestres)
    │
    └── NT-02 (Miradouros existentes)
```

---

## 9. Outputs e Entregas

### 9.1. WebGIS Turístico

**URL:** `turismo.meudominio.pt` ou `meudominio.pt/webgis/turismo/`

**Funcionalidades:**
- Mapa de percursos pedestres com filtros
- Miradouros (existentes e potenciais)
- Fichas de cada POI
- Perfis de elevação de percursos
- Integração com outros núcleos

### 9.2. Modelo 3D Aldeia

**Entregas:**
- Ficheiro STL para impressão
- Modelo web interactivo (Three.js/Qgis2threejs)
- Modelo físico impresso (oferecer a autarquia)
- Vídeo de apresentação
- Tutorial no blog

### 9.3. Camadas Publicadas

| Camada | Tipo | Formato |
|--------|------|---------|
| Percursos pedestres | Vector | PostGIS → Martin |
| Miradouros | Vector | PostGIS → Martin |
| Viewsheds | Raster | COG → TiTiler |
| Património | Vector | PostGIS → Martin |

### 9.4. Dados para Download

```
turismo-patrimonio-dados-v1.0.zip
├── README.md
├── LICENSE (CC BY 4.0)
├── vector/
│   ├── percursos.gpkg
│   ├── miradouros.gpkg
│   └── patrimonio.gpkg
├── raster/
│   └── viewsheds/
└── 3d/
    └── aldeia.stl
```

---

## 10. Comunicação e Outreach

### 10.1. LinkedIn Post - Aldeia 3D

**Headline:** "Perpetuar a memória de uma aldeia abandonada: imprimi-a em 3D 🏘️"

**Body:**
```
Há várias formas de preservar a memória das aldeias 
abandonadas do interior de Portugal. Esta é uma delas.

Usei dados LiDAR de alta resolução para criar um modelo 3D 
da aldeia de [Nome], e depois imprimi-o.

O processo:
1️⃣ Download do MDT LiDAR (2m resolução)
2️⃣ Modelação 3D em QGIS + Qgis2threejs
3️⃣ Preparação do ficheiro STL
4️⃣ Impressão 3D (10 horas!)

O modelo vai ser oferecido à Câmara Municipal de [X].

Tutorial completo no blog: [link]
Ficheiro STL disponível: [link]

#GIS #3DPrinting #Portugal #Património #OpenData
```

**Imagens:**
- Foto do modelo impresso (várias perspectivas)
- Screenshot do modelo digital
- Comparação com ortofotomapa
- Processo de impressão

### 10.2. Outreach - Câmara Municipal

**Template de email:**

```
Assunto: Oferta de modelo 3D da aldeia de [Nome]

Exmos. Senhores,

O meu nome é [Nome] e sou profissional de Sistemas de 
Informação Geográfica.

Criei um modelo 3D impresso da aldeia de [Nome] usando 
dados LiDAR de alta resolução. O modelo tem [X]×[X] cm 
e reproduz fielmente a topografia e os edifícios da aldeia.

Gostaria de oferecer este modelo à Câmara Municipal, 
como contributo para a preservação da memória do 
património local.

Poderiam indicar-me a quem posso fazer a entrega?

Em anexo envio algumas fotografias do modelo.

Fico ao dispor para qualquer esclarecimento.

Com os melhores cumprimentos,
[Assinatura]
```

### 10.3. Artigo Blog - Tutorial 3D

**Título:** "Como criar um modelo 3D imprimível de qualquer terreno usando dados abertos"

**Secções:**
1. Introdução - Para que serve?
2. Dados necessários (LiDAR Portugal)
3. Processamento em QGIS
4. Exportação com Qgis2threejs
5. Preparação para impressão
6. Impressão e pós-processamento
7. Resultados e dicas
8. Ficheiros e recursos

### 10.4. Contactos Potenciais

| Entidade | Interesse | Timing |
|----------|-----------|--------|
| CM onde está a aldeia | Oferta do modelo | Após impressão |
| Rede Aldeias do Xisto | Promoção | Fase 4 |
| Museu local | Exposição | Fase 4 |
| Escolas locais | Educação | Se interesse |

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Dados base (MDT) - PB-00 |
| `08_NUCLEO_URBANO.md` | Viewshed urbano (NU-01) |
| `09_NUCLEO_CARSICO.md` | Percursos no Polje |
| `13_BIBLIOGRAFIA.md` | Referências sobre turismo |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Conceito em 04_BACKLOG |
| 2025-01-28 | 2.0 | Documento completo, 6 projectos detalhados, workflow impressão 3D |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
