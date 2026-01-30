# 10 - PRÓXIMOS PASSOS

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Fase 0: Preparação Imediata](#2-fase-0-preparação-imediata)
3. [Fase 1: Fundações](#3-fase-1-fundações)
4. [Fase 2: Primeiros Projectos](#4-fase-2-primeiros-projectos)
5. [Fase 3: Expansão](#5-fase-3-expansão)
6. [Fase 4: Consolidação](#6-fase-4-consolidação)
7. [Checklist de Arranque](#7-checklist-de-arranque)
8. [Dependências entre Tarefas](#8-dependências-entre-tarefas)
9. [Riscos e Mitigação](#9-riscos-e-mitigação)
10. [Marcos (Milestones)](#10-marcos-milestones)

---

## 1. Visão Geral

### 1.1. Horizonte Temporal

| Fase | Período | Foco |
|------|---------|------|
| **Fase 0** | Semana 1 | Preparação, decisões finais |
| **Fase 1** | Mês 1-2 | Stack + Projecto Base |
| **Fase 2** | Mês 3-4 | Primeiros projectos completos |
| **Fase 3** | Mês 5-6 | Expansão e automação |
| **Fase 4** | Mês 7+ | Consolidação e visibilidade |

### 1.2. Princípio Orientador

> **Entregar valor cedo e frequentemente**

Em vez de construir tudo antes de mostrar algo, o objectivo é:
1. Stack mínimo funcional → primeiro output
2. Iterar e expandir
3. Comunicar a cada passo

### 1.3. Tempo Disponível Estimado

| Cenário | Horas/semana | Duração das fases |
|---------|--------------|-------------------|
| Part-time leve | 5-10h | Fases x2 |
| Part-time médio | 10-15h | Conforme planeado |
| Intensivo | 20h+ | Fases /2 |

---

## 2. Fase 0: Preparação Imediata

**Duração:** 1 semana
**Objectivo:** Tomar decisões pendentes e preparar ambiente

### 2.1. Decisões a Tomar

| Decisão | Opções | Recomendação |
|---------|--------|--------------|
| Nome das zonas | Zonas Temáticas / Núcleos / Áreas | Zonas Temáticas |
| Resolução MDT inicial | 2m / 5m | 5m para dev, 2m para final |
| Língua do site | PT / EN / Bilingue | PT (código em EN) |
| Domínio | Pessoal / Projecto | Pessoal |

### 2.2. Tarefas Imediatas

```
SEMANA 0
│
├── [ ] Decisões finais (lista acima)
│
├── [ ] Ambiente local
│   ├── [ ] Instalar Docker Desktop
│   ├── [ ] Instalar VS Code + extensões
│   ├── [ ] Configurar Git
│   └── [ ] Clonar/criar repositório
│
├── [ ] Oracle Cloud
│   ├── [ ] Criar conta (se não tiver)
│   ├── [ ] Provisionar VM ARM (Free Tier)
│   ├── [ ] Configurar SSH
│   ├── [ ] Configurar firewall (portas 80, 443)
│   └── [ ] Apontar domínio (se já tiver)
│
├── [ ] Dados
│   ├── [ ] Identificar folhas LiDAR necessárias
│   ├── [ ] Iniciar download (pode demorar)
│   └── [ ] Descarregar CAOP, rede hidrográfica
│
└── [ ] Delimitar área de estudo
    ├── [ ] Abrir QGIS
    ├── [ ] Carregar bacias APA
    ├── [ ] Ajustar limites
    └── [ ] Exportar extent.geojson
```

### 2.3. Entregas da Fase 0

- [ ] Todas as decisões documentadas
- [ ] VM Oracle Cloud operacional
- [ ] Área de estudo delimitada (`extent.geojson`)
- [ ] Downloads de dados iniciados
- [ ] Repositório Git criado

---

## 3. Fase 1: Fundações

**Duração:** 4-6 semanas (Mês 1-2)
**Objectivo:** Stack funcional + Projecto Base (ZH-00)

### 3.1. Semana 1-2: Setup do Stack

```
SEMANA 1-2: STACK
│
├── [ ] Docker Compose base
│   ├── [ ] postgis container
│   ├── [ ] nginx container
│   ├── [ ] Testar conexão
│   └── [ ] Commit inicial
│
├── [ ] Adicionar serviços
│   ├── [ ] martin (vector tiles)
│   ├── [ ] python-api (FastAPI básico)
│   ├── [ ] jupyter
│   └── [ ] Testar cada um
│
├── [ ] Configurar Nginx
│   ├── [ ] Reverse proxy básico
│   ├── [ ] SSL com Let's Encrypt
│   └── [ ] Testar HTTPS
│
└── [ ] Documentar
    ├── [ ] README do repo
    └── [ ] Notas de setup
```

**Entrega:** Stack básico a correr em `https://dominio.pt`

### 3.2. Semana 3-4: Projecto Base - Terreno

```
SEMANA 3-4: ZH-00 (TERRENO)
│
├── [ ] Pré-processamento MDT
│   ├── [ ] Upload para servidor
│   ├── [ ] Mosaico das folhas
│   ├── [ ] Recorte pela área de estudo
│   └── [ ] Verificar qualidade
│
├── [ ] Derivados de terreno
│   ├── [ ] Slope
│   ├── [ ] Aspect
│   ├── [ ] Hillshade
│   ├── [ ] Curvature
│   ├── [ ] TRI, TPI
│   └── [ ] TWI
│
├── [ ] Optimização
│   ├── [ ] Converter para COG
│   └── [ ] Configurar TiTiler (ou adiar)
│
└── [ ] Validação
    ├── [ ] Verificar valores (min/max)
    ├── [ ] Visualizar em QGIS
    └── [ ] Documentar métricas
```

**Entrega:** Camadas de terreno derivadas e validadas

### 3.3. Semana 5-6: Projecto Base - Hidrologia

```
SEMANA 5-6: ZH-00 (HIDROLOGIA)
│
├── [ ] Processamento hidrológico
│   ├── [ ] Fill depressions
│   ├── [ ] Flow direction
│   ├── [ ] Flow accumulation
│   ├── [ ] Rede de drenagem
│   ├── [ ] Stream order (Strahler)
│   └── [ ] Bacias e sub-bacias
│
├── [ ] Vectorização
│   ├── [ ] Curvas de nível
│   ├── [ ] Rede de drenagem
│   └── [ ] Bacias
│
├── [ ] Publicação
│   ├── [ ] Carregar vectors para PostGIS
│   ├── [ ] Configurar Martin
│   ├── [ ] Testar tiles
│   └── [ ] Viewer básico (Leaflet)
│
├── [ ] Documentação
│   ├── [ ] README do projecto
│   ├── [ ] Metodologia
│   └── [ ] Data dictionary
│
└── [ ] Comunicação
    ├── [ ] LinkedIn post
    └── [ ] Entrada no portfolio (básica)
```

**Entregas Fase 1:**
- [ ] Stack completo e funcional
- [ ] ZH-00 concluído (todas as camadas)
- [ ] Dados acessíveis via Martin/TiTiler
- [ ] Viewer básico online
- [ ] 1º post LinkedIn
- [ ] Código no GitHub

---

## 4. Fase 2: Primeiros Projectos

**Duração:** 6-8 semanas (Mês 3-4)
**Objectivo:** 4 projectos completos com comunicação

### 4.1. Projectos da Fase 2

| Ordem | ID | Projecto | Tempo Est. | Razão de Prioridade |
|-------|-----|----------|------------|---------------------|
| 1 | ZH-08 | Upstream/Downstream | 2-3 sem | Interactivo, diferenciador |
| 2 | ZU-01 | Isócronas | 1-2 sem | pgRouting, muito visual |
| 3 | PS-01 | StoryMap Polje | 2 sem | Narrativa, contacto autarquia |
| 4 | PS-06 | GEE Timelapse | 1 sem | Quick win visual |

### 4.2. Semana 7-9: Upstream/Downstream (ZH-08)

```
SEMANA 7-9: ZH-08
│
├── [ ] Backend
│   ├── [ ] Endpoint /api/upstream
│   ├── [ ] Endpoint /api/downstream
│   ├── [ ] Testar performance
│   └── [ ] Optimizar (cache, pré-compute)
│
├── [ ] Frontend
│   ├── [ ] Página dedicada
│   ├── [ ] Click handler
│   ├── [ ] Mostrar resultados
│   ├── [ ] Popup com info
│   └── [ ] Loading states
│
├── [ ] Polish
│   ├── [ ] Estilo do mapa
│   ├── [ ] UI/UX
│   └── [ ] Mobile responsive
│
└── [ ] Comunicação
    ├── [ ] LinkedIn post
    ├── [ ] Artigo blog
    └── [ ] Portfolio entry
```

### 4.3. Semana 10-11: Isócronas (ZU-01)

```
SEMANA 10-11: ZU-01
│
├── [ ] Dados
│   ├── [ ] Importar rede OSM
│   ├── [ ] Preparar para pgRouting
│   └── [ ] Validar topologia
│
├── [ ] Backend
│   ├── [ ] Configurar pgRouting
│   ├── [ ] Endpoint /api/isochrone
│   └── [ ] Testar
│
├── [ ] Frontend
│   ├── [ ] Interface de selecção (ponto, modo, tempo)
│   ├── [ ] Visualização de isócronas
│   └── [ ] Legenda
│
└── [ ] Comunicação
    ├── [ ] LinkedIn post
    └── [ ] Portfolio entry
```

### 4.4. Semana 12-13: StoryMap Polje (PS-01)

```
SEMANA 12-13: PS-01 / ZC-00
│
├── [ ] Recolha de conteúdo
│   ├── [ ] Dados meteo (IPMA)
│   ├── [ ] Fotografias históricas
│   ├── [ ] Testemunhos (se possível)
│   └── [ ] Mapas históricos
│
├── [ ] Desenvolvimento
│   ├── [ ] Estrutura StoryMapJS
│   ├── [ ] Secções narrativas
│   ├── [ ] Mapas embebidos
│   └── [ ] Imagens e media
│
├── [ ] Publicação
│   ├── [ ] Deploy em subdomínio
│   └── [ ] Testar
│
└── [ ] Outreach
    ├── [ ] Contactar Junta de Minde
    ├── [ ] LinkedIn post
    └── [ ] Artigo blog
```

### 4.5. Semana 14: GEE Timelapse (PS-06)

```
SEMANA 14: PS-06
│
├── [ ] Setup GEE
│   ├── [ ] Conta activa
│   ├── [ ] Autenticação em Jupyter
│   └── [ ] Testar acesso
│
├── [ ] Timelapses
│   ├── [ ] NDVI sazonal (1 ano)
│   ├── [ ] Expansão urbana (se dados disponíveis)
│   └── [ ] Reservatório (nível água)
│
├── [ ] Output
│   ├── [ ] GIFs gerados
│   ├── [ ] Embedar no site
│   └── [ ] Download disponível
│
└── [ ] Comunicação
    ├── [ ] LinkedIn post (GIF nativo)
    └── [ ] Portfolio entry
```

**Entregas Fase 2:**
- [ ] 4 projectos completos e online
- [ ] 4+ posts LinkedIn
- [ ] 2+ artigos blog
- [ ] Portfolio com 5+ entradas
- [ ] Contacto com Junta de Minde feito

---

## 5. Fase 3: Expansão

**Duração:** 6-8 semanas (Mês 5-6)
**Objectivo:** Dashboards, automação, mais projectos

### 5.1. Projectos da Fase 3

| ID | Projecto | Tempo Est. |
|----|----------|------------|
| ZU-02 | Walkability | 2 sem |
| ZA-00 | Observatório Agrícola (inicial) | 3-4 sem |
| GI-04 | Dashboard Automático | 2 sem |
| PS-02 | Aldeia Xisto 3D | 2 sem |

### 5.2. Semana 15-16: Walkability (ZU-02)

```
SEMANA 15-16: ZU-02
│
├── [ ] Dados
│   ├── [ ] Passeios (OSM ou digitalizar)
│   ├── [ ] Declives dos percursos
│   ├── [ ] Obstáculos
│   └── [ ] Amenidades
│
├── [ ] Análise
│   ├── [ ] Índice de walkability
│   ├── [ ] Por zona/bairro
│   └── [ ] Mapear resultados
│
├── [ ] Visualização
│   ├── [ ] Integrar com isócronas
│   ├── [ ] Dashboard
│   └── [ ] Comparação entre zonas
│
└── [ ] Comunicação
    ├── [ ] LinkedIn post
    └── [ ] Artigo blog (cidade 15 min)
```

### 5.3. Semana 17-20: Observatório Agrícola (ZA-00)

```
SEMANA 17-20: ZA-00 (INICIAL)
│
├── [ ] Camadas base
│   ├── [ ] Solos (ZA-01)
│   ├── [ ] COS (ZA-02)
│   ├── [ ] Parcelas IFAP
│   └── [ ] Carregar para PostGIS
│
├── [ ] Análise NDVI
│   ├── [ ] Setup GEE pipeline
│   ├── [ ] Série temporal
│   ├── [ ] Anomalias
│   └── [ ] Exportar para visualização
│
├── [ ] Dashboard
│   ├── [ ] Mapa com camadas
│   ├── [ ] Gráfico temporal
│   ├── [ ] Filtros
│   └── [ ] Deploy
│
└── [ ] Comunicação
    ├── [ ] LinkedIn post
    ├── [ ] Artigo blog
    └── [ ] Contactar CM Golegã
```

### 5.4. Semana 21-22: Dashboard Automático (GI-04)

```
SEMANA 21-22: GI-04
│
├── [ ] Cronjobs
│   ├── [ ] Script NDWI reservatórios
│   ├── [ ] Script soil moisture
│   ├── [ ] Configurar cron
│   └── [ ] Testar execução
│
├── [ ] Pipeline
│   ├── [ ] Download → Process → Publish
│   ├── [ ] Logging
│   └── [ ] Alertas de erro
│
├── [ ] Dashboard
│   ├── [ ] Mostrar última actualização
│   ├── [ ] Indicadores actuais
│   └── [ ] Histórico
│
└── [ ] Documentação
    └── [ ] Como funciona a automação
```

### 5.5. Semana 23-24: Aldeia 3D (PS-02)

```
SEMANA 23-24: PS-02
│
├── [ ] Seleccionar aldeia
│   ├── [ ] Pesquisar opções
│   ├── [ ] Verificar dados LiDAR
│   └── [ ] Decidir
│
├── [ ] Modelação
│   ├── [ ] Extrair MDT
│   ├── [ ] Adicionar edifícios
│   ├── [ ] Gerar STL
│   └── [ ] Testar em visualizador 3D
│
├── [ ] Impressão
│   ├── [ ] Encontrar Fablab/serviço
│   ├── [ ] Imprimir protótipo
│   └── [ ] Fotografar
│
└── [ ] Outreach
    ├── [ ] Contactar câmara
    ├── [ ] LinkedIn post (fotos!)
    └── [ ] Artigo blog (tutorial)
```

**Entregas Fase 3:**
- [ ] Dashboard de acessibilidade (Walkability + Isócronas)
- [ ] Dashboard agrícola inicial
- [ ] Automação a funcionar
- [ ] Modelo 3D impresso
- [ ] Contactos com 2+ autarquias
- [ ] 8+ posts LinkedIn totais
- [ ] 4+ artigos blog

---

## 6. Fase 4: Consolidação

**Duração:** Contínua (Mês 7+)
**Objectivo:** Completar zonas, artigos, visibilidade

### 6.1. Actividades Contínuas

```
FASE 4: CONSOLIDAÇÃO
│
├── [ ] Completar Zonas Temáticas
│   ├── [ ] Zona Agrícola (restantes ZA-*)
│   ├── [ ] Zona Hídrica (restantes ZH-*)
│   ├── [ ] Zona Urbana (restantes ZU-*)
│   └── [ ] Zona Cársica (restantes ZC-*)
│
├── [ ] Analisar Temas Pendentes
│   ├── [ ] Tema 3: Clima
│   ├── [ ] Tema 4: Geologia
│   ├── [ ] Tema 5: Floresta
│   ├── [ ] (etc.)
│   └── [ ] Adicionar ao backlog
│
├── [ ] Comunicação regular
│   ├── [ ] 1-2 posts LinkedIn/semana
│   ├── [ ] 2-4 artigos blog/mês
│   └── [ ] Actualizar portfolio
│
├── [ ] Artigo técnico
│   ├── [ ] Escolher tema (eutrofização? bacias?)
│   ├── [ ] Escrever
│   └── [ ] Submeter a revista/conferência
│
├── [ ] News ON GIS
│   └── [ ] Projectos reactivos conforme oportunidades
│
└── [ ] Lixeiras (PS-04)
    ├── [ ] Preparar formulário
    ├── [ ] Trabalho de campo
    └── [ ] Publicar
```

### 6.2. Objectivos de Longo Prazo

| Objectivo | Prazo | Indicador |
|-----------|-------|-----------|
| Portfolio completo | 12 meses | 15+ projectos |
| Reconhecimento | 12 meses | Convite para palestra/entrevista |
| Colaboração autárquica | 12 meses | 1+ projecto conjunto |
| Oportunidade profissional | 12-18 meses | Proposta de emprego/freelance |

---

## 7. Checklist de Arranque

### 7.1. Antes de Começar (Fase 0)

**Ambiente:**
- [ ] Docker instalado e a funcionar
- [ ] Git configurado
- [ ] VS Code com extensões (Python, Docker, Remote SSH)
- [ ] Conta GitHub
- [ ] Conta Oracle Cloud

**Servidor:**
- [ ] VM criada (ARM, 2 OCPU, 12GB RAM)
- [ ] SSH configurado
- [ ] Docker instalado no servidor
- [ ] Firewall configurado (80, 443, 22)
- [ ] Domínio apontado (ou usar IP temporariamente)

**Dados:**
- [ ] MDT LiDAR identificado e download iniciado
- [ ] CAOP descarregado
- [ ] Área de estudo delimitada

**Documentação:**
- [ ] Estes MDs lidos e compreendidos
- [ ] Decisões tomadas e documentadas

### 7.2. Primeira Semana

- [ ] **Dia 1-2:** Finalizar setup servidor
- [ ] **Dia 3-4:** Docker Compose básico (PostGIS + Nginx)
- [ ] **Dia 5:** Testar e documentar
- [ ] **Dia 6-7:** Adicionar Martin, testar tiles

---

## 8. Dependências entre Tarefas

### 8.1. Diagrama de Dependências

```
┌─────────────────────────────────────────────────────────────────┐
│                         FASE 0                                  │
│  Decisões ──► Setup VM ──► Setup Docker ──► Delimitar Área     │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                         FASE 1                                  │
│                                                                 │
│  Download MDT ──► Mosaico ──► Derivados Terreno                │
│                      │              │                           │
│                      │              ▼                           │
│                      └────► Derivados Hidrologia               │
│                                     │                           │
│                                     ▼                           │
│                              PostGIS + Martin                   │
│                                     │                           │
│                                     ▼                           │
│                              Viewer Básico                      │
└──────────────────────────────┬──────────────────────────────────┘
                               │
          ┌────────────────────┼────────────────────┐
          │                    │                    │
          ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│    ZH-08        │  │    ZU-01        │  │    PS-01        │
│  Upstream/Down  │  │   Isócronas     │  │   StoryMap      │
│                 │  │                 │  │                 │
│ Precisa:        │  │ Precisa:        │  │ Precisa:        │
│ - Flow dir      │  │ - OSM roads     │  │ - Nada de ZH-00 │
│ - API           │  │ - pgRouting     │  │ - Dados meteo   │
└─────────────────┘  └─────────────────┘  └─────────────────┘
          │                    │                    │
          └────────────────────┼────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                         FASE 3                                  │
│                                                                 │
│  ZU-02 (Walkability)        ZA-00 (Observatório)               │
│  Precisa: ZU-01             Precisa: GEE, COS, IFAP            │
│                                                                 │
│  GI-04 (Dashboard Auto)     PS-02 (Aldeia 3D)                  │
│  Precisa: Cron setup        Precisa: Nada                      │
└─────────────────────────────────────────────────────────────────┘
```

### 8.2. Dependências Críticas

| Tarefa | Depende de | Bloqueia |
|--------|-----------|----------|
| Qualquer análise | MDT processado | - |
| Hidrologia | Derivados terreno | ZH-08, bacias |
| ZH-08 | Flow direction | - |
| ZU-01 | pgRouting setup | ZU-02 |
| ZA-00 | GEE auth | - |
| Martin tiles | PostGIS com dados | Viewer |

### 8.3. Tarefas Independentes (podem ser paralelas)

- PS-01 (StoryMap) - não depende de ZH-00
- PS-06 (Timelapse) - só precisa de GEE
- PS-02 (Aldeia 3D) - dados diferentes
- Download de dados - fazer enquanto setup

---

## 9. Riscos e Mitigação

### 9.1. Riscos Técnicos

| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| VM Oracle sem recursos | Baixa | Alto | Monitorizar, optimizar |
| MDT demasiado grande | Média | Médio | Usar 5m, processar em tiles |
| Performance Martin/TiTiler | Média | Médio | Cache, simplificação |
| Dependências Python conflito | Média | Baixo | Docker isolado |
| SSL/Certbot falha | Baixa | Baixo | Usar Cloudflare como backup |

### 9.2. Riscos de Tempo

| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| Subestimar tempo | Alta | Médio | Buffer de 50% nas estimativas |
| Rabbit holes técnicos | Alta | Médio | Timeboxing, MVP primeiro |
| Falta de motivação | Média | Alto | Quick wins frequentes |
| Interrupções (trabalho, vida) | Alta | Médio | Flexibilidade, priorizar |

### 9.3. Riscos de Dados

| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| Dados indisponíveis | Baixa | Alto | Verificar antes, alternativas |
| Qualidade de dados | Média | Médio | Validação, documentar limitações |
| Licenciamento confuso | Baixa | Médio | Verificar licenças, usar só abertos |

---

## 10. Marcos (Milestones)

### 10.1. Marcos Principais

| Marco | Descrição | Indicador de Sucesso | Target |
|-------|-----------|---------------------|--------|
| **M1** | Stack Online | HTTPS funcional, PostGIS acessível | Semana 2 |
| **M2** | Projecto Base | ZH-00 completo, viewer online | Semana 6 |
| **M3** | Primeiro Interactivo | ZH-08 (upstream/down) funcional | Semana 9 |
| **M4** | Portfolio Inicial | 5 projectos publicados | Semana 14 |
| **M5** | Dashboards | Agricultura + Acessibilidade | Semana 22 |
| **M6** | Automação | Cron jobs a correr | Semana 22 |
| **M7** | Contacto Externo | Resposta de autarquia | Semana 14 |
| **M8** | Artigo Submetido | Paper/artigo enviado | Mês 9 |

### 10.2. Celebrações 🎉

| Quando | Celebrar |
|--------|----------|
| M1 | Stack online! Screenshot + commit especial |
| M2 | Primeiro mapa público! LinkedIn post |
| M3 | Feature interactiva! Demo para amigos/colegas |
| M4 | Portfolio com substância! Actualizar LinkedIn |
| M7 | Validação externa! (resposta de autarquia) |

### 10.3. Revisões

| Quando | O quê |
|--------|-------|
| Fim de cada fase | Retrospectiva: o que correu bem/mal |
| Mensal | Rever backlog e prioridades |
| Trimestral | Rever objectivos de longo prazo |

---

## Notas Finais

### O Mais Importante

1. **Começar** - o plano é óptimo, mas só vale se executado
2. **Mostrar cedo** - não esperar pela perfeição
3. **Iterar** - melhorar com base em feedback
4. **Documentar** - o "eu" do futuro vai agradecer

### Primeiro Passo Concreto

> Amanhã: Abrir terminal, criar pasta do projecto, inicializar Git.

```bash
mkdir ~/gis-docker-stack
cd ~/gis-docker-stack
git init
echo "# GIS Docker Stack" > README.md
git add README.md
git commit -m "feat: initial commit"
```

Está feito. O resto é iteração.

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `04_BACKLOG_PROJECTOS.md` - Lista detalhada de projectos
- `05_PROJECTO_BASE_BIOFISICO.md` - Detalhe da Fase 1
- `08_PORTFOLIO_COMUNICACAO.md` - Estratégia de comunicação
- `99_STATUS.md` - Estado actual

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
