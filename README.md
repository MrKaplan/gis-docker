# GIS Docker Stack

Stack SIG em Docker (ARM64) para Oracle Cloud Free Tier.

## Serviços (ordem de implementação)
1. PostGIS
2. QGIS Server
3. Nginx
4. Serviços de tiles e APIs

## Princípios
- Um serviço de cada vez
- Containers stateless
- Dados persistentes em volumes
- Tudo versionado em Git
