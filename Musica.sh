#!/bin/bash

# Colores de texto
rojo="\033[31m"
verde="\033[32m"
amarillo="\033[33m"
azul="\033[34m"
magenta="\033[35m"
cian="\033[36m"
reset="\033[0m"

# Función que imprime el título del programa
title(){
    echo -e "${amarillo}MM        MM   U    U   SSS   II   CCCCC       A${reset}"
    echo -e "${azul}M M      M M   U    U  S      II  CC          A A${reset}"
    echo -e "${verde}M  M    M  M   U    U   SS    II  CC         AAAAA${reset}"
    echo -e "${rojo}M   M  M   M   U    U     S   II  CC        A     A${reset}"
    echo -e "${magenta}M    MM    M    UUUU   SSS    II   CCCCC   A       A${reset}"
    echo 
}

#Valida si está instalado el reproductor, si no lo está, da opción de instalarlo
validampg(){
    reproductor=$(whereis mpg123)
    if [[ "$reproductor" == "mpg123:" ]]; then
        echo "No de encontró el programa de reprodución de musica, desea instalarlo? [Y/n]"
        read -r  opcion
        if [[ $opcion =~ ^(Yes|Y|y|)$ ]]; then
            sudo apt install mpg123
        else
            echo "No se instalará el reproductor de música"
            exit
        fi
    fi
}

#Display del menú de opciones basicas/iniciales del reproductor
menuBasic(){
    echo "Las siguientes opciones son todas en base a tu directorio actual"
        echo "1) Reproducir una canción"
        echo "2) Reproducir una carpeta especifica de canciones (que se encuentre en la carpeta actual)"
        echo "3) Reproducir todas las canciones sueltas de carpeta actual"
        echo "4) Cambiar de directorio donde reproducir musica"
        echo "5) Salir"
}
#imprime en pantalla las acciones de utilidad para el reproductor dependiendo del argumento
#1 para solo 1 canción, 2 para una lista/carpeta de canciones
controlador(){
    if [[ "$1" == "1" ]]; then
        echo -e "${rojo}*---------------------------------------------------------------------*${reset}"
        echo -e "${azul}                     CONTROLES DEL REPRODUCTOR${reset}"
        echo -e "${rojo}*---------------------------------------------------------------------*${reset}"
        echo -e "${azul}   Pausar/Reanudar:                  s${reset}"
        echo -e "${azul}   Volumen:                        + o -${reset}"
        echo -e "${azul}   Repetir canción:                  b${reset}"
        echo -e "${azul}   Salir:                            q${reset}"
        echo -e "${rojo}*---------------------------------------------------------------------*${reset}"
    else
        echo -e "${rojo}*---------------------------------------------------------------------*${reset}"
        echo -e "${azul}                    CONTROLES DEL REPRODUCTOR${reset}"
        echo -e "${rojo}*---------------------------------------------------------------------*${reset}"
        echo -e "${azul}   Pausar/Reanudar:                  s${reset}"
        echo -e "${azul}   Volumen:                        + o -${reset}"
        echo -e "${azul}   Mostrar playlist                  l${reset}"
        echo -e "${azul}   Siguiente canción:                f${reset}"
        echo -e "${azul}   Canción anterior:                 d${reset}"
        echo -e "${azul}   Repetir canción:                  b${reset}"
        echo -e "${azul}   Repetir playlist                  [${reset}"
        echo -e "${azul}   Salir:                            q${reset}"
        echo -e "${rojo}*---------------------------------------------------------------------*${reset}"
    fi
}

#Reproduce una canción
unaCancion(){
    read -rp "Nombre de canción incluyendo la extención (.mp3): " song
    song=$(echo "$song" | tr " " "\\ ") #Si el texto de la canción contiene espacios, reemplaza los espacios por "\ "
    controlador "1"
    mpg123 -C --title -q "$song"

}

#Reproduce una lista de canciones dentro del directorio actual
playlist(){
    echo "En caso de no poder acceder a la carpeta, se regresará al menú principal"
    read -rp "Escriba el nombre de la carpeta con las canciones: " nom
    #nom=$(echo "$nom" | tr " " "\\ ")
    cd "$nom" || return
    cd ..
    echo "La reprodución por defecto es aleatoria, desea que se mantenga así?"
    read -rp "[Y/n]" rand
    controlador "2"
    if [[ $rand =~ ^(Yes|Y|y)$ ]]; then
            mpg123 -C --title -q -z "$nom"/*.mp3
        else
            mpg123 -C --title -q "$nom"/*.mp3
        fi
    
}

cambiarCarp(){
    read -rp "Escribe la ruta absoluta del directorio donde se encuentran tus canciones" ruta
    cd "$ruta" || echo "No se pudo cambiar de directorio, nos quedamos en el directorio actual"
}

musicActual(){
    len=$(ls *.mp3 | wc -l)
    #echo "$len"
    #return
    if [ "$len" = 1 ] ; then
        controlador "1"
        mpg123 -C --title -q ./*mp3
        
    elif [ "$len" -ge 2 ] ; then
        echo "La reprodución por defecto es aleatoria, desea que se mantenga así?"
        read -rp "[Y/n]" rand
        controlador "2"
        if [[ $rand =~ ^(Yes|Y|y|)$ ]]; then
            mpg123 -C --title -q -z ./*mp3
        else
            mpg123 -C --title -q ./*mp3
        fi
    else
        echo no hay canciones en la carpeta
        return
    fi
}

Reproductor(){
    title
    validampg
    cd "$HOME/Música" ||cd "$HOME/Music" || echo no se pudo encontrar una carpeta de musica se utilizará la actual.
    
    echo
    echo
    cic=0
    while cic=0 ; do
        carpeta_actual=$(pwd)
        menuBasic
        echo -e "${cian}Carpeta actual: $carpeta_actual ${reset}"
        echo -e "${cian}¿Que desea hacer?${reset}"
        read -rp "Opción: " accion
        case $accion in
            "1")
                unaCancion
                clear
            ;;
            "2")
                playlist
                clear
            ;;
            "3")
                musicActual
            ;;
            "4")
                cambiarCarp
                clear
            ;;
            "5")
                cic=$cic+1
                return
            ;;
            *)
                echo "Opción no valida"
        esac
    done
}


Reproductor
exit