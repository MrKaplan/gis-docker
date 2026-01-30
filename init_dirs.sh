#!/bin/bash

# Configuração
INPUT_MD="docs/claude/02_ESTRUTURA_PASTAS.md"
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

echo -e "🚀 ${CYAN}A processar estrutura a partir de:${NC} $INPUT_MD"
echo "------------------------------------------------"

criadas=0
existentes=0
git_files=0

# Extração da lista
items=$(sed -n "/$START_MARKER/,/^\s*$/p" "$INPUT_MD" | \
        grep -E '^[│ ├└─]+' | \
        sed -E 's/^[│ ├└─]+//g' | \
        sed 's/^[ \t]*//;s/[ \t]*$//' | \
        grep -v "gis-docker-stack/" | \
        grep -vE '^\.git($|hub)')

for item in $items; do
    [ -z "$item" ] && continue

    # LÓGICA PARA FICHEIROS GIT (.gitkeep / .gitignore)
    if [[ "$item" == *.* && "$item" != */ ]]; then
        if [[ "$item" == *".gitkeep"* || "$item" == *".gitignore"* ]]; then
            parent_dir=$(dirname "$item")
            mkdir -p "$parent_dir"
            if [ ! -f "$item" ]; then
                touch "$item"
                echo -e "${GREEN}📝 Ficheiro de controlo criado:${NC} $item"
                ((git_files++))
            else
                echo -e "${CYAN}ℹ️  Ficheiro já existe:${NC} $item"
            fi
        fi
        continue
    fi

    # LÓGICA PARA PASTAS
    dir=$(echo "$item" | sed 's/\/$//')
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
