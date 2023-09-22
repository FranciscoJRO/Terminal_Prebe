#!/bin/bash
trap ' ' 2 20

echo
    echo "Debes ingresar los parámetros de la siguiente manera: /ruta/a/mi/directorio miarchivo.txt"
    # Leer el directorio y el nombre del archivo
    read -rp "Ingresa el directorio: " directorio
    read -rp "Ingresa el nombre del archivo: " archivo_a_buscar

    # Utiliza el comando find para buscar el archivo en el directorio especificado
    #resultado=$(find "$directorio" -name "$archivo_a_buscar")
    echo
    actual=$(pwd)
    cd "$directorio" || echo no se encontró el directorio objetivo, se realizará la busqueda en directorio actual

    for file in *; do
        if [ "$file" == "$archivo_a_buscar" ]; then
            resultado="true"
        fi
    done
    echo
    # Verifica si el archivo fue encontrado
    if [ "$resultado" == "true" ]; then
        echo "El archivo $archivo_a_buscar fue encontrado en el directorio $directorio."
    else
        echo "El archivo $archivo_a_buscar no fue encontrado en el directorio $directorio."
    fi
    cd "$actual" || return
    echo

trap - 2 20