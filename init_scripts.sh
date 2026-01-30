#!/bin/bash

# Configuração do ficheiro de origem
INPUT_FILE="docs/18_SCRIPTS_CONFIGS.md"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Erro: Ficheiro $INPUT_FILE não encontrado."
    exit 1
fi

# Contadores para o resumo final
criados=0
overwritten=0
mantidos=0

echo "🚀 Iniciando a extração e organização de ficheiros..."

current_file=""
writing=false
temp_content=$(mktemp)

while IFS= read -r line || [ -n "$line" ]; do
    # Identifica o local de destino do ficheiro
    if [[ "$line" =~ ^#\ LOCAL:\ (.*) ]]; then
        current_file=$(echo "${BASH_REMATCH[1]}" | tr -d '\r' | xargs)
        mkdir -p "$(dirname "$current_file")"
        > "$temp_content"
        writing=true
        continue
    fi

    # Identifica o fim do bloco
    if [[ "$line" =~ ^############################################################################### ]]; then
        if [ "$writing" = true ] && [ -n "$current_file" ]; then
            new_size=$(stat -c%s "$temp_content")
            
            if [ -f "$current_file" ]; then
                old_size=$(stat -c%s "$current_file")
                echo -n "File $current_file ($old_size bytes) exists. Replace with new version ($new_size bytes)? (Y/N): "
                read -r answer
                
                if [[ "$answer" =~ ^[Yy]$ ]]; then
                    cp "$temp_content" "$current_file"
                    echo "✅ Versão atualizada."
                    ((overwritten++))
                else
                    echo "⏭️ Mantido original."
                    ((mantidos++))
                fi
            else
                cp "$temp_content" "$current_file"
                echo "🆕 Ficheiro criado: $current_file ($new_size bytes)"
                ((criados++))
            fi
        fi
        writing=false
        current_file=""
    fi

    # Captura o conteúdo (ignora a linha descritiva # FICHEIRO:)
    if [ "$writing" = true ] && [[ ! "$line" =~ ^#\ FICHEIRO: ]]; then
        echo "$line" >> "$temp_content"
    fi
done < "$INPUT_FILE"

# Limpeza e permissões
rm "$temp_content"
find ./scripts -name "*.sh" -exec chmod +x {} \;

echo "------------------------------------------"
echo "📊 RESUMO DA OPERAÇÃO:"
echo "Ficheiros novos criados: $criados"
echo "Ficheiros com overwrite: $overwritten"
echo "Ficheiros mantidos originais: $mantidos"
echo "------------------------------------------"
