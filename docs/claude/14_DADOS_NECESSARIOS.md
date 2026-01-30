# 14 - DADOS NECESSÁRIOS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Fontes de Dados Portuguesas](#2-fontes-de-dados-portuguesas)
3. [Dados de Satélite](#3-dados-de-satélite)
4. [Dados por Tipo](#4-dados-por-tipo)
5. [Dados por Núcleo](#5-dados-por-núcleo)
6. [Matriz Dados × Projectos](#6-matriz-dados--projectos)
7. [Estratégia de Aquisição](#7-estratégia-de-aquisição)
8. [Armazenamento e Formatos](#8-armazenamento-e-formatos)
9. [Checklist de Download](#9-checklist-de-download)
10. [Scripts de Download](#10-scripts-de-download)

---

## 1. Visão Geral

### 1.1. Resumo por Tipo

| Tipo | Quantidade | Fonte Principal |
|------|------------|-----------------|
| Raster | ~15 | DGT, Copernicus, GEE |
| Vector | ~20 | SNIG, OSM, dados.gov.pt |
| Tabular | ~10 | SNIRH, IPMA, INE |
| API/Serviço | ~8 | GEE, Copernicus, SNIRH |

### 1.2. Critérios de Selecção

| Critério | Requisito |
|----------|-----------|
| **Licença** | Aberta / Creative Commons / ODbL |
| **Actualização** | Documentada |
| **Cobertura** | Área de estudo completa |
| **Formato** | Standards OGC ou formatos abertos |
| **Acessibilidade** | Download directo ou API |

### 1.3. Prioridades

| Símbolo | Significado |
|---------|-------------|
| 🔴 | Crítico (bloqueia projectos base) |
| 🟡 | Importante (necessário para vários projectos) |
| 🟢 | Opcional (nice to have) |

---

## 2. Fontes de Dados Portuguesas

### 2.1. Entidades Oficiais

| Sigla | Nome Completo | Dados Disponíveis |
|-------|---------------|-------------------|
| **DGT** | Direcção-Geral do Território | MDT LiDAR, COS, CAOP, Ortofotomapas |
| **APA** | Agência Portuguesa do Ambiente | Bacias, rede hidrográfica, qualidade água |
| **SNIRH** | Sistema Nacional de Informação de Recursos Hídricos | Níveis albufeiras, caudais, qualidade água |
| **IPMA** | Instituto Português do Mar e da Atmosfera | Meteorologia, clima |
| **ICNF** | Instituto da Conservação da Natureza e das Florestas | Áreas ardidas, áreas protegidas |
| **LNEG** | Laboratório Nacional de Energia e Geologia | Geologia, recursos minerais |
| **INE** | Instituto Nacional de Estatística | Censos, BGRI, estatísticas |
| **IFAP** | Instituto de Financiamento da Agricultura e Pescas | Parcelas agrícolas |
| **DGADR** | Direcção-Geral de Agricultura e Desenvolvimento Rural | Solos, capacidade uso |
| **DGPC** | Direcção-Geral do Património Cultural | Património classificado |

### 2.2. Portais de Acesso

| Portal | URL | Tipo |
|--------|-----|------|
| **SNIG** | https://snig.dgterritorio.gov.pt | Catálogo nacional |
| **iGEO** | https://snig.dgterritorio.gov.pt/rndg/srv/por/catalog.search | Pesquisa metadados |
| **dados.gov.pt** | https://dados.gov.pt | Portal open data |
| **SNIRH** | https://snirh.apambiente.pt | Dados hídricos |
| **MapViewer DGT** | https://mapas.dgterritorio.pt | Visualizador |

### 2.3. Detalhe por Entidade

#### DGT - Direcção-Geral do Território

| Dado | Descrição | Resolução/Escala | Formato | Acesso |
|------|-----------|------------------|---------|--------|
| **MDT LiDAR** | Modelo Digital de Terreno | 2m | GeoTIFF | Download (registo) |
| **MDS LiDAR** | Modelo Digital de Superfície | 2m | GeoTIFF | Download (registo) |
| **COS 2018** | Carta de Ocupação do Solo | 1:25.000 | SHP/GPKG | Download |
| **COS 2015** | Carta de Ocupação do Solo | 1:25.000 | SHP/GPKG | Download |
| **COS 2010** | Carta de Ocupação do Solo | 1:25.000 | SHP/GPKG | Download |
| **COS 2007** | Carta de Ocupação do Solo | 1:25.000 | SHP/GPKG | Download |
| **CAOP** | Carta Administrativa Oficial | 1:25.000 | SHP/GPKG | Download |
| **Ortofotomapas** | Fotografia aérea | 25-50cm | ECW/JPEG2000 | WMS/Download |

**URL:** https://snig.dgterritorio.gov.pt/rndg/srv/por/catalog.search

#### APA - Agência Portuguesa do Ambiente

| Dado | Descrição | Escala | Formato | Acesso |
|------|-----------|--------|---------|--------|
| **Bacias hidrográficas** | Delimitação oficial | 1:25.000 | SHP | Download |
| **Rede hidrográfica** | Cursos de água | 1:25.000 | SHP | Download |
| **Albufeiras** | Limites de albufeiras | 1:25.000 | SHP | Download |
| **Massas de água** | Classificação WFD | - | SHP | Download |
| **REN** | Reserva Ecológica Nacional | 1:25.000 | SHP | Download |

**URL:** https://apambiente.pt

#### SNIRH - Dados Hídricos

| Dado | Descrição | Frequência | Formato | Acesso |
|------|-----------|------------|---------|--------|
| **Níveis albufeiras** | Cotas e volumes | Diário | Web/CSV | Scraping/API |
| **Caudais** | Estações hidrométricas | Diário | Web/CSV | Scraping/API |
| **Qualidade água** | Parâmetros físico-químicos | Mensal | Web/CSV | Scraping |
| **Precipitação** | Estações udométricas | Diário | Web/CSV | Scraping |

**URL:** https://snirh.apambiente.pt

#### IPMA - Meteorologia

| Dado | Descrição | Frequência | Formato | Acesso |
|------|-----------|------------|---------|--------|
| **Temperatura** | Estações meteorológicas | Diário | API/JSON | API |
| **Precipitação** | Estações meteorológicas | Diário | API/JSON | API |
| **Radiação** | Estações meteorológicas | Diário | API/JSON | API |
| **Alertas meteo** | Avisos meteorológicos | Contínuo | API/JSON | API |

**URL:** https://api.ipma.pt

#### ICNF - Natureza e Florestas

| Dado | Descrição | Frequência | Formato | Acesso |
|------|-----------|------------|---------|--------|
| **Áreas ardidas** | Perímetros de incêndios | Anual | SHP | Download |
| **RNAP** | Áreas protegidas | Estático | SHP | Download |
| **Rede Natura 2000** | Sítios de interesse comunitário | Estático | SHP | Download |
| **IFN** | Inventário Florestal Nacional | ~10 anos | SHP | Download |

**URL:** https://geocatalogo.icnf.pt

#### LNEG - Geologia

| Dado | Descrição | Escala | Formato | Acesso |
|------|-----------|--------|---------|--------|
| **Carta Geológica** | Geologia de Portugal | 1:50.000 | SHP/PDF | Download/WMS |
| **Carta Hidrogeológica** | Aquíferos | 1:200.000 | SHP/PDF | Download |
| **Falhas e fracturas** | Tectónica | 1:500.000 | SHP | Download |

**URL:** https://geoportal.lneg.pt

#### INE - Estatísticas

| Dado | Descrição | Frequência | Formato | Acesso |
|------|-----------|------------|---------|--------|
| **Censos 2021** | População, habitação | Decenal | CSV/XLS | Download |
| **Censos 2011** | População, habitação | Decenal | CSV/XLS | Download |
| **BGRI** | Base Geográfica de Referenciação | Decenal | SHP | Download |
| **Estatísticas correntes** | Várias | Anual | CSV/XLS | Download |

**URL:** https://www.ine.pt

#### IFAP - Agricultura

| Dado | Descrição | Frequência | Formato | Acesso |
|------|-----------|------------|---------|--------|
| **Parcelas agrícolas** | Limites de parcelas PAC | Anual | SHP | dados.gov.pt |
| **Culturas** | Tipo de cultura por parcela | Anual | SHP | dados.gov.pt |

**URL:** https://dados.gov.pt (pesquisar IFAP)

#### DGADR - Solos

| Dado | Descrição | Escala | Formato | Acesso |
|------|-----------|--------|---------|--------|
| **Carta de Solos** | Tipos de solo | 1:25.000 | SHP | SNIG |
| **Capacidade de Uso** | Aptidão agrícola | 1:25.000 | SHP | SNIG |
| **RAN** | Reserva Agrícola Nacional | 1:25.000 | SHP | SNIG |

**URL:** https://snig.dgterritorio.gov.pt

---

## 3. Dados de Satélite

### 3.1. Sentinel-2 (Óptico)

| Característica | Valor |
|----------------|-------|
| **Operador** | ESA / Copernicus |
| **Resolução espacial** | 10m (VNIR), 20m (SWIR), 60m (atmosfera) |
| **Resolução temporal** | 5 dias |
| **Cobertura** | Global |
| **Bandas** | 13 bandas espectrais |
| **Acesso** | Copernicus Data Space, GEE |

**Aplicações:**
- NDVI (vegetação)
- NDWI (água)
- NBR (severidade fogo)
- Classificação uso do solo

**Colecção GEE:** `COPERNICUS/S2_SR_HARMONIZED`

### 3.2. Sentinel-1 (SAR)

| Característica | Valor |
|----------------|-------|
| **Operador** | ESA / Copernicus |
| **Resolução espacial** | 10m (IW mode) |
| **Resolução temporal** | 6 dias |
| **Polarização** | VV, VH |
| **Acesso** | Copernicus Data Space, GEE |

**Aplicações:**
- Detecção de água/inundações
- InSAR (subsidência)
- Humidade do solo

**Colecção GEE:** `COPERNICUS/S1_GRD`

### 3.3. Landsat 8/9

| Característica | Valor |
|----------------|-------|
| **Operador** | USGS / NASA |
| **Resolução espacial** | 30m (multiespectral), 15m (pan) |
| **Resolução temporal** | 16 dias |
| **Arquivo** | Desde 1972 (Landsat 1) |
| **Acesso** | USGS, GEE |

**Aplicações:**
- Séries temporais longas
- LST (temperatura superfície)
- Análise histórica

**Colecção GEE:** `LANDSAT/LC08/C02/T1_L2`

### 3.4. MODIS

| Característica | Valor |
|----------------|-------|
| **Operador** | NASA |
| **Resolução espacial** | 250m - 1km |
| **Resolução temporal** | Diário |
| **Acesso** | NASA, GEE |

**Aplicações:**
- NDVI regional
- Detecção de fogos
- Temperatura (LST)

**Colecções GEE:** `MODIS/006/MOD13Q1`, `MODIS/006/MOD11A1`

### 3.5. SMAP (Soil Moisture)

| Característica | Valor |
|----------------|-------|
| **Operador** | NASA |
| **Resolução espacial** | 9 km |
| **Resolução temporal** | 2-3 dias |
| **Acesso** | NASA, GEE |

**Aplicações:**
- Humidade do solo
- Monitorização de seca

**Colecção GEE:** `NASA/SMAP/SPL4SMGP/007`

### 3.6. ERA5 (Clima)

| Característica | Valor |
|----------------|-------|
| **Operador** | ECMWF / Copernicus |
| **Resolução espacial** | ~27 km |
| **Resolução temporal** | Horário |
| **Cobertura temporal** | 1979 - presente |
| **Acesso** | CDS, GEE |

**Aplicações:**
- Precipitação
- Temperatura
- Evapotranspiração
- Vento

**Colecção GEE:** `ECMWF/ERA5/DAILY`

### 3.7. Plataformas de Acesso

| Plataforma | URL | Tipo |
|------------|-----|------|
| **Google Earth Engine** | https://earthengine.google.com | Cloud processing |
| **Copernicus Data Space** | https://dataspace.copernicus.eu | Download/API |
| **Microsoft Planetary Computer** | https://planetarycomputer.microsoft.com | STAC/COG |
| **USGS Earth Explorer** | https://earthexplorer.usgs.gov | Download |

---

## 4. Dados por Tipo

### 4.1. Dados Raster

| ID | Nome | Fonte | Resolução | Prioridade | Projectos |
|----|------|-------|-----------|------------|-----------|
| R01 | **MDT LiDAR** | DGT | 2m | 🔴 | PB-00, todos |
| R02 | MDS LiDAR | DGT | 2m | 🟡 | NF-04, NU-04 |
| R03 | Sentinel-2 | Copernicus/GEE | 10m | 🔴 | NA-02, NF-01, NC-01 |
| R04 | Sentinel-1 | Copernicus/GEE | 10m | 🟡 | NC-01 (InSAR) |
| R05 | Landsat 8/9 | USGS/GEE | 30m | 🟡 | NH-14 (LST) |
| R06 | SMAP Soil Moisture | NASA/GEE | 9km | 🟡 | NA-05 |
| R07 | ERA5 Climate | ECMWF/GEE | 27km | 🟡 | NA-05, NA-06 |
| R08 | MODIS NDVI | NASA/GEE | 250m | 🟢 | NA-09 |
| R09 | Ortofotomapas | DGT | 25-50cm | 🟡 | Validação, NT-05 |

### 4.2. Dados Vectoriais

| ID | Nome | Fonte | Escala | Prioridade | Projectos |
|----|------|-------|--------|------------|-----------|
| V01 | **CAOP** (limites admin) | DGT | 1:25.000 | 🔴 | Todos |
| V02 | **COS** (ocupação solo) | DGT | 1:25.000 | 🔴 | NA-03, NF-02, NF-03 |
| V03 | **Rede viária** | OSM | - | 🔴 | NU-05, NU-08, NU-12 |
| V04 | Rede hidrográfica | APA/SNIG | 1:25.000 | 🔴 | NH-01, NH-12 |
| V05 | Bacias hidrográficas | APA | 1:25.000 | 🟡 | NH-02, NH-12 |
| V06 | Parcelas IFAP | dados.gov.pt | 1:10.000 | 🟡 | NA-01, NA-03 |
| V07 | Carta de Solos | DGADR/SNIG | 1:25.000 | 🟡 | NA-10, NC-05 |
| V08 | Capacidade Uso | DGADR/SNIG | 1:25.000 | 🟡 | NA-03 |
| V09 | Carta Geológica | LNEG | 1:50.000 | 🟡 | NC-04, NF-09 |
| V10 | Áreas ardidas | ICNF | 1:25.000 | 🔴 | NF-01, NF-07 |
| V11 | Áreas protegidas | ICNF | 1:25.000 | 🟡 | NA-00, NH-15 |
| V12 | REN | APA/CCDR | 1:25.000 | 🟡 | NU-11, NH-15 |
| V13 | RAN | DGADR | 1:25.000 | 🟡 | NU-11, NH-15 |
| V14 | Edifícios | OSM | - | 🟡 | NU-03, NU-04 |
| V15 | POIs | OSM | - | 🟡 | NU-05, NU-15, NU-16 |
| V16 | Percursos pedestres | OSM/Wikiloc | - | 🟢 | NT-01 |
| V17 | Património | DGPC/SIPA | - | 🟢 | NT-04 |
| V18 | BGRI (subsecções) | INE | - | 🟡 | NU-00 |

### 4.3. Dados Tabulares/Temporais

| ID | Nome | Fonte | Frequência | Prioridade | Projectos |
|----|------|-------|------------|------------|-----------|
| T01 | **Níveis albufeiras** | SNIRH | Diário | 🟡 | NH-08 |
| T02 | Caudais | SNIRH | Diário | 🟡 | NH-08 |
| T03 | Qualidade água | SNIRH | Mensal | 🟡 | NH-07 |
| T04 | Precipitação | IPMA/SNIRH | Diário | 🟡 | NA-05, NC-01 |
| T05 | Temperatura | IPMA | Diário | 🟢 | NA-05 |
| T06 | Censos 2021 | INE | Decenal | 🟡 | NU-00 |
| T07 | Estatísticas agrícolas | INE | Anual | 🟢 | NA-00 |

---

## 5. Dados por Núcleo

### 5.1. 🌾 Núcleo Agrícola (NA-)

| Dado | Fonte | Uso |
|------|-------|-----|
| **Parcelas IFAP** | dados.gov.pt | Análise por parcela |
| **COS (série)** | DGT | Transições ocupação |
| **Carta de Solos** | DGADR | Aptidão, erosão |
| **Capacidade de Uso** | DGADR | Compatibilidade |
| **Sentinel-2 NDVI** | GEE | Stress hídrico |
| **SMAP** | GEE | Humidade solo |
| **Precipitação** | IPMA | Correlação NDVI |
| **Limites Paul Boquilobo** | ICNF | Área protegida |

### 5.2. 💧 Núcleo Hídrico (NH-)

| Dado | Fonte | Uso |
|------|-------|-----|
| **MDT LiDAR** | DGT | Derivados hidrológicos |
| **Rede hidrográfica** | APA | Validação |
| **Bacias oficiais** | APA | Comparação |
| **Sentinel-2** | GEE | NDWI, eutrofização |
| **Níveis albufeiras** | SNIRH | Monitorização |
| **Qualidade água** | SNIRH | Eutrofização |
| **Caudais** | SNIRH | Modelação |

### 5.3. 🏙️ Núcleo Urbano (NU-)

| Dado | Fonte | Uso |
|------|-------|-----|
| **MDT LiDAR** | DGT | Viewshed, stormwater |
| **Rede viária** | OSM | pgRouting |
| **Edifícios** | OSM | 3D, sombras |
| **POIs** | OSM | Isócronas |
| **BGRI/Censos** | INE | População |
| **REN/RAN** | APA/DGADR | Condicionantes |
| **Ortofotomapas** | DGT | Validação |

### 5.4. 🕳️ Núcleo Cársico (NC-)

| Dado | Fonte | Uso |
|------|-------|-----|
| **MDT LiDAR** | DGT | Geomorfologia |
| **Carta Geológica** | LNEG | Litologia |
| **Sentinel-2** | GEE | NDWI inundação |
| **Sentinel-1** | GEE | InSAR (subsidência) |
| **Precipitação** | IPMA/SNIRH | Correlação inundação |
| **Carta de Solos** | DGADR | Permeabilidade |
| **Aquíferos** | SNIRH/APA | DRASTIC |

### 5.5. 🌲 Núcleo Florestal/Riscos (NF-)

| Dado | Fonte | Uso |
|------|-------|-----|
| **MDT LiDAR** | DGT | Declive, exposição |
| **MDS LiDAR** | DGT | CHM (altura floresta) |
| **Áreas ardidas** | ICNF | Histórico incêndios |
| **Sentinel-2 NBR** | GEE | Severidade, regeneração |
| **COS (série)** | DGT | Desflorestação, reflorestação |
| **Carta Geológica** | LNEG | Susceptibilidade derrocadas |

### 5.6. 🏛️ Núcleo Turismo/Património (NT-)

| Dado | Fonte | Uso |
|------|-------|-----|
| **MDT LiDAR** | DGT | Viewshed, 3D |
| **Percursos** | OSM/Wikiloc | Trilhos |
| **Património** | DGPC/SIPA | POIs |
| **Ortofotomapas** | DGT | Textura 3D |
| **Plantas arqueológicas** | Museus | Villa Romana |

---

## 6. Matriz Dados × Projectos

### 6.1. Projectos Base e Anchor

| Dado | PB-00 | PS-07 | NU-00 | NA-00 | NF-00 |
|------|-------|-------|-------|-------|-------|
| MDT LiDAR | ✅ | ✅ | ✅ | ✅ | ✅ |
| COS | - | ✅ | - | ✅ | ✅ |
| Sentinel-2 | - | ✅ | - | ✅ | ✅ |
| Rede viária | - | - | ✅ | - | - |
| Parcelas IFAP | - | - | - | ✅ | - |
| Áreas ardidas | - | ✅ | - | - | ✅ |
| Solos | - | - | - | ✅ | ✅ |
| Geologia | - | - | - | - | ✅ |

### 6.2. Legenda

- ✅ = Necessário
- 🟡 = Opcional/Complementar
- `-` = Não necessário

---

## 7. Estratégia de Aquisição

### 7.1. Fase 1 - Dados Críticos (Semana 1-2)

| Dado | Acção | Tempo Estimado |
|------|-------|----------------|
| MDT LiDAR | Download DGT (área estudo) | 2-4h |
| CAOP | Download SNIG | 30min |
| COS 2018 | Download DGT | 1h |
| Rede viária | Extracção OSM | 1h |
| Áreas ardidas | Download ICNF | 1h |

### 7.2. Fase 2 - Dados Complementares (Semana 3-4)

| Dado | Acção | Tempo Estimado |
|------|-------|----------------|
| Parcelas IFAP | Download dados.gov.pt | 2h |
| Carta de Solos | Download SNIG | 1h |
| Carta Geológica | Download LNEG | 1h |
| Bacias APA | Download SNIG | 1h |
| REN/RAN | Download SNIG | 1h |

### 7.3. Fase 3 - Dados Satélite (Contínuo)

| Dado | Acção | Frequência |
|------|-------|------------|
| Sentinel-2 | Via GEE (on-demand) | Por projecto |
| Sentinel-1 | Via GEE (on-demand) | Por projecto |
| Landsat | Via GEE (on-demand) | Por projecto |
| SMAP | Via GEE (on-demand) | Por projecto |

### 7.4. Fase 4 - Dados Tabulares (Setup + Automação)

| Dado | Acção | Frequência |
|------|-------|------------|
| Níveis albufeiras | Script scraping SNIRH | Diário |
| Precipitação | Script API IPMA | Diário |
| Qualidade água | Script scraping SNIRH | Mensal |

---

## 8. Armazenamento e Formatos

### 8.1. Formatos Preferidos

| Tipo | Formato Original | Formato de Trabalho | Formato Web |
|------|------------------|---------------------|-------------|
| Raster | GeoTIFF | GeoTIFF | COG |
| Vector | SHP | GeoPackage | PostGIS → MVT |
| Tabular | CSV/XLS | PostgreSQL | JSON API |

### 8.2. Estrutura de Pastas

```
/data/
├── downloads/                    # Ficheiros originais (não editar)
│   ├── dgt/
│   │   ├── mdt_lidar/
│   │   ├── cos/
│   │   └── caop/
│   ├── icnf/
│   │   └── areas_ardidas/
│   ├── snig/
│   │   ├── solos/
│   │   ├── geologia/
│   │   └── ren_ran/
│   ├── osm/
│   │   └── portugal-latest.osm.pbf
│   └── ifap/
│       └── parcelas/
│
├── processed/                    # Dados processados
│   ├── raster/
│   │   ├── mdt_2m.tif           # MDT mosaico
│   │   ├── mdt_5m.tif           # MDT reamostrado
│   │   ├── slope.cog.tif        # Derivados (COG)
│   │   ├── aspect.cog.tif
│   │   ├── twi.cog.tif
│   │   └── ...
│   └── vector/
│       ├── area_estudo.gpkg     # Limites
│       ├── bacias.gpkg          # Bacias derivadas
│       ├── rede_drenagem.gpkg   # Rede Strahler
│       └── ...
│
└── temp/                         # Ficheiros temporários
    └── .gitkeep
```

### 8.3. Convenções de Nomenclatura

```
[fonte]_[tema]_[ano]_[area].[formato]

Exemplos:
- dgt_mdt_2020_mediotejo.tif
- dgt_cos_2018_mediotejo.gpkg
- icnf_ardidas_2023_portugal.shp
- osm_roads_2024_mediotejo.gpkg
```

### 8.4. Tamanhos Estimados

| Dado | Tamanho (área estudo) |
|------|----------------------|
| MDT LiDAR 2m | ~2-4 GB |
| MDT LiDAR 5m | ~500 MB |
| COS | ~100 MB |
| Rede viária OSM | ~50 MB |
| Parcelas IFAP | ~200 MB |
| Ortofotomapas | NÃO armazenar (WMS) |
| Sentinel-2 | NÃO armazenar (GEE) |

**Total estimado armazenamento local:** ~5-10 GB

---

## 9. Checklist de Download

### 9.1. Dados Críticos (🔴)

- [ ] **MDT LiDAR 2m** - DGT
  - URL: https://snig.dgterritorio.gov.pt
  - Tiles: [listar tiles necessários]
  - Tamanho estimado: ~3 GB

- [ ] **CAOP 2023** - DGT
  - URL: https://snig.dgterritorio.gov.pt
  - Tamanho: ~50 MB

- [ ] **COS 2018** - DGT
  - URL: https://snig.dgterritorio.gov.pt
  - Tamanho: ~100 MB

- [ ] **Rede viária** - OSM
  - URL: https://download.geofabrik.de/europe/portugal-latest.osm.pbf
  - Filtrar: área de estudo
  - Tamanho: ~50 MB (filtrado)

- [ ] **Áreas ardidas** - ICNF
  - URL: https://geocatalogo.icnf.pt
  - Anos: 2010-2023
  - Tamanho: ~100 MB

### 9.2. Dados Importantes (🟡)

- [ ] **Parcelas IFAP** - dados.gov.pt
- [ ] **Carta de Solos** - SNIG/DGADR
- [ ] **Capacidade de Uso** - SNIG/DGADR
- [ ] **Carta Geológica** - LNEG
- [ ] **Bacias hidrográficas** - APA
- [ ] **Rede hidrográfica** - APA
- [ ] **REN** - SNIG
- [ ] **RAN** - SNIG
- [ ] **Áreas protegidas** - ICNF
- [ ] **BGRI/Censos** - INE

### 9.3. Dados Opcionais (🟢)

- [ ] **MDS LiDAR** - DGT
- [ ] **COS séries anteriores** - DGT
- [ ] **Património classificado** - DGPC
- [ ] **Percursos pedestres** - OSM/Wikiloc

---

## 10. Scripts de Download

### 10.1. Download OSM (osm2pgsql)

```bash
#!/bin/bash
# download_osm.sh

# Download Portugal PBF
wget -O /data/downloads/osm/portugal-latest.osm.pbf \
    https://download.geofabrik.de/europe/portugal-latest.osm.pbf

# Filtrar área de estudo (bounding box)
osmium extract \
    --bbox=-8.8,39.2,-8.0,39.8 \
    /data/downloads/osm/portugal-latest.osm.pbf \
    -o /data/downloads/osm/mediotejo.osm.pbf

# Importar para PostGIS
osm2pgsql -d webgis \
    -H localhost -U postgres \
    --slim --drop \
    --style /etc/osm2pgsql/default.style \
    /data/downloads/osm/mediotejo.osm.pbf
```

### 10.2. Download SNIRH (scraping)

```python
#!/usr/bin/env python3
"""
download_snirh.py - Download dados do SNIRH
"""
import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime, timedelta

def get_reservoir_levels(reservoir_id: str, 
                         start_date: str, 
                         end_date: str) -> pd.DataFrame:
    """
    Obtém níveis de uma albufeira do SNIRH.
    """
    url = f"https://snirh.apambiente.pt/snirh/_dadosbase/site/janela_alarmes.php"
    
    params = {
        'codigo': reservoir_id,
        'data_inicio': start_date,
        'data_fim': end_date
    }
    
    response = requests.get(url, params=params)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Parse table (estrutura específica do SNIRH)
    # ...
    
    return df

# Albufeiras de interesse
reservoirs = {
    'castelo_bode': 'CODIGO_SNIRH',
    # adicionar outras
}

# Download
for name, code in reservoirs.items():
    df = get_reservoir_levels(code, '2020-01-01', '2024-12-31')
    df.to_csv(f'/data/downloads/snirh/{name}_levels.csv', index=False)
```

### 10.3. Download via GEE

```python
#!/usr/bin/env python3
"""
download_gee.py - Export dados do Google Earth Engine
"""
import ee
ee.Initialize()

def export_ndvi_composite(geometry, year, output_name):
    """
    Exporta composição NDVI anual.
    """
    collection = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED') \
        .filterBounds(geometry) \
        .filterDate(f'{year}-01-01', f'{year}-12-31') \
        .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20))
    
    def add_ndvi(image):
        ndvi = image.normalizedDifference(['B8', 'B4']).rename('NDVI')
        return image.addBands(ndvi)
    
    ndvi = collection.map(add_ndvi).select('NDVI').median()
    
    task = ee.batch.Export.image.toDrive(
        image=ndvi,
        description=output_name,
        folder='GEE_exports',
        region=geometry,
        scale=10,
        maxPixels=1e13
    )
    task.start()
    
    return task

# Área de estudo
area_estudo = ee.Geometry.Rectangle([-8.8, 39.2, -8.0, 39.8])

# Export
for year in range(2015, 2025):
    export_ndvi_composite(area_estudo, year, f'ndvi_mediotejo_{year}')
```

### 10.4. Automação com Makefile

```makefile
# Makefile para download de dados

DATA_DIR = /data/downloads
PROCESSED_DIR = /data/processed

.PHONY: all download-critical download-osm download-snirh

all: download-critical process-mdt

download-critical: download-osm download-mdt download-cos

download-osm:
	@echo "Downloading OSM data..."
	./scripts/download_osm.sh

download-mdt:
	@echo "Downloading MDT LiDAR..."
	# Script para download DGT

download-cos:
	@echo "Downloading COS..."
	# Script para download DGT

download-snirh:
	@echo "Downloading SNIRH data..."
	python scripts/download_snirh.py

process-mdt:
	@echo "Processing MDT..."
	python scripts/process_mdt.py
```

---

## Documentos Relacionados

| Documento | Conteúdo |
|-----------|----------|
| `01_STACK_TECNICO.md` | Ferramentas de processamento |
| `04_BACKLOG_PROJECTOS.md` | Lista de projectos e dados necessários |
| `13_BIBLIOGRAFIA.md` | Metodologias de processamento |
| `02_ESTRUTURA_FICHEIROS.md` | Organização de pastas |

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-28 | 1.0 | Documento inicial com catálogo completo de dados |

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
