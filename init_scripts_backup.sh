#!/bin/bash

# Nome do ficheiro de origem
INPUT_FILE="docs/claude/18_SCRIPTS_CONFIGS.md"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Erro: Ficheiro $INPUT_FILE não encontrado."
    exit 1
fi

echo "🚀 Iniciando a extração de scripts..."

# Variáveis de controlo
current_file=""
writing=false

while IFS= read -r line || [ -n "$line" ]; do
    # Identifica a linha de destino do ficheiro
    if [[ "$line" =~ ^#\ LOCAL:\ (.*) ]]; then
        current_file="${BASH_REMATCH[1]}"
        # Remove espaços em branco residuais ou retorno de carro
        current_file=$(echo "$current_file" | tr -d '\r')
        echo "📄 Extraindo: $current_file"
        
        # Garante que a pasta de destino existe
        mkdir -p "$(dirname "$current_file")"
        
        # Limpa o ficheiro se ele já existir para começar a escrever do zero
        > "$current_file"
        writing=true
        continue
    fi

    # Se encontrar o delimitador de fim de bloco, para de escrever
    if [[ "$line" =~ ^############################################################################### ]]; then
        writing=false
        current_file=""
    fi

    # Escreve o conteúdo no ficheiro atual se estiver dentro de um bloco válido
    if [ "$writing" = true ] && [ -n "$current_file" ]; then
        # Evita escrever a linha do cabeçalho do nome do ficheiro
        if [[ ! "$line" =~ ^#\ FICHEIRO: ]]; then
            echo "$line" >> "$current_file"
        fi
    fi
done < "$INPUT_FILE"

# Dar permissões de execução aos scripts .sh extraídos
find ./scripts -name "*.sh" -exec chmod +x {} \;

echo "✅ Extração concluída com sucesso!"
