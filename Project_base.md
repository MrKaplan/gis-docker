# Projeto de Infraestrutura e Análise SIG

## 1. Infraestrutura do Projeto

### 1.1. Base de Hardware e Virtualização
* **Plataforma:** VM Oracle Cloud Free Tier.
* **Recursos:** Arquitetura ARM64, 2 OCPUs, 12GB RAM.
* **Armazenamento:** 50GB de disco (expansível até 100GB, se necessário).
* **Arquitetura de Software:** Stack Docker com múltiplos serviços GIS (um serviço por contentor), incluindo bibliotecas e extensões específicas instaladas nos contentores próprios.

### 1.2. Serviços Previstos
* **PostGIS:** Imagem customizada baseada na imagem oficial de PostgreSQL.
* **QGIS Server:** Imagem customizada baseada em Ubuntu.
* **Martin:** Tile server.
* **pg_tileserv:** Geração de tiles diretamente a partir do PostGIS.
* **Python API:** Implementação via FastAPI ou Flask.
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
4.  **Portfólio:** Entrada com screenshot, link e descrição concisa.
5.  **WebGIS:** Disponibilização de demonstração interativa (quando aplicável).
