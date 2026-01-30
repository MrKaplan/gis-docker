#!/bin/bash

# ==============================================================================
# CONFIGURAÇÃO
# ==============================================================================
INPUT_MD="docs/claude/02_ESTRUTURA_FICHEIROS.md"
START_MARKER="## 2. Estrutura Completa"

# Mudar para "false" para criar as pastas e ficheiros a sério!
SIMULACAO=false

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
    echo -e "🚀 ${GREEN}MODO EXECUÇÃO ATIVO (A criar estrutura real)${NC}"
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
    # 1. Determinar profundidade (nível)
    # Procura a posição do primeiro símbolo de ramificação ├ ou └
    prefix=$(echo "$line" | grep -oP "^[│ ]*(?=[├└])")
    # Se a linha for a raiz (não tem prefixo com ramificação), o nível é 0
    if [ -z "$prefix" ]; then
        depth=0
    else
        depth=${#prefix}
    fi
    
    # 2. Limpar nome do item
    item=$(echo "$line" | sed -E 's/^[│ ├└─ ]+//;s/[ \t]*$//')
    [ -z "$item" ] && continue
    [[ "$item" == "gis-docker-stack/" ]] && continue

    # 3. Calcular nível no stack (normalmente 4 caracteres por nível)
    # Nível 0 = raiz, Nível 1 = primeira subpasta, etc.
    level=$((depth / 4))
    
    # Ajustar a pilha de caminhos para o nível atual
    path_stack=(${path_stack[@]:0:$level})

    # 4. Verificar se é pasta ou ficheiro git
    is_folder=0
    [[ "$item" == */ ]] && is_folder=1
    [[ "$item" != *.* && "$item" != "Dockerfile" && "$item" != "LICENSE" && "$item" != "crontab" ]] && is_folder=1
    
    is_git_file=0
    [[ "$item" == *".git"* ]] && is_git_file=1

    # 5. Acção
    if [ $is_folder -eq 1 ]; then
        clean_name=$(echo "$item" | sed 's/\/$//')
        path_stack+=("$clean_name")
        full_path=$(IFS=/; echo "${path_stack[*]}")

        if [ -d "$full_path" ]; then
            echo -e "${CYAN}ℹ️  Já existe:${NC} $full_path"
            ((existentes++))
        else
            if [ "$SIMULACAO" = true ]; then
                echo -e "${YELLOW}🆕 Simulação:${NC} Criaria pasta -> $full_path"
            else
                mkdir -p "$full_path"
                echo -e "${GREEN}✅ Criada:${NC} $full_path"
                ((criadas++))
            fi
        fi
    elif [ $is_git_file -eq 1 ]; then
        full_path=$(IFS=/; echo "${path_stack[*]}")/$item
        if [ "$SIMULACAO" = true ]; then
            echo -e "${YELLOW}📝 Simulação:${NC} Criaria ficheiro Git -> $full_path"
        else
            parent=$(dirname "$full_path")
            mkdir -p "$parent"
            [ ! -f "$full_path" ] && touch "$full_path"
            echo -e "${GREEN}📝 Ficheiro Git criado:${NC} $full_path"
            ((git_files++))
        fi
    fi
done

echo "------------------------------------------------"
echo -e "Resumo: ${GREEN}$criadas criadas${NC} | ${CYAN}$existentes verificadas${NC} | ${GREEN}$git_files git files${NC}"

if [ "$SIMULACAO" = true ]; then
    echo -e "${YELLOW}Dica: Se o output acima estiver correto, muda SIMULACAO=false no script.${NC}"
fi
