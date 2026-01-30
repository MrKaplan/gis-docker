# 08 - PORTFOLIO E COMUNICAÇÃO

## Índice
1. [Visão Geral](#1-visão-geral)
2. [Arquitectura de Presença Online](#2-arquitectura-de-presença-online)
3. [Fluxo de Comunicação](#3-fluxo-de-comunicação)
4. [LinkedIn](#4-linkedin)
5. [Blog](#5-blog)
6. [Portfolio](#6-portfolio)
7. [GitHub](#7-github)
8. [WebGIS](#8-webgis)
9. [Templates](#9-templates)
10. [Calendário Editorial](#10-calendário-editorial)
11. [Métricas de Sucesso](#11-métricas-de-sucesso)

---

## 1. Visão Geral

### 1.1. Objectivo

Transformar **trabalho técnico em visibilidade profissional**, criando uma presença online coerente que demonstre competências e atraia oportunidades.

### 1.2. Princípios

| Princípio | Descrição |
|-----------|-----------|
| **Consistência** | Publicar regularmente, não em rajadas |
| **Qualidade > Quantidade** | Menos posts, mas bem trabalhados |
| **Storytelling** | Contar histórias, não só mostrar mapas |
| **Valor primeiro** | Dar antes de pedir (dados abertos, tutoriais) |
| **Autenticidade** | Mostrar processo, incluindo dificuldades |

### 1.3. Públicos-Alvo

| Público | Onde está | O que quer ver |
|---------|-----------|----------------|
| **Recrutadores** | LinkedIn | Portfolio, competências, projectos |
| **Técnicos GIS** | LinkedIn, Twitter, blogs | Tutoriais, código, metodologias |
| **Investigadores** | ResearchGate, blogs | Dados abertos, metodologias |
| **Autarquias** | Email, LinkedIn | Soluções práticas, demonstrações |
| **Público geral** | Redes sociais | Mapas bonitos, histórias locais |

---

## 2. Arquitectura de Presença Online

### 2.1. Estrutura

```
┌─────────────────────────────────────────────────────────────┐
│                     DOMÍNIO PRÓPRIO                         │
│                    meudominio.pt                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   /                    Landing page (Hugo)                  │
│   │                    - Quem sou                           │
│   │                    - O que faço                         │
│   │                    - Links para secções                 │
│   │                                                         │
│   ├── /blog            Artigos técnicos                     │
│   │                    - Tutoriais                          │
│   │                    - Explicações de projectos           │
│   │                    - Reflexões                          │
│   │                                                         │
│   ├── /portfolio       Showcase de projectos                │
│   │                    - Screenshots                        │
│   │                    - Descrições curtas                  │
│   │                    - Links para demos                   │
│   │                                                         │
│   ├── /webgis          Aplicações interactivas              │
│   │   ├── /hidrologia                                       │
│   │   ├── /agricultura                                      │
│   │   └── /acessibilidade                                   │
│   │                                                         │
│   └── /cv              CV interactivo ou PDF                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                              │
                              │ Links para
                              ▼
┌──────────────┬──────────────┬──────────────┬───────────────┐
│   LinkedIn   │    GitHub    │   Twitter    │  ResearchGate │
│   (posts)    │   (código)   │  (opcional)  │  (artigos)    │
└──────────────┴──────────────┴──────────────┴───────────────┘
```

### 2.2. Tecnologias

| Componente | Tecnologia | Razão |
|------------|------------|-------|
| Site estático | Hugo | Rápido, Markdown, themes bonitos |
| Theme Hugo | PaperMod / Stack / Congo | Clean, profissional |
| Hosting | GitHub Pages ou Netlify | Grátis, fácil deploy |
| WebGIS | Leaflet + HTML/JS | Simples, leve |
| Mapas no blog | Screenshots + links | Não sobrecarregar |

### 2.3. Domínio

**Opções:**
- `nome.pt` (pessoal)
- `gis-portfolio.pt` (genérico)
- `mediotejo-gis.pt` (projecto específico)

**Recomendação:** Domínio pessoal para longevidade.

---

## 3. Fluxo de Comunicação

### 3.1. Por Projecto Completo

```
┌─────────────────┐
│    PROJECTO     │
│    CONCLUÍDO    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐     ┌─────────────────┐
│    LinkedIn     │────►│    Engagement   │
│    Post         │     │    (comentários)│
└────────┬────────┘     └─────────────────┘
         │
         │ 2-3 dias depois
         ▼
┌─────────────────┐
│    Artigo       │
│    Blog         │
└────────┬────────┘
         │
         │ Mesmo dia
         ▼
┌─────────────────┐
│    Entrada      │
│    Portfolio    │
└────────┬────────┘
         │
         │ Se aplicável
         ▼
┌─────────────────┐
│    WebGIS       │
│    Demo         │
└────────┬────────┘
         │
         │ Se relevante
         ▼
┌─────────────────┐
│    Contacto     │
│    Autarquias   │
└─────────────────┘
```

### 3.2. Timing

| Acção | Quando | Duração |
|-------|--------|---------|
| LinkedIn post | Dia 1 | 30-60 min |
| Artigo blog | Dia 2-4 | 2-4 horas |
| Portfolio entry | Com artigo | 15 min |
| WebGIS deploy | Antes do post | Já feito |
| Contacto externo | Dia 5-7 | 30 min |

### 3.3. Frequência Ideal

| Canal | Frequência | Notas |
|-------|------------|-------|
| LinkedIn | 1-2x/semana | Qualidade > quantidade |
| Blog | 2-4x/mês | Artigos substanciais |
| Portfolio | Por projecto | Sempre que há novo |
| GitHub | Contínuo | Commits regulares |

---

## 4. LinkedIn

### 4.1. Optimização do Perfil

**Headline:**
```
GIS Analyst | Spatial Data | Python | Remote Sensing | Open Data
```

**About (exemplo):**
```
Profissional de GIS com foco em análise espacial, ordenamento do 
território e detecção remota. Desenvolvo soluções que transformam 
dados geográficos em insights accionáveis.

🗺️ Especialidades:
• Análise hidrológica e de terreno
• Processamento de imagens de satélite
• WebGIS e dashboards interactivos
• Automação com Python

📊 Projectos recentes:
• Caracterização biofísica do Médio Tejo (open data)
• Observatório agrícola com dados Sentinel-2
• Ferramenta interactiva de análise de bacias

🔗 Portfolio: meudominio.pt
📧 Contacto: email@dominio.pt
```

**Featured:**
- Link para portfolio
- Post com mais engagement
- Artigo mais relevante

### 4.2. Tipos de Posts

| Tipo | Frequência | Exemplo |
|------|------------|---------|
| **Projecto completo** | 2-3x/mês | "Lancei o Observatório Agrícola..." |
| **Quick win** | 1x/semana | "Dica rápida: como fazer X em QGIS" |
| **Behind the scenes** | 1x/semana | "O processo de criar este mapa..." |
| **Partilha de recurso** | 1x/semana | "Descobri esta fonte de dados..." |
| **Opinião/reflexão** | 1-2x/mês | "Porque é que open data importa..." |

### 4.3. Estrutura de Post (Projecto)

```
[HEADLINE FORTE - max 2 linhas]

[HOOK - 1ª frase que prende atenção]

[CONTEXTO - 2-3 frases sobre o problema/necessidade]

[SOLUÇÃO - O que fizeste, bullet points]
📊 Ponto 1
🗺️ Ponto 2
💡 Ponto 3

[RESULTADO - O que se pode ver/usar]

[CTA - Call to action]
Link nos comentários 👇

[HASHTAGS - 3-5 relevantes]
#GIS #Python #OpenData #RemoteSensing #Portugal
```

### 4.4. Melhores Práticas

| Fazer ✅ | Evitar ❌ |
|----------|----------|
| Imagens de alta qualidade | Screenshots pixelados |
| Primeira frase impactante | Começar com "Olá a todos" |
| Bullet points legíveis | Parágrafos enormes |
| Hashtags no final | Hashtags no meio do texto |
| Responder a comentários | Ignorar engagement |
| Publicar manhã/almoço | Publicar de madrugada |
| Texto em português | Misturar idiomas |

### 4.5. Horários Óptimos (Portugal)

| Dia | Melhor horário |
|-----|----------------|
| Terça | 8h-9h, 12h-13h |
| Quarta | 8h-9h, 12h-13h |
| Quinta | 8h-9h, 12h-13h |

**Evitar:** Segunda (pessoas a organizar semana), Sexta tarde, Fim-de-semana

---

## 5. Blog

### 5.1. Categorias

| Categoria | Descrição | Exemplo |
|-----------|-----------|---------|
| **Tutoriais** | Passo-a-passo técnico | "Como extrair bacias com Python" |
| **Projectos** | Explicação de projectos | "Observatório Agrícola: metodologia" |
| **Ferramentas** | Reviews e comparações | "TiTiler vs pg_tileserv" |
| **Dados** | Fontes e processamento | "Dados LiDAR em Portugal: guia" |
| **Reflexões** | Opinião e tendências | "O futuro do GIS em Portugal" |

### 5.2. Estrutura de Artigo (Tutorial)

```markdown
# Título Claro e Específico

**TL;DR:** Resumo em 2-3 frases.

## Introdução
- Contexto
- O que vamos fazer
- Pré-requisitos

## Dados
- Fontes
- Como obter
- Estrutura

## Metodologia
### Passo 1: Preparação
[código e explicação]

### Passo 2: Processamento
[código e explicação]

### Passo 3: Visualização
[código e explicação]

## Resultados
- Screenshots
- Métricas
- Interpretação

## Conclusão
- O que aprendemos
- Limitações
- Próximos passos

## Recursos
- Links para código
- Links para dados
- Referências

---
*Publicado em [data]. Código disponível no [GitHub].*
```

### 5.3. Estrutura de Artigo (Projecto)

```markdown
# Nome do Projecto

**Resumo:** O que é, para quem, porquê.

![Imagem principal](hero.png)

## Contexto
- Problema ou oportunidade
- Porquê esta área/tema

## Objectivos
- O que queríamos alcançar

## Dados Utilizados
| Dado | Fonte | Formato |
|------|-------|---------|
| ... | ... | ... |

## Metodologia
[Explicação acessível, com diagramas]

## Resultados
[Screenshots, mapas, gráficos]

## Como Usar
- Link para WebGIS
- Link para download

## Lições Aprendidas
- O que correu bem
- O que foi difícil
- O que faria diferente

## Próximos Passos
- Melhorias planeadas

---
*Projecto desenvolvido em [data]. [Links]*
```

### 5.4. SEO Básico

| Elemento | Recomendação |
|----------|--------------|
| Título | Incluir palavras-chave principais |
| URL | Curto, com palavras-chave |
| Meta description | 150-160 caracteres |
| Headings | H1 para título, H2 para secções |
| Imagens | Alt text descritivo |
| Links internos | Ligar a outros artigos |

---

## 6. Portfolio

### 6.1. Estrutura de Entrada

```yaml
# content/portfolio/medio-tejo-biofisica.md

---
title: "Caracterização Biofísica do Médio Tejo"
date: 2025-XX-XX
tags: ["Python", "Hidrologia", "LiDAR", "Open Data"]
image: "/images/portfolio/medio-tejo-thumb.png"
demo: "https://hidrologia.meudominio.pt"
github: "https://github.com/user/medio-tejo-biofisica"
featured: true
weight: 1
---

## Descrição
Conjunto de dados de caracterização biofísica derivados de MDT LiDAR,
incluindo análise de terreno e hidrologia para a região do Médio Tejo.

## Tecnologias
- Python (rasterio, pysheds, richdem)
- PostGIS
- TiTiler / Martin
- Leaflet

## Destaques
- 15+ camadas derivadas
- Dados disponíveis em open data
- API de análise upstream/downstream

## Screenshots
![Screenshot 1](screenshot1.png)
![Screenshot 2](screenshot2.png)
```

### 6.2. Campos por Projecto

| Campo | Obrigatório | Descrição |
|-------|-------------|-----------|
| title | ✅ | Nome do projecto |
| date | ✅ | Data de conclusão |
| tags | ✅ | Tecnologias/temas |
| image | ✅ | Thumbnail (800x600 px) |
| description | ✅ | 2-3 frases |
| demo | ⚠️ | Link para demo (se existir) |
| github | ⚠️ | Link para repo (se público) |
| blog | ⚠️ | Link para artigo (se existir) |
| featured | ❌ | Destacar na homepage |

### 6.3. Organização Visual

```
PORTFOLIO
│
├── 🌟 DESTAQUES (featured)
│   ├── Caracterização Biofísica
│   ├── Upstream/Downstream
│   └── Observatório Agrícola
│
├── 📂 POR CATEGORIA
│   ├── Hidrologia
│   ├── Agricultura
│   ├── Urbanismo
│   └── 3D/Visualização
│
└── 🔍 FILTROS
    ├── Por tecnologia (Python, QGIS, GEE...)
    ├── Por ano
    └── Por tipo (análise, webgis, dados)
```

---

## 7. GitHub

### 7.1. Perfil README

```markdown
# Olá! 👋

Sou [Nome], profissional de GIS em Portugal.

## 🗺️ O que faço
- Análise espacial e hidrológica
- Processamento de imagens de satélite
- Desenvolvimento de WebGIS
- Automação com Python

## 📊 Projectos em Destaque

### [Médio Tejo - Caracterização Biofísica](link)
Dados abertos de análise hidrológica e de terreno para a região do Médio Tejo.

### [Observatório Agrícola](link)
Dashboard de monitorização agrícola com dados Sentinel-2.

## 🛠️ Tecnologias
![Python](https://img.shields.io/badge/-Python-3776AB?style=flat&logo=python&logoColor=white)
![QGIS](https://img.shields.io/badge/-QGIS-589632?style=flat&logo=qgis&logoColor=white)
![PostGIS](https://img.shields.io/badge/-PostGIS-336791?style=flat&logo=postgresql&logoColor=white)

## 📫 Contacto
- 🌐 [Portfolio](https://meudominio.pt)
- 💼 [LinkedIn](https://linkedin.com/in/...)
- 📧 email@dominio.pt
```

### 7.2. Estrutura de README por Repo

```markdown
# Nome do Projecto

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)](https://python.org)

Descrição curta do projecto em 1-2 frases.

![Screenshot](docs/images/screenshot.png)

## 🎯 Objectivos
- Objectivo 1
- Objectivo 2

## 📊 Dados
| Dado | Fonte | Licença |
|------|-------|---------|
| MDT | DGT | Aberta |

## 🚀 Quick Start

```bash
git clone https://github.com/user/repo.git
cd repo
pip install -r requirements.txt
python scripts/run.py
```

## 📁 Estrutura
```
repo/
├── data/
├── notebooks/
├── scripts/
└── outputs/
```

## 📖 Documentação
- [Metodologia](docs/methodology.md)
- [API Reference](docs/api.md)

## 🤝 Contribuir
Contribuições são bem-vindas! Ver [CONTRIBUTING.md](CONTRIBUTING.md).

## 📜 Licença
Este projecto está licenciado sob [MIT License](LICENSE).

## 📧 Contacto
[Nome] - email@dominio.pt
```

### 7.3. Boas Práticas

| Fazer ✅ | Evitar ❌ |
|----------|----------|
| README completo | Repo sem README |
| Código comentado | Código críptico |
| Requirements.txt | Dependências não documentadas |
| Licença clara | Sem licença |
| Issues organizadas | Issues abandonadas |
| Commits descritivos | "fix", "update" |

---

## 8. WebGIS

### 8.1. Tipos de Aplicações

| Tipo | Complexidade | Uso |
|------|--------------|-----|
| **Viewer simples** | Baixa | Mostrar camadas, sem interacção |
| **Dashboard** | Média | Camadas + gráficos + filtros |
| **Interactivo** | Alta | Upstream/downstream, análise on-the-fly |
| **StoryMap** | Média | Narrativa com mapas |

### 8.2. Estrutura Padrão

```
webgis/nome-app/
├── index.html
├── css/
│   └── style.css
├── js/
│   ├── config.js      # Configurações, URLs
│   ├── map.js         # Inicialização do mapa
│   ├── layers.js      # Definição de camadas
│   └── ui.js          # Interacção com UI
├── data/              # GeoJSONs locais (se necessário)
└── images/
    └── logo.png
```

### 8.3. Checklist de Qualidade

- [ ] Carrega em < 3 segundos
- [ ] Responsivo (funciona em mobile)
- [ ] Legenda clara
- [ ] Controlos intuitivos
- [ ] Loading indicators
- [ ] Tratamento de erros
- [ ] Meta tags (título, descrição)
- [ ] Favicon
- [ ] Link para "Sobre" / metodologia
- [ ] Créditos de dados

### 8.4. Exemplos de URLs

```
meudominio.pt/webgis/hidrologia/
meudominio.pt/webgis/agricultura/
meudominio.pt/webgis/acessibilidade/
meudominio.pt/storymaps/polje-minde/
```

---

## 9. Templates

### 9.1. Template: followup.md

```markdown
# Followup: [Nome do Projecto]

## Status
- [ ] Projecto concluído
- [ ] LinkedIn post publicado
- [ ] Artigo blog escrito
- [ ] Portfolio actualizado
- [ ] WebGIS deployed
- [ ] Contactos externos feitos

## LinkedIn Post

### Opções de Headline
1. [Opção 1]
2. [Opção 2]
3. [Opção 3]

### Draft do Post
```
[Escrever draft aqui]
```

### Imagens a Usar
- [ ] Screenshot principal
- [ ] Mapa de resultados
- [ ] (outras)

### Hashtags
#GIS #[outros]

## Artigo Blog

### Opções de Título
1. [Opção 1]
2. [Opção 2]

### Estrutura Sugerida
1. Introdução
2. [Secção 2]
3. [Secção 3]
4. Conclusão

### Palavras-chave SEO
- [keyword 1]
- [keyword 2]

## Portfolio Entry

### Descrição Curta (2-3 frases)
[Escrever aqui]

### Tags
Python, [outras]

### Links
- Demo: [URL]
- GitHub: [URL]
- Blog: [URL]

## Contactos Externos

### Entidades a Contactar
| Entidade | Contacto | Razão | Status |
|----------|----------|-------|--------|
| [Câmara X] | email | Oferecer projecto | ⏳ |

### Template de Email
```
Assunto: [Assunto]

Exmo(a). Sr(a). [Nome],

[Corpo do email]

Com os melhores cumprimentos,
[Assinatura]
```

## Notas Adicionais
[Outras ideias, observações]

---
*Última actualização: [data]*
```

### 9.2. Template: Email para Autarquias

```
Assunto: Proposta de colaboração - [Nome do Projecto]

Exmo(a). Sr(a). [Cargo/Nome],

O meu nome é [Nome] e sou profissional de Sistemas de Informação 
Geográfica, residente em [Local].

Desenvolvi recentemente um projecto de [breve descrição] que 
considero poder ser do interesse do município de [Nome]:

[2-3 bullet points com os principais outputs]

O projecto está disponível em [link] e os dados/código são 
totalmente abertos.

Gostaria de propor uma breve reunião (presencial ou online) para 
apresentar o trabalho e explorar possíveis formas de colaboração 
que possam beneficiar o município e os seus munícipes.

Fico ao dispor para qualquer esclarecimento.

Com os melhores cumprimentos,

[Nome]
[Contactos]
[Link portfolio]
```

### 9.3. Template: Post LinkedIn (Projecto)

```
🗺️ [HEADLINE IMPACTANTE]

[Frase de hook que prende atenção e faz querer ler mais]

[2-3 frases de contexto: qual era o problema/oportunidade]

O que fiz:
📊 [Ponto 1 - dado/análise principal]
🔍 [Ponto 2 - metodologia/abordagem]
💡 [Ponto 3 - insight ou resultado]

[1-2 frases sobre o resultado ou impacto]

[CTA - ex: "Experimentem a ferramenta interactiva" ou "Dados disponíveis para download"]

🔗 Link nos comentários

---
#GIS #Python #OpenData #[outros relevantes]
```

---

## 10. Calendário Editorial

### 10.1. Planeamento Mensal

```
SEMANA 1
├── Segunda: Planear conteúdo do mês
├── Terça: LinkedIn post (quick win ou partilha)
└── Quinta: LinkedIn post (projecto se houver)

SEMANA 2
├── Terça: LinkedIn post
├── Quarta: Escrever artigo blog
└── Quinta: LinkedIn post

SEMANA 3
├── Terça: LinkedIn post
├── Quinta: LinkedIn post
└── Sexta: Publicar artigo blog

SEMANA 4
├── Terça: LinkedIn post
├── Quinta: LinkedIn post
└── Sexta: Rever métricas, planear próximo mês
```

### 10.2. Conteúdo por Fase do Roadmap

| Fase | Mês | Conteúdo Principal |
|------|-----|-------------------|
| **1. Fundações** | 1-2 | Setup stack, projecto base |
| **2. Primeiros projectos** | 3-4 | 3-4 projectos completos |
| **3. Expansão** | 5-6 | Dashboards, automação |
| **4. Consolidação** | 7+ | Artigos técnicos, visibilidade |

### 10.3. Ideias de Conteúdo "Evergreen"

| Tipo | Ideias |
|------|--------|
| **Tutoriais** | "Como fazer X em QGIS/Python" |
| **Listas** | "10 fontes de dados abertos em Portugal" |
| **Comparações** | "QGIS vs ArcGIS para análise hidrológica" |
| **Ferramentas** | "Ferramentas gratuitas para WebGIS" |
| **Dados** | "Guia de dados LiDAR em Portugal" |

---

## 11. Métricas de Sucesso

### 11.1. LinkedIn

| Métrica | Objectivo (6 meses) |
|---------|---------------------|
| Seguidores | +500 |
| Impressões/post | >1000 |
| Engagement rate | >3% |
| Comentários/post | >5 |
| Contactos recebidos | >10 |

### 11.2. Blog/Portfolio

| Métrica | Objectivo (6 meses) |
|---------|---------------------|
| Visitas/mês | >500 |
| Artigos publicados | >15 |
| Projectos no portfolio | >10 |
| Backlinks | >5 |

### 11.3. GitHub

| Métrica | Objectivo (6 meses) |
|---------|---------------------|
| Stars (total) | >50 |
| Forks | >10 |
| Contribuições | Verde consistente |

### 11.4. Profissional

| Métrica | Objectivo (12 meses) |
|---------|---------------------|
| Contactos de recrutadores | >5 |
| Propostas de freelance | >3 |
| Colaborações com autarquias | >1 |
| Convites para palestras | >1 |

### 11.5. Tracking

**Ferramentas gratuitas:**
- LinkedIn Analytics (nativo)
- Google Analytics (site)
- GitHub Insights (repos)
- Plausible/Umami (alternativa privacy-friendly)

---

## Histórico de Versões

| Data | Versão | Alterações |
|------|--------|------------|
| 2025-01-27 | 1.0 | Criação inicial |

---

## Documentos Relacionados

- `04_BACKLOG_PROJECTOS.md` - Projectos a comunicar
- `05_PROJECTO_BASE_BIOFISICO.md` - Exemplo de comunicação
- `10_PROXIMOS_PASSOS.md` - Roadmap de publicações

---

*Documento gerado a partir de conversa de planeamento. Última actualização: Janeiro 2025*
