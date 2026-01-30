#!/bin/bash

# Configuração
INPUT_MD="docs/claude/02_ESTRUTURA_FICHEIROS.md"
START_MARKER="## 2. Estrutura Completa"

# Cores para o terminal
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [ ! -f "$INPUT_MD" ]; then
    echo -e "❌ ${YELLOW}Erro: Ficheiro $INPUT_MD não encontrado!${NC}"
    exit 1
fi

echo -e "🚀 ${CYAN}A processar estrutura (limpando comentários)...${NC}"
echo "------------------------------------------------"

criadas=0
existentes=0
git_files=0

# EXTRAÇÃO MELHORADA
# 1. sed: Isola o bloco da tree
# 2. sed: Remove tudo o que vem depois de um # (comentários)
# 3. sed: Limpa os caracteres da árvore
# 4. grep -v: Remove extensões que não queremos (Dockerfile, .conf, .py, etc)
items=$(sed -n "/$START_MARKER/,/###/p" "$INPUT_MD" | \
        sed 's/#.*//' | \
        grep -E '^[│ ├└─]+' | \
        sed -E 's/^[│ ├└─]+//g' | \
        sed 's/^[ \t]*//;s/[ \t]*$//' | \
        grep -v "gis-docker-stack/" | \
        grep -vE '\.(conf|sql|txt|yml|example|py|ipynb|pem|log|qgz|geojson|html|js|css|json|toml|yaml|stk|obj|md)$' | \
        grep -vE '^(Dockerfile|LICENSE|crontab|__init__)$')

# IMPORTANTE: Mudar o separador interno para lidar com nomes de pastas (se existirem espaços)
IFS=$'\n'

for item in $items; do
    [ -z "$item" ] && continue

    # LÓGICA PARA FICHEIROS GIT (.gitkeep / .gitignore)
    if [[ "$item" == *".git"* ]]; then
        parent_dir=$(dirname "$item")
        mkdir -p "$parent_dir"
        if [ ! -f "$item" ]; then
            touch "$item"
            echo -e "${GREEN}📝 Ficheiro de controlo criado:${NC} $item"
            ((git_files++))
        else
            echo -e "${CYAN}ℹ️  Ficheiro já existe:${NC} $item"
        fi
        continue
    fi

    # LÓGICA PARA PASTAS (Ignora se for um ficheiro sem extensão que sobrou)
    dir=$(echo "$item" | sed 's/\/$//')
    
    # Se ainda tiver um ponto e não for git, ignoramos (é ficheiro)
    [[ "$dir" == *.* && "$dir" != *".git"* ]] && continue

    if [ -d "$dir" ]; then
        echo -e "${CYAN}ℹ️  Pasta já existe:${NC} $dir"
        ((existentes++))
    else
        mkdir -p "$dir"
        echo -e "${GREEN}🆕 Pasta criada:${NC} $dir"
        ((criadas++))
    fi
done

echo "------------------------------------------------"
echo -e "${GREEN}✅ Verificação concluída!${NC}"
echo -e "📂 Pastas novas: $criadas"
echo -e "📂 Pastas verificadas: $existentes"
echo -e "📄 Ficheiros Git processados: $git_files"
