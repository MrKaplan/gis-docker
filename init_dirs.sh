###############################################################################
# FICHEIRO: init-dirs.sh
# LOCAL: ./scripts/setup/init-dirs.sh
###############################################################################

#!/bin/bash
# ===========================================
# Criar estrutura de directórios do projecto
# ===========================================

set -e

echo "🚀 Criando estrutura de directórios..."

# Directório base (assume que estamos na raiz do projecto)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$BASE_DIR"

# ===========================================
# Criar directórios principais
# ===========================================

mkdir -p config/{nginx/{sites-available,snippets},postgis,qgis-server,martin,pg-tileserv,titiler,redis}
mkdir -p certs/nginx
mkdir -p data/{postgis,redis,qgis/projects,jupyter/notebooks,shared/{raster/{mdt,indices,outputs},vector/{base,derived,outputs},downloads,temp}}
mkdir -p dockerfiles/{postgis,qgis-server,python-api,jupyter,titiler,cron}
mkdir -p docs/claude
mkdir -p logs/{nginx,postgis,qgis,python,cron,titiler,martin}
mkdir -p projects
mkdir -p scripts/{setup,cronjobs/{scraping,processing},utils,analysis/{terrain,hydrology,indices}}
mkdir -p src/{api/{routers,services,models,utils},processing}
mkdir -p www/{landing/{content/{blog,portfolio,about},themes,static},webgis,storymaps}
mkdir -p .github/workflows

# ===========================================
# Criar ficheiros .gitkeep
# ===========================================

find . -type d -empty -exec touch {}/.gitkeep \;

# Alguns específicos que podem não estar vazios
touch certs/nginx/.gitkeep
touch data/postgis/.gitkeep
touch data/redis/.gitkeep
touch data/shared/raster/mdt/.gitkeep
touch data/shared/raster/indices/.gitkeep
touch data/shared/raster/outputs/.gitkeep
touch data/shared/vector/base/.gitkeep
touch data/shared/vector/derived/.gitkeep
touch data/shared/vector/outputs/.gitkeep
touch data/shared/downloads/.gitkeep
touch data/shared/temp/.gitkeep
touch logs/nginx/.gitkeep
touch logs/postgis/.gitkeep
touch logs/qgis/.gitkeep
touch logs/python/.gitkeep
touch logs/cron/.gitkeep
touch logs/titiler/.gitkeep
touch logs/martin/.gitkeep
touch projects/.gitkeep

echo "✅ Estrutura de directórios criada!"
echo ""
echo "Próximos passos:"
echo "  1. Copiar ficheiros de configuração para ./config/"
echo "  2. Copiar Dockerfiles para ./dockerfiles/"
echo "  3. Copiar .env.example para .env e editar"
echo "  4. Executar: docker-compose --profile core up -d"


###############################################################################
