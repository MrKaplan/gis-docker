# Projeto de Infraestrutura e Análise SIG

## 1. Infraestrutura do Projeto

### 1.1. Base de Hardware e Virtualização
* **Plataforma:** VM Oracle Cloud Pay as you Go - Configurada para ausência de custos mantendo o uso de recursos dentro dos limites FREE .
* **Recursos:** Arquitetura ARM64, 2 OCPUs, 12GB RAM.
* **Armazenamento:** 50GB de disco (expansível até 100GB, se necessário).
* **Arquitetura de Software:** Stack Docker com múltiplos serviços GIS (um serviço por contentor), incluindo bibliotecas e extensões específicas instaladas nos contentores próprios.

### 1.2. Serviços Previstos
* **PostGIS:** Imagem customizada baseada na imagem oficial de PostgreSQL.
* **QGIS Server:** Imagem customizada baseada em Ubuntu.
* **Martin:** Tile server.
* **pg_tileserv:** Geração de tiles diretamente a partir do PostGIS.
* **Python API:** Implementação via FastAPI (tem melhor performance que Flask).
* **JupyterLab:** Ambiente para análise de dados e prototipagem.
* **Cronjobs:** Sistema para automação de tarefas.
* **Nginx:** Atuando como Reverse Proxy e Webserver (sem recurso a Plesk/Softaculous; possibilidade de alojar WordPress).

### 1.3. Stack de Bibliotecas e Extensões de Análise
*(A integrar primordialmente no serviço/contentor Python)*
* **GDAL/OGR:** Processamento de dados raster e vetoriais.
* **Rasterio/Fiona:** Interfaces Python para manipulação de dados via GDAL.
* **NumPy/Pandas/GeoPandas:** Bibliotecas para análise e manipulação de dados.
* **Shapely:** Manipulação e análise de geometrias em Python.
* **pgRouting:** Extensão do PostGIS para análise de redes (ex: walkability, trails).

### 1.4. Requisitos de Estrutura e Gestão
* **Custos:** Total ausência. Uso apenas de software e plataformas free e open source. VM devidamente configurada para evitar surpresas de custos.
* **Dados:** Partilha de volumes entre serviços.
* **Logs:** Segregação de logs por cada serviço individual.
* **Código e Configuração:** Scripts Python, ficheiros de configuração e documentação detalhada do processo de montagem.
* **Segurança:** Certificados SSL para o Nginx.
* **Orquestração:** Dockerfiles e ficheiro `docker-compose.yml`.
* **Planeamento:** Manutenção de um backlog de ideias para projetos a implementar.

### 1.5. Requisitos de Deployment
* **Versionamento:** Todo o projeto deve ser versionável via Git/GitHub.
* **Instalação:** Procedimento simplificado através de `git clone` seguido de `docker-compose up`, ou via script de *bootstrap* para criação da estrutura base.
* **Prontidão:** Configurações otimizadas para funcionamento imediato pós-instalação.

### 1.6. Extensibilidade Futura
* Previsão para integração de serviços adicionais como **GeoServer**, **MapServer** ou **GeoNetwork**.

---

## 2. Objetivos do Projeto

* **Capacitação Profissional:** Familiarização com o stack tecnológico para aumentar a competitividade no mercado de trabalho de SIG, Ordenamento do Território e áreas afins.
* **Aprendizagem Técnica:** Utilização da plataforma para domínio de processos de montagem de infraestrutura, configuração de serviços, análise espacial e comunicação de resultados.
* **Rentabilização e Visibilidade:** Aproveitamento das camadas e mapas produzidos para divulgação em múltiplos canais:
    * Plataforma WebGIS própria.
    * Blog pessoal (Portfólio e artigos técnicos).
    * LinkedIn e GitHub.

### 2.1. Fluxo de Publicação de Conteúdo
1.  **Conclusão:** Finalização do projeto, análise ou mapa.
2.  **LinkedIn:** Publicação de resumo visual (1 a 2 imagens).
3.  **Blog:** Artigo detalhado com explicação técnica, descrição do processo e resultados.
5.  **Portfólio:** Entrada com screenshot, link e descrição concisa.
6.  **WebGIS:** Disponibilização de demonstração interativa (quando aplicável).

## 3. Considerações

- **Gestão de Recursos (RAM):** Com 12GB de RAM, a margem é confortável. No entanto, o QGIS Server e o JupyterLab podem ser exigentes com a memória durante processos pesados. Recomenda-se monitorizar o uso de RAM caso seja adicionado o GeoServer no futuro, pois corre sobre Java (JVM) e consome bastante.

- **Escolha da API:** Para SIG, recomenda-se o FastAPI. É nativamente assíncrono e lida muito bem com os payloads JSON/GeoJSON que as bibliotecas como o GeoPandas geram.

- **Segurança:** A expor o Nginx, deve ser considerado usar o Certbot num contentor separado (ou via plugin do Nginx) para renovação automática dos certificados Let's Encrypt.

- **Volume de Dados:** Os 50GB iniciais desaparecem rápido com dados Raster (Sentinel/Landsat). Expansão para os 100GB ou usar Object Storage da Oracle para arquivar dados brutos.

- **I/O de Disco:** O armazenamento gratuito da Oracle tem limites de IOPS. Para grandes volumes de dados espaciais, o disco pode tornar-se o principal "gargalo", mais do que o CPU ou RAM.

- **Base de Dados:** Adicionar a extensão pg_cron diretamente no PostGIS permite agendar tarefas de manutenção (VACUUM, refresh de Materialized Views) diretamente no SQL, sem depender apenas do cron do host.

- **Segurança:** Para o Nginx e SSL, Nginx Proxy Manager pode ser uma opção. É leve, corre em Docker, tem interface Web e gere certificados Let's Encrypt automaticamente. Poupa imenso tempo de configuração manual.

- **Orquestração:** Usar Docker Compose Profiles pode ser opção. Como há muitos serviços (Jupyter, Martin, QGIS Server, Nginx), pode ser precisoiniciar apenas o "core" para poupar recursos e levantar o Jupyter apenas quando for para analisar dados.
  
- **Automação CI/CD (GitHub Actions):** Atualização automática da VM após cada git push, garantindo que o código novo entra em produção sem intervenção manual e com paragens de apenas alguns segundos.

- **Performance GiST e Cluster:** Uso de índices espaciais GiST e organização física dos dados (CLUSTER) para que os mapas carreguem instantaneamente, poupando o processador e o disco da VM.

- **Tiles Inteligentes (SQL):** Criação de funções no PostGIS que simplificam as geometrias automaticamente conforme o zoom, reduzindo o peso dos dados e acelerando a visualização no browser.

- **Orfãos de Conexão:** O PostGIS com FastAPI assíncrono é rápido, mas se não gerires bem o pool de conexões, podes atingir o limite do PostgreSQL rapidamente. O limite é puramente técnico: se esgotares as vagas de ligação do PostgreSQL (100), o sistema bloqueia novos acessos e o teu WebGIS fica offline.

- **Vectores em vez de Rasters:** Sempre que possível, usa MVT (Mapbox Vector Tiles) via Martin. É muito mais leve para o teu hardware do que renderizar imagens via WMS no QGIS Server.

- **Monitorização:** Adiciona um contentor leve como o Netdata ou Portainer para veres em tempo real como a CPU ARM se está a portar com os teus processos Python.

- **Estratégia de Cache:** Como configurar o Nginx para fazer cache de tiles e aliviar o PostGIS.
