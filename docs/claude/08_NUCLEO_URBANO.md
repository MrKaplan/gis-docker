# 08 - NÚCLEO URBANO

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Conceito: Atlas Urbano Interactivo](#2-conceito-atlas-urbano-interactivo)
3. [Projectos do Núcleo](#3-projectos-do-núcleo)
4. [Ferramentas Interactivas](#4-ferramentas-interactivas)
5. [Dados e Fontes](#5-dados-e-fontes)
6. [Metodologias](#6-metodologias)
7. [Implementação Técnica](#7-implementação-técnica)
8. [Outputs e Entregas](#8-outputs-e-entregas)
9. [Comunicação](#9-comunicação)

---

## 1. Visão Geral

### 1.1. Identificação do Núcleo

| Campo | Valor |
|-------|-------|
| **Prefixo** | NU- |
| **Nome** | Núcleo Urbano |
| **Emoji** | 🏙️ |
| **Área Geográfica** | Tomar / Abrantes (perímetros urbanos e envolvente) |
| **Área aproximada** | ~50 km² (perímetros urbanos) |
| **Anchor Project** | NU-00 - Atlas Urbano Interactivo |

### 1.2. Contexto Territorial

O Núcleo Urbano centra-se nas **duas principais cidades da área de estudo**:

- **Tomar:** ~20.000 hab., Património UNESCO (Convento de Cristo), turismo
- **Abrantes:** ~18.000 hab., centro industrial, rio Tejo

### 1.3. Relevância

| Aspecto | Descrição |
|---------|-----------|
| **Mobilidade** | Acessibilidade a serviços, transportes públicos |
| **Qualidade de vida** | Walkability, espaços verdes, ruído |
| **Planeamento** | Apoio a decisões urbanísticas |
| **Economia** | Análise de localização, áreas de influência |
| **Sustentabilidade** | Cidade dos 15 minutos, mobilidade suave |

### 1.4. Temas Principais

- Acessibilidade e mobilidade
- Walkability e cidade dos 15 minutos
- Análise de serviços e equipamentos
- Planeamento urbano e expansão
- Qualidade ambiental urbana (ruído, calor, sombras)
- Análise económica e imobiliária

---

## 2. Conceito: Atlas Urbano Interactivo

### 2.1. Ideia Central

O **NU-00 - Atlas Urbano Interactivo** é um dos 5 **Anchor Projects** do portfolio. Pretende criar um dashboard/WebGIS que integre múltiplas análises urbanas num único ponto de acesso:

- Ferramentas de isócronas interactivas
- Índice de walkability por zona
- Análise de vistas (viewshed)
- Acesso a serviços e equipamentos
- Indicadores de qualidade urbana

### 2.2. Estrutura do Atlas

```
ATLAS URBANO INTERACTIVO
│
├── 🚶 Mobilidade e Acessibilidade
│   ├── Isócronas (a pé, bici, carro) → NU-05
│   ├── Walkshed interactivo → NU-08
│   ├── Travel Time → NU-12
│   └── Transportes públicos (se GTFS disponível)
│
├── 📍 Acesso a Serviços
│   ├── Food Deserts → NU-15
│   ├── Distance to Healthcare → NU-16
│   ├── Market Share / Trade Areas → NU-19
│   └── Suitability infraestrutura → NU-21
│
├── 🏗️ Planeamento
│   ├── Building Constraints → NU-11
│   ├── Expansão Urbana (suitability) → NU-13
│   ├── LUCIS (conflitos uso solo) → NU-14
│   └── Space Syntax → NU-10
│
├── 🌳 Qualidade Urbana
│   ├── Noise Exposure → NU-02
│   ├── Solar Exposure → NU-03
│   ├── Shadow Analysis → NU-04
│   ├── Green Roofs Potential → NU-07
│   └── Sky View Factor → NU-18
│
└── 👁️ Análise Visual
    ├── Viewshed / Line of Sight → NU-01
    ├── 3D Viewshed → NU-09
    └── Property Index → NU-20
```

### 2.3. Público-Alvo

| Público | Interesse |
|---------|-----------|
| Técnicos municipais | Planeamento, análise de propostas |
| Cidadãos | Explorar a sua cidade, participação |
| Investidores/Promotores | Localização, análise de mercado |
| Investigadores | Dados e metodologias |
| Turistas | Acessibilidade, percursos |

---

## 3. Projectos do Núcleo

### 3.1. Tabela Resumo

| ID | Nome | Tipo | Proc. | Prior. | Origem |
|----|------|------|-------|--------|--------|
| **NU-00** | ⭐ Atlas Urbano Interactivo | P | 🌐 | 🔴 | Conceito integrador |
| NU-01 | Viewshed / Line of Sight | A+C | 🖥️→🌐 | 🟡 | #65 |
| NU-02 | Noise Exposure | C | 🖥️→🌐 | 🟢 | #66 |
| NU-03 | Solar Exposure | C | 🖥️→🌐 | 🟡 | #69 |
| NU-04 | Shadow Analysis | C | 🖥️→🌐 | 🟢 | #72 |
| **NU-05** | **Service Areas (Isócronas)** | **F** | 🌐 | 🔴 | #579 |
| NU-06 | Landfill Suitability | A | 🖥️→🌐 | 🟢 | #583 |
| NU-07 | Green Roofs Potential | C | 🖥️→🌐 | 🟢 | #585 |
| **NU-08** | **Walkshed** | **F** | 🌐 | 🔴 | #596 |
| NU-09 | 3D Viewshed | A | 🖥️→🌐 | 🟡 | #597 |
| NU-10 | Space Syntax | A+C | 🖥️→🌐 | 🟡 | #602 |
| NU-11 | Building Constraints | C | 🖥️→🌐 | 🟡 | #606 |
| **NU-12** | **Travel Time** | **F** | 🌐 | 🟡 | #132 |
| NU-13 | Expansão Urbana (suitability) | C | 🖥️→🌐 | 🟡 | #575 |
| NU-14 | LUCIS (conflitos uso solo) | C | 🖥️→🌐 | 🟡 | #576 |
| NU-15 | Food Deserts | C | 🌐 | 🟡 | #578 |
| NU-16 | Distance to Healthcare | C | 🌐 | 🟡 | #474 |
| NU-17 | Cluster Analysis (saúde) | A | 🖥️→🌐 | 🟢 | #477 |
| NU-18 | Sky View Factor | C | 🖥️→🌐 | 🟢 | #295 |
| NU-19 | Market Share / Trade Area | A+C | 🌐 | 🟡 | #134, #332 |
| NU-20 | Property Index | C | 🖥️→🌐 | 🟢 | #148 |
| NU-21 | Suitability Infraestrutura Regional | A | 🖥️→🌐 | 🟡 | Novo |

**Legenda:**
- **Tipo:** F=Ferramenta, P=Projecto, C=Camada, A=Análise
- **Proc.:** 🌐=Online, 🖥️=Desktop, 🌍=GEE
- **Prior.:** 🔴=Alta, 🟡=Média, 🟢=Baixa

---

### 3.2. NU-01 - Viewshed / Line of Sight

| Campo | Valor |
|-------|-------|
| **ID** | NU-01 |
| **Tipo** | Análise + Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #65 |
| **Dependências** | PB-00 (MDT LiDAR) |

**Objectivo:** Calcular áreas visíveis a partir de pontos de interesse.

**Aplicações:**
- Miradouros existentes e potenciais
- Impacto visual de novas construções
- Análise imobiliária (vistas)

**Metodologia:**
```python
# Viewshed básico
import richdem as rd

def calculate_viewshed(dem, observer_point, observer_height=1.7):
    """
    Calcula área visível a partir de um ponto.
    
    Args:
        dem: Modelo digital de terreno
        observer_point: (x, y) coordenadas do observador
        observer_height: Altura do observador (metros)
    """
    # Implementar algoritmo de viewshed
    # r3.los (GRASS) ou richdem/GDAL
    pass
```

**Outputs:**
- Raster binário (visível/não visível)
- Mapa de profundidade de visão
- Estatísticas de área visível

---

### 3.3. NU-02 - Noise Exposure

| Campo | Valor |
|-------|-------|
| **ID** | NU-02 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #66 |

**Objectivo:** Estimar exposição ao ruído com base em fontes conhecidas.

**Metodologia simplificada:**
```
Ruído = f(Distância_vias, Categoria_via, Indústria, Aeroporto)

Atenuação com distância:
L(d) = L0 - 20×log10(d/d0) - α×(d-d0)

Onde:
L0 = Nível na fonte
d = Distância
α = Coeficiente de absorção
```

**Fontes de ruído:**
- Vias rodoviárias (por categoria: AE, EN, EM, local)
- Zonas industriais
- Aeródromo (se aplicável)

**Outputs:**
- Mapa de exposição ao ruído (classes dB)
- Sobreposição com zonas residenciais
- Estatísticas de população afectada

**Limitações:** Modelo simplificado, não considera topografia, edifícios.

---

### 3.4. NU-03 - Solar Exposure

| Campo | Valor |
|-------|-------|
| **ID** | NU-03 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #69 |
| **Dependências** | PB-00 (MDT) |

**Objectivo:** Calcular radiação solar incidente considerando topografia.

**Metodologia:**
```python
# r.sun (GRASS) ou equivalente Python
# Considera: latitude, época do ano, declive, exposição, sombras

def calculate_solar_radiation(dem, date, time_step=0.5):
    """
    Calcula radiação solar diária/anual.
    """
    # Direct beam, diffuse, reflected
    pass
```

**Outputs:**
- Mapa de radiação solar anual (kWh/m²)
- Mapa de horas de sol por dia (média)
- Potencial fotovoltaico

**Aplicações:**
- Localização de painéis solares
- Conforto térmico urbano
- Planeamento de espaços públicos

---

### 3.5. NU-04 - Shadow Analysis

| Campo | Valor |
|-------|-------|
| **ID** | NU-04 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #72 |
| **Dependências** | Edifícios 3D (se disponível) |

**Objectivo:** Analisar sombras projectadas por edifícios.

**Dados necessários:**
- MDT LiDAR
- Edifícios com altura (OSM ou digitalização)

**Análise:**
- Sombras em diferentes horas/épocas
- Impacto de novos edifícios
- Horas de sol em espaços públicos

**Limitações:** Requer dados de altura de edifícios.

---

### 3.6. NU-05 - Service Areas (Isócronas) ⭐

| Campo | Valor |
|-------|-------|
| **ID** | NU-05 |
| **Tipo** | **Ferramenta** |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌐 Online |
| **Origem** | #579 |
| **Dependências** | pgRouting, OSM |

**Ver secção 4 para implementação detalhada.**

Esta é uma das ferramentas mais diferenciadores — isócronas interactivas em tempo real.

---

### 3.7. NU-06 - Landfill Suitability

| Campo | Valor |
|-------|-------|
| **ID** | NU-06 |
| **Tipo** | Análise |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #583 |

**Objectivo:** Análise multicritério para localização de aterros/infraestruturas.

**Critérios típicos:**
```
Aptidão = f(Geologia, Distância_água, Distância_urbano, 
            Declive, Acessibilidade, REN/RAN)

Critérios de exclusão:
- REN, RAN, Áreas Protegidas
- < 500m de habitações
- < 200m de linhas de água
- Aquíferos vulneráveis

Critérios de ponderação:
- Geologia favorável
- Acessibilidade viária
- Distância a centros urbanos
```

**Metodologia:** AHP (Analytic Hierarchy Process) ou WLC (Weighted Linear Combination)

---

### 3.8. NU-07 - Green Roofs Potential

| Campo | Valor |
|-------|-------|
| **ID** | NU-07 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #585 |

**Objectivo:** Identificar edifícios com potencial para telhados verdes.

**Critérios:**
```
Potencial = f(Área_cobertura, Declive_cobertura, 
              Exposição_solar, Tipo_edifício)

Favorável:
- Coberturas planas ou pouco inclinadas
- Área > 50 m²
- Edifícios públicos, comerciais, industriais
```

**Dados necessários:**
- Polígonos de edifícios com área
- LiDAR para declive de coberturas (se disponível)

---

### 3.9. NU-08 - Walkshed ⭐

| Campo | Valor |
|-------|-------|
| **ID** | NU-08 |
| **Tipo** | **Ferramenta** |
| **Prioridade** | 🔴 Alta |
| **Processamento** | 🌐 Online |
| **Origem** | #596 |
| **Dependências** | pgRouting, OSM |

**Ver secção 4 para implementação detalhada.**

Walkshed é essencialmente uma isócrona a pé, mas com foco na análise de walkability.

---

### 3.10. NU-09 - 3D Viewshed

| Campo | Valor |
|-------|-------|
| **ID** | NU-09 |
| **Tipo** | Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #597 |
| **Dependências** | MDT + edifícios 3D |

**Objectivo:** Viewshed considerando obstruções por edifícios.

**Diferença para NU-01:** Inclui edifícios como obstáculos, não apenas terreno.

**Aplicações:**
- Análise de impacto visual em contexto urbano
- Privacidade entre edifícios
- Vistas de apartamentos

---

### 3.11. NU-10 - Space Syntax

| Campo | Valor |
|-------|-------|
| **ID** | NU-10 |
| **Tipo** | Análise + Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #602 |

**Objectivo:** Analisar configuração espacial da rede viária usando Space Syntax.

**Métricas:**
```
Integration: Acessibilidade global (menos mudanças de direcção)
Choice: Probabilidade de passagem (betweenness)
Connectivity: Número de conexões directas
```

**Ferramentas:**
- depthmapX (open source)
- Exportar para QGIS/PostGIS

**Outputs:**
- Mapa de integration (centralidade)
- Mapa de choice (fluxos potenciais)
- Correlação com dados reais de peões (se disponíveis)

**Aplicações:**
- Identificar ruas com maior potencial comercial
- Planeamento de percursos pedonais
- Análise de segregação espacial

---

### 3.12. NU-11 - Building Constraints

| Campo | Valor |
|-------|-------|
| **ID** | NU-11 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #606 |

**Objectivo:** Mapear condicionantes à construção.

**Camadas a sobrepor:**
- REN (Reserva Ecológica Nacional)
- RAN (Reserva Agrícola Nacional)
- Domínio Público Hídrico
- Servidões (aeroporto, linhas eléctricas, etc.)
- Zonamento PDM (se disponível)
- Áreas protegidas

**Outputs:**
- Mapa de "semáforo" (verde/amarelo/vermelho)
- Número de condicionantes por local
- Ferramenta de consulta por parcela

---

### 3.13. NU-12 - Travel Time ⭐

| Campo | Valor |
|-------|-------|
| **ID** | NU-12 |
| **Tipo** | **Ferramenta** |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌐 Online |
| **Origem** | #132 |
| **Dependências** | pgRouting, OSM |

**Ver secção 4 para implementação.**

Calcula tempo de viagem entre dois pontos, complementar às isócronas.

---

### 3.14. NU-13 - Expansão Urbana (Suitability)

| Campo | Valor |
|-------|-------|
| **ID** | NU-13 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #575 |

**Objectivo:** Identificar áreas com aptidão para expansão urbana.

**Critérios:**
```
Aptidão = f(Proximidade_urbano, Acessibilidade, Declive, 
            Ausência_condicionantes, Infraestruturas)

Factores positivos:
+ Adjacente a perímetro urbano
+ Acesso viário
+ Declive < 15%
+ Infraestruturas próximas

Factores negativos:
- REN, RAN
- Áreas protegidas
- Risco de cheia
- Solo agrícola de alta qualidade
```

---

### 3.15. NU-14 - LUCIS (Conflitos Uso Solo)

| Campo | Valor |
|-------|-------|
| **ID** | NU-14 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #576 |

**Objectivo:** Aplicar metodologia LUCIS para identificar conflitos de uso do solo.

**LUCIS (Land Use Conflict Identification Strategy):**
```
Para cada célula, calcular aptidão para:
- Uso Urbano
- Uso Agrícola
- Uso Conservação

Conflito = quando múltiplas aptidões são altas
```

**Outputs:**
- Mapa de aptidão urbana
- Mapa de aptidão agrícola
- Mapa de aptidão conservação
- Mapa de conflitos

---

### 3.16. NU-15 - Food Deserts

| Campo | Valor |
|-------|-------|
| **ID** | NU-15 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌐 Online |
| **Origem** | #578 |
| **Dependências** | NU-05 (Isócronas), POIs |

**Objectivo:** Identificar áreas com acesso limitado a alimentação.

**Metodologia:**
```
Food Desert = Área sem supermercado/mercearia a < 10 min a pé

1. Extrair POIs de alimentação do OSM
2. Calcular isócronas de 10 min a pé para cada POI
3. Identificar áreas não cobertas
4. Sobrepor com população/habitações
```

**Outputs:**
- Mapa de cobertura de serviços alimentares
- Identificação de food deserts
- Estatísticas de população afectada

---

### 3.17. NU-16 - Distance to Healthcare

| Campo | Valor |
|-------|-------|
| **ID** | NU-16 |
| **Tipo** | Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌐 Online |
| **Origem** | #474 |
| **Dependências** | NU-05 (Isócronas), POIs saúde |

**Objectivo:** Mapear acessibilidade a serviços de saúde.

**Análise por tipo:**
- Farmácias (5 min a pé)
- Centros de saúde (15 min a pé/carro)
- Hospitais (30 min de carro)
- Urgências (tempo crítico)

**Outputs:**
- Mapa de cobertura por tipo de serviço
- Áreas deficitárias
- Recomendações de localização

---

### 3.18. NU-17 - Cluster Analysis (Saúde)

| Campo | Valor |
|-------|-------|
| **ID** | NU-17 |
| **Tipo** | Análise |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #477 |

**Objectivo:** Identificar clusters espaciais de indicadores de saúde.

**Dependência:** Dados de saúde georreferenciados (difíceis de obter).

**Metodologia:**
- Hot spot analysis (Getis-Ord Gi*)
- Cluster and outlier analysis (Anselin Local Moran's I)

**Nota:** Apenas viável se dados disponíveis.

---

### 3.19. NU-18 - Sky View Factor

| Campo | Valor |
|-------|-------|
| **ID** | NU-18 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #295 |

**Objectivo:** Calcular o Sky View Factor (SVF) para análise de microclimas urbanos.

**SVF:** Proporção do céu visível de um ponto (0-1).

**Aplicações:**
- Ilhas de calor urbano
- Ventilação urbana
- Conforto térmico

**Dados:** MDT + edifícios 3D

---

### 3.20. NU-19 - Market Share / Trade Area

| Campo | Valor |
|-------|-------|
| **ID** | NU-19 |
| **Tipo** | Análise + Camada |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🌐 Online |
| **Origem** | #134, #332 |
| **Dependências** | Isócronas, população |

**Objectivo:** Definir áreas de influência comercial.

**Metodologias:**
```
1. Thiessen/Voronoi: Área mais próxima (simples)
2. Huff Model: Probabilidade baseada em distância + atractividade
3. Isócronas: Área acessível em X minutos
```

**Aplicações:**
- Localização de novos negócios
- Análise de concorrência
- Estimativa de clientes potenciais

---

### 3.21. NU-20 - Property Index

| Campo | Valor |
|-------|-------|
| **ID** | NU-20 |
| **Tipo** | Camada |
| **Prioridade** | 🟢 Baixa |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | #148 |

**Objectivo:** Criar índice de atractividade imobiliária (sem preços reais).

**Factores:**
```
Index = f(Acessibilidade, Serviços, Vistas, Ruído, 
          Solar, Espaços_verdes, Segurança)

Ponderação exemplo:
- Acessibilidade a serviços: 25%
- Qualidade de vistas: 15%
- Exposição solar: 10%
- Exposição ruído: -15%
- Proximidade espaços verdes: 15%
- Qualidade urbana geral: 20%
```

**Limitações:** Índice indicativo, não reflecte preços de mercado.

---

### 3.22. NU-21 - Suitability Infraestrutura Regional

| Campo | Valor |
|-------|-------|
| **ID** | NU-21 |
| **Tipo** | Análise |
| **Prioridade** | 🟡 Média |
| **Processamento** | 🖥️ Desktop → 🌐 Online |
| **Origem** | Novo |

**Objectivo:** Análise multicritério para localização de infraestruturas regionais.

**Exemplos:**
- Nova escola secundária
- Novo centro de saúde
- Hipermercado
- Parque empresarial

**Metodologia:** AHP com critérios específicos por tipo de infraestrutura.

---

## 4. Ferramentas Interactivas

### 4.1. NU-05 - Isócronas Interactivas

#### 4.1.1. Conceito

**O que é:**
- Utilizador clica num ponto ou selecciona um destino
- Selecciona modo de transporte (a pé, bici, carro)
- Selecciona tempo (5, 10, 15, 30 min)
- Sistema mostra área alcançável

**Porquê diferenciador:**
- Interactividade real
- Múltiplos modos de transporte
- Aplicação prática (onde viver, onde abrir negócio)

#### 4.1.2. Arquitectura

```
┌─────────────────┐
│    FRONTEND     │
│  (Leaflet map)  │
│                 │
│  Click + Params │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   PYTHON API    │
│   (FastAPI)     │
│                 │
│ /api/isochrone  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   PGROUTING     │
│                 │
│ pgr_drivingDist │
│ OSM network     │
└─────────────────┘
```

#### 4.1.3. Implementação - Backend

```python
# api/routers/mobility.py
from fastapi import APIRouter, Query
import geopandas as gpd
from sqlalchemy import text

router = APIRouter(prefix="/api/mobility", tags=["mobility"])

@router.get("/isochrone")
async def get_isochrone(
    lon: float = Query(..., description="Longitude"),
    lat: float = Query(..., description="Latitude"),
    mode: str = Query("walk", description="Mode: walk, bike, car"),
    time_minutes: int = Query(10, description="Time in minutes")
):
    """
    Calcula isócrona a partir de um ponto.
    """
    # Velocidades por modo (km/h)
    speeds = {
        "walk": 5,
        "bike": 15,
        "car": 50
    }
    speed = speeds.get(mode, 5)
    
    # Distância máxima em metros
    max_distance = (speed * 1000 / 60) * time_minutes
    
    # Encontrar nó mais próximo
    nearest_node_query = text("""
        SELECT id FROM ways_vertices_pgr
        ORDER BY the_geom <-> ST_SetSRID(ST_MakePoint(:lon, :lat), 4326)
        LIMIT 1
    """)
    
    # pgr_drivingDistance
    isochrone_query = text("""
        WITH driving AS (
            SELECT * FROM pgr_drivingDistance(
                'SELECT gid as id, source, target, 
                        length_m / :speed * 3.6 as cost
                 FROM ways',
                :node_id,
                :max_cost,
                false
            )
        )
        SELECT ST_ConcaveHull(ST_Collect(v.the_geom), 0.8) as geom
        FROM driving d
        JOIN ways_vertices_pgr v ON d.node = v.id
    """)
    
    # Executar queries e retornar GeoJSON
    # ...
    
    return {
        "type": "Feature",
        "geometry": isochrone_geom,
        "properties": {
            "mode": mode,
            "time_minutes": time_minutes,
            "center": [lon, lat]
        }
    }
```

#### 4.1.4. Implementação - Frontend

```javascript
// js/isochrone.js

const map = L.map('map').setView([39.6, -8.4], 13);

// Controles
const modeSelect = document.getElementById('mode');
const timeSelect = document.getElementById('time');

// Layer para isócrona
const isochroneLayer = L.geoJSON(null, {
    style: function(feature) {
        const colors = {
            5: '#1a9850',
            10: '#91cf60', 
            15: '#d9ef8b',
            30: '#fee08b'
        };
        return {
            color: colors[feature.properties.time_minutes] || '#fc8d59',
            weight: 2,
            fillOpacity: 0.4
        };
    }
}).addTo(map);

// Click handler
map.on('click', async function(e) {
    const {lat, lng} = e.latlng;
    const mode = modeSelect.value;
    const time = parseInt(timeSelect.value);
    
    showLoading();
    
    const response = await fetch(
        `/api/mobility/isochrone?lon=${lng}&lat=${lat}&mode=${mode}&time_minutes=${time}`
    );
    const isochrone = await response.json();
    
    isochroneLayer.clearLayers();
    isochroneLayer.addData(isochrone);
    
    // Adicionar marcador no centro
    L.marker([lat, lng])
        .bindPopup(`<b>${time} min ${mode}</b>`)
        .addTo(map);
    
    hideLoading();
});
```

### 4.2. NU-08 - Walkshed

Similar às isócronas, mas focado em:
- Apenas modo pedonal
- Considera declive na velocidade
- Pode integrar qualidade do percurso

**Ajuste de velocidade por declive:**
```python
def adjust_speed_for_slope(base_speed, slope_percent):
    """
    Ajusta velocidade pedonal com base no declive.
    Tobler's hiking function simplificada.
    """
    if slope_percent > 20:
        return base_speed * 0.3
    elif slope_percent > 10:
        return base_speed * 0.6
    elif slope_percent > 5:
        return base_speed * 0.8
    elif slope_percent < -10:
        return base_speed * 1.2  # Descida
    else:
        return base_speed
```

### 4.3. NU-12 - Travel Time

Calcula tempo de viagem entre dois pontos:

```python
@router.get("/travel-time")
async def get_travel_time(
    from_lon: float, from_lat: float,
    to_lon: float, to_lat: float,
    mode: str = "car"
):
    """
    Calcula tempo e rota entre dois pontos.
    """
    # pgr_dijkstra para encontrar caminho mais curto
    route_query = text("""
        SELECT seq, node, edge, cost, agg_cost,
               ST_AsGeoJSON(e.the_geom) as geom
        FROM pgr_dijkstra(
            'SELECT gid as id, source, target, 
                    length_m / :speed * 3.6 as cost
             FROM ways',
            :source_node,
            :target_node,
            false
        ) AS r
        JOIN ways e ON r.edge = e.gid
    """)
    
    return {
        "route": route_geojson,
        "distance_km": total_distance,
        "time_minutes": total_time,
        "mode": mode
    }
```

---

## 5. Dados e Fontes

### 5.1. Dados Base

| Dado | Fonte | Formato | Uso |
|------|-------|---------|-----|
| Rede viária | OSM | PBF → PostGIS | Routing, isócronas |
| Edifícios | OSM | PBF → PostGIS | Sombras, 3D |
| POIs (serviços) | OSM | PBF → PostGIS | Análise de acesso |
| MDT LiDAR | DGT | GeoTIFF | Viewshed, solar |
| Limites administrativos | CAOP | SHP | Estatísticas |
| REN/RAN | CCDR | SHP | Condicionantes |

### 5.2. Dados Adicionais

| Dado | Fonte | Formato | Disponibilidade |
|------|-------|---------|-----------------|
| Censos | INE | Excel/SHP | Pública |
| Equipamentos | DGT/SNIG | SHP | Pública |
| Transportes públicos | Operadores | GTFS | Variável |
| Preços imobiliários | Idealista/CONFIDENCIAL | - | Scraping (ético?) |

### 5.3. Preparação da Rede OSM

```bash
# Download PBF de Portugal
wget https://download.geofabrik.de/europe/portugal-latest.osm.pbf

# Extrair área de estudo
osmium extract -b -8.8,39.3,-8.0,39.8 portugal-latest.osm.pbf -o medio-tejo.osm.pbf

# Importar para PostGIS com osm2pgrouting
osm2pgrouting \
    -f medio-tejo.osm.pbf \
    -c mapconfig.xml \
    -d webgis \
    -U postgres \
    --clean
```

---

## 6. Metodologias

### 6.1. Walkability Index

```python
def calculate_walkability(area_gdf, pois_gdf, network_gdf, dem):
    """
    Calcula índice de walkability para uma área.
    
    Componentes:
    1. Densidade de intersecções (connectivity)
    2. Densidade de destinos (land use mix)
    3. Densidade residencial
    4. Declive médio
    5. Qualidade de passeios (se disponível)
    """
    # 1. Connectivity: intersecções por km²
    intersections = count_intersections(network_gdf, area_gdf)
    connectivity = intersections / area_gdf.area * 1e6
    
    # 2. Land use mix: entropia de usos
    poi_counts = count_pois_by_category(pois_gdf, area_gdf)
    land_use_mix = calculate_entropy(poi_counts)
    
    # 3. Densidade residencial
    residential_density = count_residential(area_gdf) / area_gdf.area
    
    # 4. Declive médio
    mean_slope = calculate_mean_slope(dem, area_gdf)
    slope_factor = 1 - min(mean_slope / 20, 1)  # Penaliza > 20%
    
    # Combinar
    walkability = (
        0.3 * normalize(connectivity) +
        0.3 * land_use_mix +
        0.2 * normalize(residential_density) +
        0.2 * slope_factor
    )
    
    return walkability
```

### 6.2. Space Syntax - Integration

```python
def calculate_integration(graph):
    """
    Calcula integration (closeness centralidade topológica).
    
    Integration = 1 / Mean Depth
    
    Onde Mean Depth é a profundidade média (nº de passos) 
    para todos os outros nós.
    """
    import networkx as nx
    
    # Calcular shortest path lengths
    path_lengths = dict(nx.all_pairs_shortest_path_length(graph))
    
    integration = {}
    n = len(graph.nodes)
    
    for node in graph.nodes:
        # Mean depth
        total_depth = sum(path_lengths[node].values())
        mean_depth = total_depth / (n - 1)
        
        # Integration
        integration[node] = 1 / mean_depth if mean_depth > 0 else 0
    
    return integration
```

### 6.3. Análise Multicritério (AHP)

```python
def ahp_suitability(criteria_rasters, weights, constraints=None):
    """
    Análise multicritério usando AHP simplificado.
    
    Args:
        criteria_rasters: Dict de {nome: raster normalizado 0-1}
        weights: Dict de {nome: peso}
        constraints: Raster binário de exclusão
    
    Returns:
        Raster de aptidão (0-1)
    """
    import numpy as np
    
    # Verificar que pesos somam 1
    assert abs(sum(weights.values()) - 1) < 0.01
    
    # Inicializar resultado
    result = np.zeros_like(list(criteria_rasters.values())[0])
    
    # Combinação linear ponderada
    for name, raster in criteria_rasters.items():
        result += raster * weights[name]
    
    # Aplicar constraints
    if constraints is not None:
        result = np.where(constraints == 1, 0, result)
    
    return result
```

---

## 7. Implementação Técnica

### 7.1. Estrutura de Ficheiros

```
projects/nucleo-urbano-tomar-abrantes/
│
├── README.md
├── followup.md
│
├── config/
│   └── params.yaml
│
├── notebooks/
│   ├── 01_osm_import.ipynb
│   ├── 02_viewshed.ipynb
│   ├── 03_noise.ipynb
│   ├── 04_solar.ipynb
│   ├── 05_isochrones.ipynb
│   ├── 06_walkability.ipynb
│   ├── 07_space_syntax.ipynb
│   ├── 08_constraints.ipynb
│   ├── 09_suitability.ipynb
│   └── 10_dashboard.ipynb
│
├── scripts/
│   ├── osm2pgrouting.sh
│   ├── routing.py
│   ├── isochrone.py
│   ├── walkability.py
│   ├── space_syntax.py
│   └── suitability.py
│
├── data/
│   ├── osm/
│   ├── pois/
│   └── census/
│
└── outputs/
    ├── raster/
    ├── vector/
    └── figures/
```

### 7.2. API Endpoints

```python
# api/routers/urban.py

# Mobilidade
GET /api/mobility/isochrone?lon=X&lat=Y&mode=walk&time=10
GET /api/mobility/travel-time?from_lon=X&from_lat=Y&to_lon=X&to_lat=Y
GET /api/mobility/walkshed?lon=X&lat=Y&time=15

# Análise
GET /api/urban/viewshed?lon=X&lat=Y&height=1.7
GET /api/urban/pois?bbox=X1,Y1,X2,Y2&category=health
GET /api/urban/walkability?area_id=X

# Suitability
GET /api/urban/constraints?lon=X&lat=Y
GET /api/urban/suitability/expansion?bbox=X1,Y1,X2,Y2
```

### 7.3. Dependências entre Projectos

```
PB-00 (MDT LiDAR)
    │
    ├── NU-01 (Viewshed)
    │       │
    │       └── NU-09 (3D Viewshed)
    │
    ├── NU-03 (Solar Exposure)
    │
    └── NU-04 (Shadow Analysis)

OSM + pgRouting
    │
    ├── NU-05 (Isócronas) ★
    │       │
    │       ├── NU-08 (Walkshed) ★
    │       ├── NU-15 (Food Deserts)
    │       ├── NU-16 (Healthcare Access)
    │       └── NU-19 (Trade Areas)
    │
    └── NU-12 (Travel Time) ★

NU-05 + NU-01 + Walkability
    │
    └── NU-00 (Atlas Urbano) ⭐

Condicionantes
    │
    ├── NU-11 (Building Constraints)
    │
    ├── NU-13 (Expansão Urbana)
    │
    └── NU-14 (LUCIS)
```

---

## 8. Outputs e Entregas

### 8.1. Dashboard WebGIS - Atlas Urbano

**URL:** `urbano.meudominio.pt` ou `meudominio.pt/webgis/urbano/`

**Funcionalidades:**
- **Isócronas interactivas** (click + modo + tempo)
- Visualização de walkability por zona
- Acesso a serviços (saúde, comércio, educação)
- Viewshed de pontos seleccionados
- Condicionantes à construção
- Download de dados

### 8.2. Camadas Publicadas

| Camada | Tipo | Actualização | Formato |
|--------|------|--------------|---------|
| Rede viária (routing) | Vector | Anual (OSM update) | PostGIS |
| POIs | Vector | Anual | PostGIS → Martin |
| Walkability por zona | Vector | Estática | PostGIS → Martin |
| Space Syntax | Vector | Estática | PostGIS → Martin |
| Viewshed (pontos fixos) | Raster | Estática | COG → TiTiler |
| Solar exposure | Raster | Estática | COG → TiTiler |
| Condicionantes | Vector | Estática | PostGIS → Martin |
| Suitability expansão | Raster | Estática | COG → TiTiler |

### 8.3. Ferramentas Interactivas

| Ferramenta | Endpoint | Descrição |
|------------|----------|-----------|
| Isócronas | `/api/mobility/isochrone` | Click → área alcançável |
| Walkshed | `/api/mobility/walkshed` | Isócrona pedonal com declive |
| Travel Time | `/api/mobility/travel-time` | Rota entre dois pontos |
| Viewshed | `/api/urban/viewshed` | Área visível de um ponto |
| Constraints | `/api/urban/constraints` | Condicionantes num ponto |

---

## 9. Comunicação

### 9.1. LinkedIn Post - Isócronas

**Headline:** "Onde podes chegar em 15 minutos a pé em Tomar? 🚶"

**Body:**
```
Criei uma ferramenta de isócronas interactivas para as cidades 
do Médio Tejo:

🖱️ Clica em qualquer ponto do mapa
⏱️ Escolhe o tempo (5, 10, 15, 30 min)
🚶🚴🚗 Escolhe o modo (a pé, bici, carro)
📍 Vê exactamente onde consegues chegar

Útil para:
- Escolher onde morar
- Localizar um negócio
- Analisar acessibilidade a serviços

Experimentem em: [link]

Feito com OSM + pgRouting + Python.

#GIS #Urbanismo #Mobilidade #OpenSource #Portugal
```

### 9.2. LinkedIn Post - Cidade 15 Minutos

**Headline:** "Será que Tomar é uma cidade dos 15 minutos? 🏙️"

**Body:**
```
Analisei a acessibilidade pedonal em Tomar usando dados abertos:

📊 X% da população tem acesso a supermercado em 10 min
🏥 X% tem acesso a centro de saúde em 15 min
🏫 X% tem acesso a escola em 10 min
🌳 X% tem acesso a espaço verde em 5 min

O conceito de "cidade dos 15 minutos" aplicado a uma cidade 
média portuguesa.

Dashboard interactivo: [link]

#Urbanismo #CidadeSustentável #GIS #Portugal
```

### 9.3. Artigo Blog

**Título:** "Análise de acessibilidade urbana com pgRouting: isócronas interactivas em Python"

**Secções:**
1. O que são isócronas e para que servem
2. Setup: OSM, PostGIS, pgRouting
3. Cálculo de isócronas com pgr_drivingDistance
4. API com FastAPI
5. Frontend interactivo com Leaflet
6. Aplicações: walkability, food deserts, trade areas
7. Conclusões

### 9.4. Contactos Potenciais

| Entidade | Interesse | Timing |
|----------|-----------|--------|
| CM Tomar | Planeamento, turismo | Fase 3 |
| CM Abrantes | Mobilidade, serviços | Fase 3 |
| Politécnico de Tomar | Investigação | Fase 4 |
| Associações comerciais | Áreas de influência | Fase 4 |

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos |
| `05_PROJECTO_BASE_BIOFISICO.md` | Dados base (MDT) - PB-00 |
| `07_NUCLEO_HIDRICO.md` | Complementar (stormwater) |
| `11_NUCLEO_TURISMO_PATRIMONIO.md` | Complementar (percursos) |
| `12_ANCHOR_PROJECTS.md` | Detalhe do NU-00 como Anchor |
| `13_BIBLIOGRAFIA.md` | Referências e metodologias |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial (conceito em 04_BACKLOG) |
| 2025-01-28 | 2.0 | Documento completo, nomenclatura NU-, 21 projectos detalhados |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
