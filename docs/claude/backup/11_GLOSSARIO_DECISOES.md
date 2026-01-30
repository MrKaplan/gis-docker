# 11 - GLOSSÁRIO DE DECISÕES

## Índice
1. [Sobre Este Documento](#1-sobre-este-documento)
2. [Decisões de Stack](#2-decisões-de-stack)
3. [Decisões de Área de Estudo](#3-decisões-de-área-de-estudo)
4. [Decisões de Projectos](#4-decisões-de-projectos)
5. [Decisões de Processamento](#5-decisões-de-processamento)
6. [Decisões de Comunicação](#6-decisões-de-comunicação)
7. [Decisões Pendentes](#7-decisões-pendentes)
8. [Glossário de Termos](#8-glossário-de-termos)

---

## 1. Sobre Este Documento

### 1.1. Propósito

Documento de **referência rápida** com todas as decisões tomadas durante o planeamento. Útil para:
- Consulta rápida sem ler documentos longos
- Onboarding (relembrar contexto)
- Verificar se uma decisão já foi tomada

### 1.2. Formato

Cada decisão segue o formato:

```
### [ID] Título da Decisão
**Decisão:** O que foi decidido
**Alternativas:** O que foi considerado
**Razão:** Porquê esta escolha
**Doc:** Documento com mais detalhe
```

---

## 2. Decisões de Stack

### D-S01: Abordagem de Containers
**Decisão:** 1 serviço = 1 container
**Alternativas:** Tudo num container, VMs separadas
**Razão:** Isolamento, escalabilidade, fácil manutenção
**Doc:** `01_STACK_TECNICO.md`

---

### D-S02: Base de Dados
**Decisão:** PostgreSQL 16 + PostGIS 3.4 + pgRouting
**Alternativas:** SQLite/SpatiaLite, MongoDB
**Razão:** Standard da indústria, funcionalidades espaciais completas, pgRouting para isócronas
**Doc:** `01_STACK_TECNICO.md`

---

### D-S03: Servidor de Vector Tiles
**Decisão:** Martin (começar só com este)
**Alternativas:** pg_tileserv, t-rex, Tippecanoe
**Razão:** Leve, eficiente, configuração simples
**Doc:** `01_STACK_TECNICO.md`

---

### D-S04: Servidor de Raster Tiles
**Decisão:** TiTiler
**Alternativas:** GeoServer, MapServer, Terracotta
**Razão:** COG/STAC nativo, on-the-fly, não armazena localmente
**Doc:** `01_STACK_TECNICO.md`

---

### D-S05: WMS/WFS
**Decisão:** QGIS Server
**Alternativas:** GeoServer, MapServer
**Razão:** Mais leve que GeoServer, sem JVM, familiaridade com QGIS
**Doc:** `01_STACK_TECNICO.md`

---

### D-S06: API Framework
**Decisão:** FastAPI (Python)
**Alternativas:** Flask, Django, Node.js
**Razão:** Async nativo, documentação automática, Pydantic, performance
**Doc:** `01_STACK_TECNICO.md`

---

### D-S07: Reverse Proxy
**Decisão:** Nginx
**Alternativas:** Traefik, Caddy, HAProxy
**Razão:** Standard, documentação abundante, cache de tiles
**Doc:** `01_STACK_TECNICO.md`

---

### D-S08: NÃO incluir GRASS GIS
**Decisão:** Excluir GRASS GIS do stack
**Alternativas:** Incluir GRASS
**Razão:** Pesado (~2GB), maioria das funções tem equivalente Python (richdem, pysheds)
**Doc:** `01_STACK_TECNICO.md`

---

### D-S09: NÃO incluir SNAP/ESA
**Decisão:** Excluir SNAP Toolbox
**Alternativas:** Incluir SNAP para SAR
**Razão:** 8GB, usar GEE para processamento Sentinel-1 SAR
**Doc:** `01_STACK_TECNICO.md`

---

### D-S10: NÃO incluir R
**Decisão:** Focar só em Python
**Alternativas:** Stack Python + R
**Razão:** Não dispersar esforço, Python faz o mesmo
**Doc:** `01_STACK_TECNICO.md`

---

### D-S11: NÃO incluir TimescaleDB
**Decisão:** Usar PostGIS normal para séries temporais
**Alternativas:** TimescaleDB
**Razão:** Não temos séries de alta frequência, PostGIS é suficiente
**Doc:** `01_STACK_TECNICO.md`

---

### D-S12: Redis Opcional
**Decisão:** Incluir Redis mas como opcional
**Alternativas:** Sempre incluir, nunca incluir
**Razão:** Útil para cache, mas Nginx cache pode ser suficiente inicialmente
**Doc:** `01_STACK_TECNICO.md`

---

### D-S13: Bibliotecas de Hidrologia
**Decisão:** richdem + pysheds
**Alternativas:** GRASS, Whitebox, TauDEM
**Razão:** Python nativo, leves, funcionalidades suficientes
**Doc:** `01_STACK_TECNICO.md`

---

### D-S14: Infraestrutura Cloud
**Decisão:** Oracle Cloud Free Tier (ARM64, 2 OCPU, 12GB RAM, 50GB)
**Alternativas:** AWS, GCP, Azure, VPS pago
**Razão:** Grátis permanente, recursos generosos
**Doc:** `00_VISAO_GERAL.md`

---

## 3. Decisões de Área de Estudo

### D-A01: Região
**Decisão:** Médio Tejo (centro de Portugal)
**Alternativas:** Outras regiões
**Razão:** Conhecimento local, diversidade territorial, dados disponíveis
**Doc:** `03_AREA_ESTUDO.md`

---

### D-A02: Critério de Delimitação
**Decisão:** Bacias hidrográficas completas (não limites administrativos)
**Alternativas:** Concelhos, CIM, buffer
**Razão:** Permite análises hidrológicas "fechadas"
**Doc:** `03_AREA_ESTUDO.md`

---

### D-A03: Bacias Incluídas
**Decisão:** Almonda + Alviela (completas) + Nabão/Zêzere (parciais)
**Alternativas:** Só uma bacia, toda a CIM
**Razão:** Cobertura de Tomar e Castelo de Bode sem área excessiva
**Doc:** `03_AREA_ESTUDO.md`

---

### D-A04: Abordagem de Análise
**Decisão:** Zonas Temáticas (não análise homogénea)
**Alternativas:** Analisar tudo igual, só uma zona
**Razão:** Foco onde faz sentido, eficiência, narrativas distintas
**Doc:** `03_AREA_ESTUDO.md`

---

### D-A05: Zonas Temáticas Definidas
**Decisão:** 4 zonas - Agrícola, Hídrica, Urbana, Cársica
**Alternativas:** Mais zonas, menos zonas
**Razão:** Cobrem diversidade territorial, projectos distintos
**Doc:** `03_AREA_ESTUDO.md`

---

### D-A06: Zona Agrícola - Localização
**Decisão:** Golegã / Paul do Boquilobo
**Alternativas:** Toda a lezíria
**Razão:** Foco em área com Ramsar, interesse ambiental
**Doc:** `03_AREA_ESTUDO.md`, `06_TEMA1_AGRICULTURA.md`

---

### D-A07: Zona Urbana - Cidades
**Decisão:** Tomar + Abrantes
**Alternativas:** Só Tomar, incluir Torres Novas
**Razão:** Dois centros urbanos distintos, análises comparáveis
**Doc:** `03_AREA_ESTUDO.md`

---

### D-A08: Zona Cársica - Foco
**Decisão:** Polje de Minde
**Alternativas:** Toda a Serra de Aire
**Razão:** Fenómeno específico (inundação), bom para StoryMap
**Doc:** `03_AREA_ESTUDO.md`

---

## 4. Decisões de Projectos

### D-P01: Projecto Prioritário
**Decisão:** ZH-00 Caracterização Biofísica (primeiro a fazer)
**Alternativas:** Começar por projecto mais visível
**Razão:** Base para todos os outros, aprende stack
**Doc:** `04_BACKLOG_PROJECTOS.md`, `05_PROJECTO_BASE_BIOFISICO.md`

---

### D-P02: Upstream/Downstream
**Decisão:** Incluir como funcionalidade interactiva (ZH-08)
**Alternativas:** Só camadas estáticas
**Razão:** Diferenciador, demonstra capacidade técnica, útil
**Doc:** `07_TEMA2_AGUA.md`

---

### D-P03: SCIMAP
**Decisão:** Investigar antes de decidir
**Alternativas:** Incluir já, excluir já
**Razão:** Não sabemos se é viável no stack
**Doc:** `07_TEMA2_AGUA.md`, `09_IDEIAS_PENDENTES.md`

---

### D-P04: Precision Farming
**Decisão:** Versão "light" (sem sensores de campo)
**Alternativas:** Excluir, tentar versão completa
**Razão:** Não temos dados de sensores, mas NDVI/SMAP são possíveis
**Doc:** `06_TEMA1_AGRICULTURA.md`

---

### D-P05: Poluição Agrícola
**Decisão:** Índice de risco potencial (não medição real)
**Alternativas:** Tentar medição real
**Razão:** Não temos dados de medição, mas proxies são válidos
**Doc:** `06_TEMA1_AGRICULTURA.md`

---

### D-P06: Oxbows (meandros abandonados)
**Decisão:** Excluir
**Alternativas:** Incluir
**Razão:** Não relevante para a área, baixo interesse
**Doc:** `07_TEMA2_AGUA.md`

---

### D-P07: Aqueduct (WRI)
**Decisão:** Excluir (usar abordagem local)
**Alternativas:** Usar dados WRI Aqueduct
**Razão:** Dados globais menos relevantes que análise local
**Doc:** `07_TEMA2_AGUA.md`

---

### D-P08: StoryMap Polje
**Decisão:** Incluir como projecto standalone (PS-01)
**Alternativas:** Integrar noutro projecto
**Razão:** Narrativa forte, contacto com autarquia, StoryMapJS
**Doc:** `04_BACKLOG_PROJECTOS.md`

---

### D-P09: Aldeia 3D
**Decisão:** Incluir como projecto standalone (PS-02)
**Alternativas:** Adiar
**Razão:** Visual, emocional, bom para comunicação
**Doc:** `04_BACKLOG_PROJECTOS.md`

---

### D-P10: Lixeiras Clandestinas
**Decisão:** Incluir como projecto pessoal (PS-04)
**Alternativas:** Não fazer
**Razão:** Interesse pessoal, trabalho de campo, contacto Limpar Portugal
**Doc:** `04_BACKLOG_PROJECTOS.md`

---

### D-P11: News ON GIS
**Decisão:** Criar série de mini-projectos reactivos
**Alternativas:** Só projectos planeados
**Razão:** Oportunidade de visibilidade, actualidade
**Doc:** `04_BACKLOG_PROJECTOS.md`

---

### D-P12: Erosão - Comparar com REN
**Decisão:** Fazer comparação USLE vs REN
**Alternativas:** Só calcular USLE
**Razão:** Potencial artigo, validação metodológica
**Doc:** `07_TEMA2_AGUA.md`

---

### D-P13: Bacias - Comparar com APA
**Decisão:** Fazer comparação LiDAR vs oficial
**Alternativas:** Só derivar bacias
**Razão:** Potencial artigo, demonstra precisão
**Doc:** `07_TEMA2_AGUA.md`

---

## 5. Decisões de Processamento

### D-PR01: Onde processar séries temporais longas
**Decisão:** Google Earth Engine
**Alternativas:** Servidor próprio
**Razão:** Não sobrecarregar servidor, GEE é grátis e potente
**Doc:** `01_STACK_TECNICO.md`

---

### D-PR02: Onde processar SAR
**Decisão:** Google Earth Engine
**Alternativas:** SNAP local
**Razão:** Evita instalar SNAP (8GB), GEE tem Sentinel-1
**Doc:** `01_STACK_TECNICO.md`

---

### D-PR03: Onde processar LiDAR pesado
**Decisão:** Desktop (offline)
**Alternativas:** Servidor
**Razão:** Pode ser demasiado para VM, QGIS tem boas ferramentas
**Doc:** `01_STACK_TECNICO.md`

---

### D-PR04: Onde fazer HEC-RAS
**Decisão:** Desktop (software standalone)
**Alternativas:** Alternativa Python
**Razão:** HEC-RAS é ferramenta específica com GUI
**Doc:** `01_STACK_TECNICO.md`

---

### D-PR05: Armazenar rasters brutos?
**Decisão:** NÃO - aceder via STAC/COG com TiTiler
**Alternativas:** Download e armazenar
**Razão:** Limite de 50GB, TiTiler serve on-the-fly
**Doc:** `01_STACK_TECNICO.md`

---

### D-PR06: Resolução MDT para desenvolvimento
**Decisão:** 5m (2m para outputs finais)
**Alternativas:** Sempre 2m, sempre 5m
**Razão:** 5m mais leve para testes, 2m para precisão final
**Doc:** `10_PROXIMOS_PASSOS.md`

---

### D-PR07: Formato de rasters para web
**Decisão:** COG (Cloud Optimized GeoTIFF)
**Alternativas:** GeoTIFF normal, MBTiles
**Razão:** TiTiler nativo, range requests, eficiente
**Doc:** `01_STACK_TECNICO.md`

---

### D-PR08: Formato de vectores
**Decisão:** GeoPackage (ficheiros) + PostGIS (BD)
**Alternativas:** Shapefile, GeoJSON
**Razão:** GPKG sem limitações do SHP, PostGIS para queries/tiles
**Doc:** `01_STACK_TECNICO.md`

---

## 6. Decisões de Comunicação

### D-C01: Site Estático
**Decisão:** Hugo
**Alternativas:** Jekyll, Gatsby, WordPress
**Razão:** Rápido, Markdown, themes bonitos, sem BD
**Doc:** `08_PORTFOLIO_COMUNICACAO.md`

---

### D-C02: Língua Principal
**Decisão:** Português (código em Inglês)
**Alternativas:** Tudo inglês, bilingue
**Razão:** Público local, autarquias, SEO em PT
**Doc:** `08_PORTFOLIO_COMUNICACAO.md`

---

### D-C03: Domínio
**Decisão:** Pessoal (nome.pt)
**Alternativas:** Projecto específico (mediotejo-gis.pt)
**Razão:** Mais versátil a longo prazo
**Doc:** `08_PORTFOLIO_COMUNICACAO.md`

---

### D-C04: Frequência LinkedIn
**Decisão:** 1-2 posts por semana
**Alternativas:** Diário, mensal
**Razão:** Consistência sem burnout, qualidade > quantidade
**Doc:** `08_PORTFOLIO_COMUNICACAO.md`

---

### D-C05: Fluxo de Comunicação
**Decisão:** Projecto → LinkedIn → Blog → Portfolio
**Alternativas:** Só LinkedIn, só blog
**Razão:** Maximizar alcance, conteúdo reutilizado
**Doc:** `08_PORTFOLIO_COMUNICACAO.md`

---

### D-C06: Licença de Dados
**Decisão:** CC BY 4.0
**Alternativas:** CC0, MIT, restritiva
**Razão:** Permite uso livre com atribuição
**Doc:** `05_PROJECTO_BASE_BIOFISICO.md`

---

### D-C07: Licença de Código
**Decisão:** MIT
**Alternativas:** GPL, Apache, proprietário
**Razão:** Permissiva, standard, simples
**Doc:** `05_PROJECTO_BASE_BIOFISICO.md`

---

## 7. Decisões Pendentes

| ID | Decisão | Opções | Prazo | Doc |
|----|---------|--------|-------|-----|
| D-P01 | Nome das zonas temáticas | Zonas Temáticas / Núcleos / Áreas | Fase 0 | `09_IDEIAS_PENDENTES.md` |
| D-P02 | Limite oeste exacto | Baseado em bacias | Fase 0 | `03_AREA_ESTUDO.md` |
| D-P03 | SCIMAP viável? | Sim / Não / Alternativa | Fase 2 | `09_IDEIAS_PENDENTES.md` |
| D-P04 | pg_tileserv necessário? | Sim / Não | Fase 2 | `09_IDEIAS_PENDENTES.md` |
| D-P05 | InSAR para subsidência | EGMS / Processar / Adiar | Fase 3+ | `09_IDEIAS_PENDENTES.md` |

---

## 8. Glossário de Termos

### Termos Técnicos GIS

| Termo | Definição |
|-------|-----------|
| **COG** | Cloud Optimized GeoTIFF - formato raster optimizado para acesso web |
| **MDT/DEM** | Modelo Digital de Terreno / Digital Elevation Model |
| **NDVI** | Normalized Difference Vegetation Index - índice de vegetação |
| **NDWI** | Normalized Difference Water Index - índice de água |
| **TWI** | Topographic Wetness Index - índice de humidade topográfica |
| **TPI** | Topographic Position Index - posição relativa no terreno |
| **TRI** | Topographic Ruggedness Index - rugosidade do terreno |
| **Strahler** | Sistema de classificação hierárquica de cursos de água |
| **Flow Direction** | Direcção de escoamento da água (D8 = 8 direcções) |
| **Flow Accumulation** | Número de células que drenam para cada ponto |
| **Pour Point** | Ponto de saída de uma bacia hidrográfica |
| **USLE** | Universal Soil Loss Equation - equação de perda de solo |
| **WMS** | Web Map Service - standard OGC para mapas |
| **WFS** | Web Feature Service - standard OGC para features |
| **MVT** | Mapbox Vector Tiles - formato de vector tiles |
| **STAC** | SpatioTemporal Asset Catalog - catálogo de dados espaciais |
| **pgRouting** | Extensão PostGIS para routing e análise de redes |
| **Isócrona** | Linha de igual tempo de viagem a partir de um ponto |

### Termos de Área de Estudo

| Termo | Definição |
|-------|-----------|
| **Polje** | Depressão cársica de fundo plano, sujeita a inundação sazonal |
| **Paul** | Zona húmida, pântano (Paul do Boquilobo) |
| **Ramsar** | Convenção internacional sobre zonas húmidas |
| **Lezíria** | Planície aluvial do Tejo |
| **Carso/Cársico** | Sistema geológico calcário com grutas e nascentes |
| **REN** | Reserva Ecológica Nacional |
| **RAN** | Reserva Agrícola Nacional |
| **PDM** | Plano Director Municipal |
| **COS** | Carta de Ocupação do Solo |
| **CAOP** | Carta Administrativa Oficial de Portugal |

### Termos de Fontes de Dados

| Termo | Definição |
|-------|-----------|
| **DGT** | Direcção-Geral do Território |
| **APA** | Agência Portuguesa do Ambiente |
| **SNIRH** | Sistema Nacional de Informação de Recursos Hídricos |
| **SNIG** | Sistema Nacional de Informação Geográfica |
| **IPMA** | Instituto Português do Mar e da Atmosfera |
| **ICNF** | Instituto da Conservação da Natureza e das Florestas |
| **IFAP** | Instituto de Financiamento da Agricultura e Pescas |
| **INE** | Instituto Nacional de Estatística |
| **DGADR** | Direcção-Geral de Agricultura e Desenvolvimento Rural |
| **GEE** | Google Earth Engine |
| **SMAP** | Soil Moisture Active Passive (NASA) |
| **SMOS** | Soil Moisture and Ocean Salinity (ESA) |

### Acrónimos do Projecto

| Acrónimo | Significado |
|----------|-------------|
| **ZA-XX** | Zona Agrícola - projecto número XX |
| **ZH-XX** | Zona Hídrica - projecto número XX |
| **ZU-XX** | Zona Urbana - projecto número XX |
| **ZC-XX** | Zona Cársica - projecto número XX |
| **PS-XX** | Projecto Standalone número XX |
| **GI-XX** | Grupo Integrado número XX |
| **NG-XX** | News ON GIS - projecto número XX |
| **D-SXX** | Decisão de Stack número XX |
| **D-AXX** | Decisão de Área número XX |
| **D-PXX** | Decisão de Projecto número XX |
| **D-PRXX** | Decisão de Processamento número XX |
| **D-CXX** | Decisão de Comunicação número XX |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial com todas as decisões da sessão de planeamento |

---

## Documentos Relacionados

Todos os outros documentos - este serve como índice de decisões.

---

*Documento de referência rápida. Última actualização: Janeiro 2025*
