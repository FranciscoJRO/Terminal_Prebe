#!/bin/bash

# Colores de texto
rojo="\033[31m"
verde="\033[32m"
amarillo="\033[33m"
azul="\033[34m"
magenta="\033[35m"
cian="\033[36m"
reset="\033[0m"
echo -e "${amarillo}MM        MM   U    U   SSS   II   CCCCC       A${reset}"
echo -e "${azul}M M      M M   U    U  S      II  CC          A A${reset}"
echo -e "${verde}M  M    M  M   U    U   SS    II  CC         AAAAA${reset}"
echo -e "${rojo}M   M  M   M   U    U     S   II  CC        A     A${reset}"
echo -e "${magenta}M    MM    M    UUUU   SSS    II   CCCCC   A       A${reset}"

reproductor=$(whereis mpg123)

if [[ "$reproductor" == "mpg123:" ]]; then
    echo "No de encontró el programa de reprodución de musica, desea instalarlo? [Y/n]"
    read -r  opcion
    if [[ $opcion =~ ^(Yes|Y|y)$ ]]; then
        sudo apt install mpg123
    else
        echo "No se instalará el reproductor de música"
        exit
    fi
fi

echo 
cd "$HOME/Música" ||cd "$HOME/Music" || echo no se pudo encontrar una carpeta de musica por defecto

carpeta_actual=$(pwd)
echo
echo -e "${cian}Carpeta actual: $carpeta_actual ${reset}"
echo -e "${cian}¿Que desea hacer?${reset}"
echo
cic=0
while cic=0 ; do
    echo "Las siguientes opciones son todas en base a tu directorio actual"
    echo "1) Reproducir una canción"
    echo "2) Reproducir una carpeta especifica de canciones"
    echo "3) Reproducir todas las canciones de carpeta actual"
    echo "4) Cambiar de directorio donde reproducir musica"
    echo "5) Salir"
    read -rp "Opción: " accion
    case $accion in
        "1")
            read -rp "Nombre de canción: " song
            song=$(echo "$song" | tr " " "\\ ")
            echo "$song"
            mpg123 "$song"
            clear
        ;;
        "2")
            echo "no esta bien implementado"
            echo
            #read -rp "Nombre de la carpeta donde tienes la playlist: " lista
            #lista="$(echo "$lista" | tr " " "\\ " )";
            #echo "" > orden.txt
            #for i in ./$lista/; do 
            #    name=$(echo "$i"*)
            #    echo "$name" >> orden.txt
            #done
            #sed 's/ /\\ ' orden.txt
            #mpg123 -@ orden.txt
        ;;
        "3")
            echo "no Esta implementado"
            echo
        ;;
        "4")
            echo "no Esta implementado"
            echo
            #echo "Escribe la ruta del directorio donde se encuentran tus canciones"
            #read -r ruta
            #cd "$ruta" || echo "No se pudo cambiar de directorio"
        ;;
        "5")
            cic=$cic+1
            exit
    esac
done

