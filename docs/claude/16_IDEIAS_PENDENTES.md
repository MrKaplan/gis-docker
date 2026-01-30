# 16 - IDEIAS PENDENTES

## Índice
1. [Sobre Este Documento](#1-sobre-este-documento)
2. [Investigações Técnicas](#2-investigações-técnicas)
3. [Ideias de Projectos](#3-ideias-de-projectos)
4. [Melhorias ao Stack](#4-melhorias-ao-stack)
5. [Fontes de Dados a Explorar](#5-fontes-de-dados-a-explorar)
6. [Questões em Aberto](#6-questões-em-aberto)
7. [Contactos a Fazer](#7-contactos-a-fazer)
8. [Leituras e Aprendizagem](#8-leituras-e-aprendizagem)
9. [Ideias de Comunicação](#9-ideias-de-comunicação)
10. [Parking Lot](#10-parking-lot)

---

## 1. Sobre Este Documento

### 1.1. Propósito

Este documento serve como **repositório de ideias** - tudo o que surgiu durante o planeamento mas que:
- Não tem prioridade imediata
- Precisa de mais investigação
- É uma ideia vaga que pode (ou não) tornar-se projecto
- São questões sem resposta ainda

### 1.2. Como Usar

- Rever periodicamente (mensal)
- Mover ideias maduras para o backlog (`04_BACKLOG_PROJECTOS.md`)
- Eliminar ideias que já não fazem sentido
- Adicionar novas ideias conforme surgem

### 1.3. Legenda de Status

| Emoji | Significado |
|-------|-------------|
| 💡 | Ideia nova, por explorar |
| 🔍 | Em investigação |
| ✅ | Investigado, pronto para decisão |
| ❌ | Descartado (manter para histórico) |
| ⏸️ | Pausado (voltar mais tarde) |

---

## 2. Investigações Técnicas

### 2.1. 🔍 SCIMAP - Modelação de Poluição Difusa

**O que é:** Ferramenta de modelação de conectividade hidrológica e risco de poluição difusa.

**Questões a investigar:**
- [ ] Corre em SAGA GIS - quão pesado é?
- [ ] Quais os dados de entrada necessários?
- [ ] Existe implementação Python?
- [ ] Vale a pena o esforço vs. abordagem simplificada?

**Links a explorar:**
- https://www.scimap.org.uk/
- Documentação SAGA GIS

**Decisão pendente:** Incluir no stack ou usar abordagem simplificada (ZH-09)?

---

### 2.2. 🔍 API DGT para LiDAR

**Questão:** É possível aceder ao MDT LiDAR via WCS em vez de download manual?

**A investigar:**
- [ ] Serviços WCS disponíveis no SNIG
- [ ] Cobertura e resolução disponível
- [ ] Performance para processamento on-demand
- [ ] Alternativa: criar COGs próprios e servir via TiTiler

**Potencial benefício:** Evitar armazenar GB de dados localmente.

---

### 2.3. 🔍 InSAR para Subsidência

**Contexto:** Detectar movimentos de terreno (subsidência) no Polje de Minde e zona cársica.

**Questões:**
- [ ] Sentinel-1 tem resolução suficiente?
- [ ] Quais bibliotecas Python existem? (ISCE, SNAP via linha de comando?)
- [ ] É demasiado complexo para o âmbito actual?
- [ ] Existem dados já processados (ex: European Ground Motion Service)?

**Links:**
- European Ground Motion Service: https://egms.land.copernicus.eu/
- ISCE: https://github.com/isce-framework/isce2

**Decisão pendente:** Usar dados EGMS pré-processados ou tentar processar?

---

### 2.4. 💡 HEC-RAS Integration

**Ideia:** Integrar resultados de modelação HEC-RAS no WebGIS.

**Abordagem possível:**
1. Fazer modelação em desktop (HEC-RAS)
2. Exportar manchas de inundação (shapefile)
3. Importar para PostGIS
4. Publicar via Martin

**Questões:**
- [ ] Vale a pena aprender HEC-RAS?
- [ ] Existem dados de secções transversais?
- [ ] Alternativa mais simples para zonas de cheia?

---

### 2.5. 💡 pg_tileserv vs Martin

**Questão:** Precisamos dos dois ou um é suficiente?

**Diferenças conhecidas:**
| Feature | Martin | pg_tileserv |
|---------|--------|-------------|
| Performance | Muito bom | Bom |
| Funções SQL | Não | Sim |
| Configuração | Config file | Auto-discover |

**Decisão provisória:** Começar só com Martin, adicionar pg_tileserv se precisarmos de funções SQL dinâmicas.

---

### 2.6. 💡 Autenticação no Jupyter

**Questão:** Como proteger o JupyterLab exposto na web?

**Opções:**
- [ ] Token de acesso (default)
- [ ] Password
- [ ] OAuth via Nginx (mais complexo)
- [ ] Só expor em VPN/localhost

**Decisão pendente:** Definir estratégia de segurança.

---

## 3. Ideias de Projectos

### 3.1. 💡 Detecção de Lixeiras com Satélite

**Ideia:** Usar imagens Sentinel-2 ou de maior resolução para detectar automaticamente lixeiras clandestinas.

**Desafios:**
- Resolução Sentinel-2 (10m) pode ser insuficiente
- Lixeiras são pequenas e variáveis
- Falsos positivos (terrenos baldios, obras)

**Alternativa:** Planet (3m) ou imagens comerciais - mas têm custo.

**Status:** 💡 Ideia interessante mas provavelmente inviável com dados gratuitos.

---

### 3.2. 💡 Histórico de Cheias com Jornais

**Ideia:** Criar base de dados de cheias históricas a partir de notícias de jornais locais.

**Dados:**
- Arquivo de jornais digitalizados
- Hemeroteca Digital (BNP)
- Jornais locais (O Mirante, etc.)

**Output:** 
- Mapa de ocorrências históricas
- Integrar no StoryMap do Polje

**Status:** 💡 Interessante para enriquecer ZC-01, mas trabalhoso.

---

### 3.3. 💡 Análise de Nomes de Lugares (Toponímia)

**Ideia:** Analisar toponímia para inferir características históricas do território.

**Exemplos:**
- "Paul" → zona húmida
- "Ribeira de..." → curso de água (mesmo que seco)
- "Alto/Outeiro" → elevação
- "Lameiro" → zona húmida/agrícola

**Output:** Mapa de toponímia classificada, correlação com features actuais.

**Status:** 💡 Projecto interessante de "GIS + linguística".

---

### 3.4. 💡 Evolução da Feira da Golegã

**Ideia:** Mapear a evolução espacial da Feira Nacional do Cavalo ao longo das décadas.

**Dados:**
- Fotografias aéreas históricas
- Ortofotomapas de diferentes anos
- Registos da câmara

**Output:** Animação/StoryMap da evolução.

**Status:** 💡 Projecto local interessante, bom para contacto com CM Golegã.

---

### 3.5. 💡 Mapa de Ruído (simplificado)

**Ideia:** Criar mapa de ruído estimado com base em proximidade a estradas.

**Metodologia:**
- Buffer por tipo de via
- Modelo de atenuação com distância
- Não é mapa de ruído oficial, mas indicativo

**Status:** 💡 Pode ser integrado em análise urbana (ZU).

---

### 3.6. 💡 Potencial Fotovoltaico

**Ideia:** Mapear o potencial de instalação de painéis fotovoltaicos.

**Factores:**
- Radiação solar (dados PVGIS)
- Orientação de telhados (se houver dados)
- Áreas disponíveis
- Proximidade a rede eléctrica

**Bibliotecas:** `pvlib` (já no stack)

**Status:** 💡 Projecto interessante, alinhado com transição energética.

---

### 3.7. 💡 Mapeamento de Árvores Urbanas

**Ideia:** Criar inventário de árvores urbanas em Tomar ou Abrantes.

**Abordagem:**
- Extrair de LiDAR (CHM - Canopy Height Model)
- Ou recolha de campo com app
- Classificar por espécie (se possível)

**Benefícios:** Gestão municipal, ilhas de calor, biodiversidade urbana.

**Status:** 💡 Projecto standalone interessante.

---

### 3.8. 💡 Comparação PDM vs Realidade

**Ideia:** Comparar zonamento do PDM com ocupação real do solo.

**Análise:**
- Onde há urbanização em solo rural?
- Onde há agricultura em solo urbano?
- Cumprimento de REN/RAN

**Output:** Mapa de "conformidade urbanística".

**Status:** 💡 Tecnicamente fácil, mas pode ser sensível politicamente.

---

## 4. Melhorias ao Stack

### 4.1. 💡 Backup Automático

**Questão:** Como fazer backup automático do PostGIS?

**Opções:**
- [ ] pg_dump via cron
- [ ] Backup para S3/Object Storage
- [ ] Replicação

**Prioridade:** Média (fazer antes de ter dados importantes).

---

### 4.2. 💡 Monitorização com Netdata

**Ideia:** Instalar Netdata para monitorizar recursos do servidor.

**Benefícios:**
- Ver uso de CPU, RAM, disco em tempo real
- Alertas
- Histórico

**Recurso:** ~100MB RAM

**Status:** 💡 Fazer durante setup inicial do stack.

---

### 4.3. 💡 CI/CD com GitHub Actions

**Ideia:** Automatizar deploy quando há push para main.

**Workflow:**
1. Push para main
2. GitHub Action conecta via SSH
3. Pull + docker-compose up

**Status:** 💡 Implementar após stack estável.

---

### 4.4. 💡 Cache de Tiles com Redis

**Questão:** Vale a pena usar Redis para cache de tiles?

**Alternativa:** Cache no Nginx (já planeado) pode ser suficiente.

**Decisão:** Começar sem Redis, adicionar se necessário.

---

### 4.5. 💡 Logging Centralizado

**Ideia:** Agregar logs de todos os containers num local.

**Opções:**
- Loki + Grafana (pode ser pesado)
- Simples: montar volume comum + logrotate
- Docker logging driver

**Status:** 💡 Nice to have, não prioritário.

---

## 5. Fontes de Dados a Explorar

### 5.1. 💡 IFAP - Parcelas Agrícolas

**Descoberta:** Parcelas agrícolas do IFAP estão em dados.gov.pt!

**A fazer:**
- [ ] Descarregar e explorar estrutura
- [ ] Verificar cobertura temporal
- [ ] Integrar em ZA-02 (ocupação temporal)

**URL:** https://dados.gov.pt (pesquisar IFAP)

---

### 5.2. 💡 SNIRH - API ou Scraping?

**Questão:** O SNIRH tem API oficial ou é preciso scraping?

**A investigar:**
- [ ] Documentação de API
- [ ] Estrutura das páginas para scraping
- [ ] Frequência de actualização

**Dados interessantes:** Níveis albufeiras, caudais, qualidade água.

---

### 5.3. 💡 OpenStreetMap - Completude

**Questão:** Quão completo está o OSM na área de estudo?

**A verificar:**
- [ ] Rede viária
- [ ] Edifícios
- [ ] POIs (serviços, comércio)
- [ ] Trilhos pedestres

**Se incompleto:** Contribuir para OSM como side project.

---

### 5.4. 💡 Censos 2021

**Questão:** Já estão disponíveis dados georreferenciados dos Censos 2021?

**A verificar:**
- [ ] INE - BGRI 2021
- [ ] Formato e variáveis disponíveis
- [ ] Comparação com 2011

---

### 5.5. 💡 Dados de Incêndios

**Fonte:** ICNF - perímetros de área ardida

**Potenciais projectos:**
- Evolução de área ardida na região
- Recuperação pós-fogo (NBR temporal)
- Risco de incêndio

---

### 5.6. 💡 Dados de Transportes Públicos

**Questão:** Existem dados GTFS para a região?

**A investigar:**
- [ ] Rodoviária do Tejo
- [ ] CP (comboios)
- [ ] Transdev ou outros operadores

**Se não existir GTFS:** Criar a partir de horários (trabalhoso).

---

## 6. Questões em Aberto

### 6.1. ❓ Nome das Zonas Temáticas

**Questão:** Qual o melhor nome para os "clusters"?

**Opções:**
- Zonas Temáticas
- Núcleos de Análise
- Áreas de Foco
- Domínios Territoriais
- Unidades de Análise

**Decisão:** A tomar antes de publicar.

---

### 6.2. ❓ Limite Oeste da Área de Estudo

**Questão:** Onde exactamente fica o limite oeste?

**Opções:**
- Limite das bacias Almonda/Alviela
- Incluir parte da Serra de Aire
- Usar limite administrativo

**A fazer:** Definir no QGIS com base nos dados de bacias.

---

### 6.3. ❓ Resolução do MDT

**Questão:** Usar 2m (original) ou reamostrar para 5m?

**Trade-offs:**
| Resolução | Vantagem | Desvantagem |
|-----------|----------|-------------|
| 2m | Mais preciso | Ficheiros grandes, processamento lento |
| 5m | Mais leve | Perde detalhe |

**Decisão provisória:** Começar com 5m para desenvolvimento, 2m para outputs finais.

---

### 6.4. ❓ Língua do Site/Blog

**Questão:** Português ou Inglês?

**Argumentos:**
- **Português:** Público local, autarquias, SEO em PT
- **Inglês:** Maior alcance, recrutadores internacionais
- **Bilingue:** Mais trabalho, mas mais alcance

**Decisão provisória:** Português para blog/comunicação local, código/GitHub em inglês.

---

### 6.5. ❓ Domínio Pessoal vs Projecto

**Questão:** Registar domínio pessoal (nome.pt) ou de projecto (mediotejo-gis.pt)?

**Recomendação:** Domínio pessoal - mais versátil a longo prazo.

---

## 7. Contactos a Fazer

### 7.1. 💡 Câmaras Municipais

| Câmara | Projecto Relacionado | Contacto | Status |
|--------|---------------------|----------|--------|
| Golegã | Observatório Agrícola | A identificar | 💡 |
| Tomar | Acessibilidade Urbana | A identificar | 💡 |
| Abrantes | Acessibilidade Urbana | A identificar | 💡 |
| Torres Novas | Hidrologia Almonda | A identificar | 💡 |

### 7.2. 💡 Juntas de Freguesia

| Junta | Projecto | Status |
|-------|----------|--------|
| Minde | StoryMap Polje | 💡 |
| Aldeia do Xisto (várias) | Modelo 3D | 💡 |

### 7.3. 💡 Outras Entidades

| Entidade | Interesse | Status |
|----------|-----------|--------|
| ICNF | Paul do Boquilobo | 💡 |
| Limpar Portugal | Lixeiras | 💡 |
| APA | Dados hidrológicos | 💡 |
| Universidades | Colaboração/dados | 💡 |

---

## 8. Leituras e Aprendizagem

### 8.1. 📚 Tutoriais a Seguir

- [ ] pysheds documentation
- [ ] richdem examples
- [ ] FastAPI best practices
- [ ] Martin configuration
- [ ] TiTiler advanced usage

### 8.2. 📚 Artigos Científicos

- [ ] USLE methodology papers
- [ ] TWI applications
- [ ] Remote sensing for water quality
- [ ] Urban accessibility metrics

### 8.3. 📚 Cursos/Formações

- [ ] Google Earth Engine (Coursera/oficial)
- [ ] Docker para data science
- [ ] PostGIS avançado

### 8.4. 📚 Livros

- [ ] "Geocomputation with Python"
- [ ] "PostGIS in Action"

---

## 9. Ideias de Comunicação

### 9.1. 💡 Série "Dados Abertos em Portugal"

**Ideia:** Série de posts/artigos sobre fontes de dados abertos em PT.

**Posts possíveis:**
1. LiDAR e MDT da DGT
2. Carta de Ocupação do Solo (COS)
3. Dados do INE (Censos, BGRI)
4. SNIRH - dados hídricos
5. IPMA - dados meteorológicos
6. Parcelas IFAP

**Status:** 💡 Bom conteúdo evergreen.

---

### 9.2. 💡 Vídeos/Screencasts

**Ideia:** Criar vídeos curtos de tutoriais.

**Plataformas:** YouTube, LinkedIn native video

**Temas:**
- "5 minutos de QGIS"
- "Como fazer X em Python"
- Demo de WebGIS

**Recursos necessários:** Software de gravação, microfone

**Status:** 💡 Fase posterior, após estabelecer presença escrita.

---

### 9.3. 💡 Newsletter

**Ideia:** Newsletter mensal com actualizações.

**Conteúdo:**
- Novos projectos
- Artigos publicados
- Dados descobertos
- Dicas rápidas

**Ferramentas:** Buttondown, Substack (grátis)

**Status:** 💡 Só se houver audiência suficiente.

---

### 9.4. 💡 Contribuir para Blogs/Sites

**Ideia:** Escrever guest posts para sites GIS.

**Potenciais:**
- GIS Lounge
- GeoHipster
- Blogs de empresas GIS portuguesas

**Benefício:** Backlinks, visibilidade, networking

**Status:** 💡 Após ter portfolio sólido.

---

## 10. Parking Lot

Ideias muito vagas ou de longo prazo que não encaixam nas outras categorias.

### 10.1. 💭 Aplicação Móvel de Recolha

**Ideia vaga:** App para recolha de dados no terreno.

**Alternativa mais simples:** KoboToolbox, ODK, QField

---

### 10.2. 💭 Consultoria para Autarquias

**Ideia de longo prazo:** Oferecer serviços de consultoria GIS.

**Pré-requisitos:** Portfolio sólido, contactos, reputação

---

### 10.3. 💭 Curso/Workshop GIS

**Ideia:** Dar formação de GIS.

**Formato:** Online ou presencial, introdutório ou avançado

**Pré-requisitos:** Experiência comprovada, materiais preparados

---

### 10.4. 💭 Dados como Serviço

**Ideia:** Vender/licenciar dados processados.

**Realidade:** Mercado pequeno em PT, maioria dos dados são abertos

**Alternativa:** Oferecer como open data, monetizar serviços

---

### 10.5. 💭 Plugin QGIS

**Ideia:** Desenvolver plugin para QGIS.

**Possibilidades:**
- Acesso simplificado a dados portugueses
- Ferramenta específica de análise
- Interface para API própria

---

## Histórico de Actualizações

| Data | Alteração |
|------|-----------|
| 2025-01-27 | Criação inicial com ideias da sessão de planeamento |

---

## Documentos Relacionados

- `04_BACKLOG_PROJECTOS.md` - Onde ideias maduras são movidas
- `10_PROXIMOS_PASSOS.md` - Prioridades imediatas
- `99_STATUS.md` - Estado geral

---

*Este documento deve ser revisto mensalmente. Última revisão: Janeiro 2025*
