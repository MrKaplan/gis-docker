# 📌 Backlog de Projetos — Stack GIS Docker ARM64

Este documento reúne ideias de projetos que podem ser desenvolvidos sobre a stack GIS definida para este repositório.

O objetivo do backlog é:
- servir como referência técnica e conceptual
- permitir escolher projetos âncora para validação da stack
- evoluir ideias de forma incremental e reutilizável

---

## 1. Monitorização de Cheias e Zonas Inundáveis

**Descrição**  
Deteção automática de eventos de inundação com base em imagens de satélite e análise temporal.

**Componentes principais**
- Sentinel-2
- NDWI
- Vetorização automática
- Publicação WebGIS

**Hooks de desenvolvimento**
- Alertas automáticos por threshold
- Comparação com histórico de cheias
- Integração com dados de precipitação
- Classificação de severidade da cheia

---

## 2. Deteção de Áreas Ardidas

**Descrição**  
Identificação e mapeamento de áreas queimadas após incêndios florestais.

**Componentes principais**
- Sentinel-2 / Landsat
- NBR / dNDVI
- Análise pré e pós-evento

**Hooks de desenvolvimento**
- Cálculo de severidade do incêndio
- Integração com histórico multianual
- Comparação entre incêndios diferentes
- Base para projetos de regeneração

---

## 3. Observatório de Seca Agrícola

**Descrição**  
Monitorização contínua de stress hídrico em áreas agrícolas.

**Componentes principais**
- NDVI multitemporal
- Parcelário agrícola
- Séries temporais

**Hooks de desenvolvimento**
- Análise de anomalias face à média histórica
- Dashboards temporais
- Comparação entre culturas
- Sistema de alertas agrícolas

---

## 4. Ilhas de Calor Urbano

**Descrição**  
Identificação de zonas urbanas com maior risco térmico através de proxies ambientais.

**Componentes principais**
- NDVI
- Uso do solo
- Opcional: temperatura Landsat

**Hooks de desenvolvimento**
- Cruzamento com dados socioeconómicos
- Avaliação de impacto de espaços verdes
- Apoio a planeamento urbano

---

## 5. Walkability Urbana

**Descrição**  
Avaliação da acessibilidade pedonal e qualidade do espaço urbano.

**Componentes principais**
- Redes pedonais
- Isócronas
- Serviços urbanos

**Hooks de desenvolvimento**
- Score de walkability por bairro
- Integração com transporte público
- Simulação de novos equipamentos

---

## 6. Percursos Pedestres e Cicláveis

**Descrição**  
Planeamento de rotas otimizadas para mobilidade suave.

**Componentes principais**
- Rede viária
- Declive
- DEM

**Hooks de desenvolvimento**
- Penalização por inclinação
- Classificação por nível de esforço
- Exportação GPX

---

## 7. Monitorização de Qualidade da Água (Proxy Remoto)

**Descrição**  
Deteção de alterações em massas de água com base em índices espectrais.

**Componentes principais**
- NDWI
- Séries temporais

**Hooks de desenvolvimento**
- Deteção de eventos anómalos
- Comparação entre albufeiras
- Integração com dados in-situ

---

## 8. Scraping Ambiental Diário

**Descrição**  
Recolha automática de dados ambientais externos com armazenamento espacial.

**Componentes principais**
- Cronjobs
- Python
- PostGIS temporal

**Hooks de desenvolvimento**
- Dashboards simples
- API pública
- Correlação com dados de satélite

---

## 9. Abandono Agrícola

**Descrição**  
Identificação de áreas agrícolas com perda progressiva de atividade.

**Componentes principais**
- NDVI multianual
- Análise de tendência

**Hooks de desenvolvimento**
- Classificação por velocidade de abandono
- Cruzamento com fatores ambientais
- Apoio a políticas públicas

---

## 10. Atlas Urbano Interativo

**Descrição**  
Plataforma WebGIS para visualização de informação urbanística.

**Componentes principais**
- QGIS Server
- WMS/WFS
- Camadas oficiais

**Hooks de desenvolvimento**
- Ferramentas de consulta avançada
- Exportação de dados
- Integração com cadastro

---

## 11. Sistema de Alertas Espaciais

**Descrição**  
Transformação de análises GIS em eventos e alertas.

**Componentes principais**
- Cronjobs
- Regras espaciais
- Base de eventos

**Hooks de desenvolvimento**
- API de notificações
- Histórico de alertas
- Dashboards de eventos

---

## 12. Regeneração da Vegetação Pós-Incêndio (10 anos)

**Descrição**  
Análise da recuperação da vegetação ao longo de uma década após incêndios florestais.

**Componentes principais**
- Sentinel-2 + Landsat
- NDVI / NBR
- Séries temporais longas

**Hooks de desenvolvimento**
- Curvas de recuperação por pixel ou polígono
- Classificação de dinâmicas de regeneração
- Tempo até recuperação parcial/completa
- Cruzamento com declive, solo e exposição
- Comparação entre diferentes incêndios
- Slider temporal em WebGIS

---

## 13. GIS as a Service Pessoal

**Descrição**  
Uso do stack como plataforma base para múltiplos mini-projetos GIS.

**Componentes principais**
- Stack Docker reprodutível
- Projetos isolados por pasta

**Hooks de desenvolvimento**
- Templates de projeto
- Multi-tenant simples
- Showcase técnico
- Base para freelancing ou investigação

---

> Este backlog é um documento vivo e deve evoluir à medida que a stack e os objetivos do projeto amadurecem.

