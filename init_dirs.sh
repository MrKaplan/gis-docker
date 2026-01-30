#!/bin/bash

# ==============================================================================
# CONFIGURAÇÃO
# ==============================================================================
INPUT_MD="docs/claude/02_ESTRUTURA_FICHEIROS.md"
START_MARKER="## 2. Estrutura Completa"

# Mudar para "false" para criar a estrutura real com .gitkeep
SIMULACAO=true 

# Cores
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# ==============================================================================
# VALIDAÇÃO INICIAL
# ==============================================================================
if [ ! -f "$INPUT_MD" ]; then
    echo -e "${RED}❌ Erro: Ficheiro $INPUT_MD não encontrado!${NC}"
    exit 1
fi

if [ "$SIMULACAO" = true ]; then
    echo -e "🚀 ${YELLOW}MODO SIMULAÇÃO ATIVO (Nada será criado)${NC}"
else
    echo -e "🚀 ${GREEN}MODO EXECUÇÃO ATIVO (A criar pastas com .gitkeep)${NC}"
fi
echo "------------------------------------------------"

# ==============================================================================
# PROCESSO
# ==============================================================================
declare -a path_stack
criadas=0
existentes=0
git_files=0

# Extrair linhas da árvore limpando apenas comentários
mapfile -t lines < <(sed -n "/$START_MARKER/,/###/p" "$INPUT_MD" | sed 's/#.*//' | grep -E '^[│ ├└─]+')

for line in "${lines[@]}"; do
    # 1. Determinar profundidade (nível) - 4 espaços por nível
    prefix=$(echo "$line" | grep -oP "^[│ ]*(?=[├└])")
    if [ -z "$prefix" ]; then
        depth=0
    else
        depth=${#prefix}
    fi
    
    # 2. Limpar nome do item
    item=$(echo "$line" | sed -E 's/^[│ ├└─ ]+//;s/[ \t]*$//')
    [ -z "$item" ] && continue
    [[ "$item" == "gis-docker-stack/" ]] && continue

    # 3. Ajustar nível no stack
    level=$((depth / 4))
    path_stack=(${path_stack[@]:0:$level})

    # 4. Determinar se é uma pasta
    # Se termina em / ou não tem extensão (e não é um ficheiro conhecido), é pasta
    is_folder=0
    if [[ "$item" == */ ]] || [[ "$item" != *.* && "$item" != "Dockerfile" && "$item" != "LICENSE" && "$item" != "crontab" ]]; then
        is_folder=1
    fi

    # 5. Acção para Pastas
    if [ $is_folder -eq 1 ]; then
        clean_name=$(echo "$item" | sed 's/\/$//')
        path_stack+=("$clean_name")
        full_path=$(IFS=/; echo "${path_stack[*]}")

        if [ "$SIMULACAO" = true ]; then
            echo -e "${YELLOW}🆕 Simulação:${NC} Criaria pasta e .gitkeep -> $full_path/"
            ((criadas++))
        else
            # Criar a pasta
            mkdir -p "$full_path"
            # Criar o .gitkeep para garantir que o Git "vê" a pasta
            if [ ! -f "$full_path/.gitkeep" ]; then
                touch "$full_path/.gitkeep"
                echo -e "${GREEN}✅ Criada com .gitkeep:${NC} $full_path"
                ((git_files++))
            else
                echo -e "${CYAN}ℹ️  Já existe:${NC} $full_path"
                ((existentes++))
            fi
        fi
    fi
done

echo "------------------------------------------------"
echo -e "Resumo: ${GREEN}$criadas pastas processadas${NC} | ${CYAN}$existentes verificadas${NC} | ${GREEN}$git_files novos .gitkeep${NC}"

if [ "$SIMULACAO" = true ]; then
    echo -e "${YELLOW}Dica: Se os caminhos estiverem certos, muda SIMULACAO=false no script.${NC}"
fi
