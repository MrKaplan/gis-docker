# 99 - STATUS DO PROJECTO

<!--
================================================================================
INSTRUÇÕES PARA CONTINUAR A CONVERSA NOUTRA JANELA
================================================================================

1. Abre uma nova conversa com o Claude

2. Cola esta mensagem inicial:

   "Olá Claude, estou a continuar um projecto de infraestrutura GIS. 
   Por favor lê os documentos MD que estão na pasta do projecto Claude 
   (ou no GitHub em [URL do repo]) e retoma a partir do ficheiro 99_STATUS.md.
   Confirma que percebeste o contexto e diz-me qual é o próximo passo."

3. Se os ficheiros estiverem no GitHub, podes dar o link directo:
   - Exemplo: "Lê este ficheiro: https://github.com/user/repo/blob/main/docs/99_STATUS.md"

4. O Claude vai ler o status e retomar exactamente onde parámos.

5. No final de cada sessão, pede ao Claude para actualizar este ficheiro.

================================================================================
-->

## Última Actualização
- **Data:** 2025-01-27
- **Sessão:** Conversa inicial de planeamento - DOCUMENTAÇÃO COMPLETA ✅

---

## 1. Documentos MD - Estado

### ✅ TODOS CRIADOS

| # | Documento | Conteúdo | Status |
|---|-----------|----------|--------|
| 00 | `00_VISAO_GERAL.md` | Contexto, objectivos, infraestrutura, área de estudo, decisões principais | ✅ Completo |
| 01 | `01_STACK_TECNICO.md` | Containers, bibliotecas, extensões, configurações, CI/CD | ✅ Completo |
| 02 | `02_ESTRUTURA_PASTAS.md` | Estrutura de directórios completa, gitignore, volumes | ✅ Completo |
| 03 | `03_AREA_ESTUDO.md` | Delimitação Médio Tejo, bacias, zonas temáticas, fontes de dados | ✅ Completo |
| 04 | `04_BACKLOG_PROJECTOS.md` | Lista completa de projectos por zona, standalone, grupos integrados | ✅ Completo |
| 05 | `05_PROJECTO_BASE_BIOFISICO.md` | ZH-00 detalhado: metodologia, código, cronograma | ✅ Completo |
| 06 | `06_TEMA1_AGRICULTURA.md` | Projectos ZA-01 a ZA-12, Observatório Agrícola | ✅ Completo |
| 07 | `07_TEMA2_AGUA.md` | Projectos ZH-01 a ZH-11, Upstream/Downstream, APIs | ✅ Completo |
| 08 | `08_PORTFOLIO_COMUNICACAO.md` | Estratégia, templates, LinkedIn, blog, métricas | ✅ Completo |
| 09 | `09_IDEIAS_PENDENTES.md` | Investigações, ideias de projectos, questões em aberto | ✅ Completo |
| 10 | `10_PROXIMOS_PASSOS.md` | Roadmap 4 fases, checklists, dependências, marcos | ✅ Completo |
| 11 | `11_GLOSSARIO_DECISOES.md` | Todas as decisões + glossário de termos | ✅ Completo |
| 99 | `99_STATUS.md` | Este ficheiro - estado da conversa | ✅ Completo |

**Total:** 13 documentos criados

---

## 2. Resumo do Planeamento

### 2.1. Stack Técnico Definido

| Container | Função |
|-----------|--------|
| postgis | PostgreSQL + PostGIS + pgRouting |
| qgis-server | WMS/WFS |
| martin | Vector tiles |
| titiler | Raster tiles (COG/STAC) |
| python-api | FastAPI |
| jupyter | Análise |
| nginx | Reverse proxy + SSL |
| cron | Tarefas agendadas |
| redis | Cache (opcional) |

**Excluídos:** GRASS GIS, SNAP, R, TimescaleDB

### 2.2. Área de Estudo

- **Região:** Médio Tejo
- **Critério:** Bacias hidrográficas completas (Almonda + Alviela)
- **4 Zonas Temáticas:**
  - 🌾 Agrícola (Golegã/Boquilobo)
  - 💧 Hídrica (Bacias + Castelo de Bode)
  - 🏙️ Urbana (Tomar/Abrantes)
  - 🗻 Cársica (Polje de Minde)

### 2.3. Projectos Definidos

| Zona | Quantidade | Exemplo Principal |
|------|------------|-------------------|
| ZH (Hídrica) | 11 | ZH-00 Caracterização Biofísica ⭐ |
| ZA (Agrícola) | 12 | ZA-00 Observatório Agrícola |
| ZU (Urbana) | 10 | ZU-01 Isócronas, ZU-02 Walkability |
| ZC (Cársica) | 5 | ZC-00 StoryMap Polje |
| PS (Standalone) | 6 | PS-02 Aldeia 3D, PS-04 Lixeiras |
| GI (Grupos) | 4 | GI-04 Dashboard Automático |

**Total:** ~48 projectos identificados

### 2.4. Análise de Temas

| Tema | Status |
|------|--------|
| Tema 1 - Agricultura | ✅ Analisado |
| Tema 2 - Água/Hidrologia | ✅ Analisado |
| Temas 3-14 | ⏳ Por analisar (Clima, Geologia, Floresta, Ecologia, Urbanismo, Transportes, Turismo, Saúde, Desastres, Infraestruturas, Economia, Geostatística) |

---

## 3. Decisões Principais Tomadas

### Stack
- ✅ 1 serviço = 1 container
- ✅ Martin para vector tiles (não pg_tileserv inicialmente)
- ✅ TiTiler para raster (COG/STAC on-the-fly)
- ✅ richdem + pysheds em vez de GRASS
- ✅ GEE para séries temporais e SAR

### Área de Estudo
- ✅ Bacias completas como critério (não limites admin)
- ✅ 4 zonas temáticas
- ✅ Abordagem focada (não análise homogénea)

### Projectos
- ✅ ZH-00 (Caracterização Biofísica) é PRIORITÁRIO
- ✅ Upstream/Downstream como feature interactiva
- ✅ Comparar bacias LiDAR vs APA
- ✅ Comparar erosão USLE vs REN

### Comunicação
- ✅ Hugo para site estático
- ✅ Português (código em inglês)
- ✅ Domínio pessoal
- ✅ Fluxo: Projecto → LinkedIn → Blog → Portfolio

---

## 4. Roadmap

### Fase 0: Preparação (1 semana)
- [ ] Tomar decisões finais pendentes
- [ ] Setup VM Oracle Cloud
- [ ] Delimitar área de estudo no QGIS
- [ ] Iniciar downloads de dados

### Fase 1: Fundações (Mês 1-2)
- [ ] Setup stack Docker
- [ ] ZH-00: Derivados de terreno
- [ ] ZH-00: Derivados hidrológicos
- [ ] Primeiro viewer online
- [ ] Primeiro post LinkedIn

### Fase 2: Primeiros Projectos (Mês 3-4)
- [ ] ZH-08: Upstream/Downstream
- [ ] ZU-01: Isócronas
- [ ] PS-01: StoryMap Polje
- [ ] PS-06: GEE Timelapse
- [ ] 4+ posts LinkedIn, 2+ artigos blog

### Fase 3: Expansão (Mês 5-6)
- [ ] ZU-02: Walkability
- [ ] ZA-00: Observatório Agrícola
- [ ] GI-04: Dashboard Automático
- [ ] PS-02: Aldeia 3D

### Fase 4: Consolidação (Mês 7+)
- [ ] Completar zonas temáticas
- [ ] Analisar temas 3-14
- [ ] Artigo técnico
- [ ] News ON GIS

---

## 5. Decisões Pendentes

| Decisão | Opções | Prazo |
|---------|--------|-------|
| Nome das zonas temáticas | Zonas Temáticas / Núcleos / Áreas | Fase 0 |
| Limite oeste exacto | Baseado em bacias | Fase 0 |
| Resolução MDT desenvolvimento | 2m / 5m | Fase 0 |
| SCIMAP viável? | Investigar | Fase 2 |
| pg_tileserv necessário? | Avaliar após Martin | Fase 2 |

---

## 6. Investigações Pendentes

- [ ] SCIMAP: dados necessários, viabilidade no stack
- [ ] API DGT para LiDAR (WCS?)
- [ ] InSAR subsidência: usar EGMS ou processar?
- [ ] SNIRH: API ou scraping?
- [ ] Completude OSM na área de estudo
- [ ] GTFS transportes públicos disponível?

---

## 7. Próximo Passo Imediato

**A documentação está completa.**

O próximo passo é começar a **Fase 0: Preparação**:

1. ⬜ Tomar decisões pendentes (nome das zonas, resolução MDT)
2. ⬜ Criar conta Oracle Cloud (se não tiver)
3. ⬜ Provisionar VM ARM Free Tier
4. ⬜ Abrir QGIS e delimitar área de estudo
5. ⬜ Exportar `extent.geojson`
6. ⬜ Identificar folhas LiDAR necessárias
7. ⬜ Iniciar downloads

---

## 8. Contactos Identificados

| Entidade | Projecto | Status |
|----------|----------|--------|
| Junta de Minde | StoryMap Polje | 💡 Por contactar |
| CM Golegã | Observatório Agrícola | 💡 Por contactar |
| CM Tomar | Acessibilidade Urbana | 💡 Por contactar |
| Limpar Portugal | Lixeiras | 💡 Por contactar |

---

## 9. Métricas de Sucesso (12 meses)

| Métrica | Objectivo |
|---------|-----------|
| Projectos no portfolio | 15+ |
| Posts LinkedIn | 50+ |
| Artigos blog | 20+ |
| Seguidores LinkedIn | +500 |
| Colaboração autárquica | 1+ |
| Proposta profissional | 1+ |

---

## Histórico de Sessões

| Data | Actividade | Resultado |
|------|------------|-----------|
| 2025-01-27 | Conversa inicial de planeamento | ✅ Stack definido, área definida, projectos identificados, 13 documentos MD criados |

---

## Ficheiros no Repositório

```
docs/
├── 00_VISAO_GERAL.md
├── 01_STACK_TECNICO.md
├── 02_ESTRUTURA_PASTAS.md
├── 03_AREA_ESTUDO.md
├── 04_BACKLOG_PROJECTOS.md
├── 05_PROJECTO_BASE_BIOFISICO.md
├── 06_TEMA1_AGRICULTURA.md
├── 07_TEMA2_AGUA.md
├── 08_PORTFOLIO_COMUNICACAO.md
├── 09_IDEIAS_PENDENTES.md
├── 10_PROXIMOS_PASSOS.md
├── 11_GLOSSARIO_DECISOES.md
└── 99_STATUS.md
```

---

*Actualizar este ficheiro no final de cada sessão de trabalho.*
*Última actualização: 2025-01-27*
