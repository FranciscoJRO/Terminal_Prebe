#!/bin/bash

echo "Hola, por favor ingresa tu nombre de usuario:"
read -r usuario
echo "Contraseña:"
read -sr contrasena

# Comprueba si el usuario existe en el sistema
if id "$usuario" &>/dev/null; then
    # Intenta autenticar al usuario usando su contraseña
    if su -c "exit" - "$usuario" <<< "$contrasena" 2>/dev/null; then
        echo "Inicio de sesión exitoso para el usuario $usuario"

        # Colores de texto
        rojo="\033[31m"
        verde="\033[32m"
        amarillo="\033[33m"
        azul="\033[34m"
        magenta="\033[35m"
        cian="\033[36m"
        blanco="\033[37m"
        reset="\033[0m"
        echo -e "${amarillo}BBBBBBBB    II  EEEEEEEE    NNN     NN    VV       VV   EEEEEEEE   NNN     NN     II   DDDD      OOOO   II ${reset}"
        echo -e "${azul}BB    BB    II  EE          NN N    NN     VV     VV    EE         NN N    NN     II   D   D    O    O  II ${reset}"
        echo -e "${verde}BBBBBB      II  EEEEEEE     NN  N   NN      VV   VV     EEEEEEE    NN  N   NN     II   D    D   O    O  II ${reset}"
        echo -e "${rojo}BB   BB     II  EE          NN   N  NN       VV VV      EE         NN   N  NN     II   D   D    O    O     ${reset}"
        echo -e "${magenta}BBBBBBBB    II  EEEEEEEE    NN    NNNN        VV        EEEEEEEE   NN    NNNN     II   DDDD      OOOO   O  ${reset}"

        # Obtener la carpeta actual
        carpeta_actual=$(pwd)

        echo -e "${cian}Carpeta actual: $carpeta_actual ${reset}"
        echo -e "${cian}Bienvenido $usuario, ¿Qué deseas hacer? ${reset}"

        # Mostrar opciones al usuario
        echo " Escribe 'Ayuda' para ver una lista de comandos disponibles :)"
        echo " Escribe 'infosis' para ver la información del sistema :)"
        echo " Escribe 'time' para ver la hora actual :)"

        # Leer la opción del usuario
        read -p "Ingresa la palabra clave de la opción: " opcion

        # Evaluar la opción
        case $opcion in
            "Ayuda")
                echo "Listado de comandos disponibles :)" ;;
            
            "infosis")
                echo "Información del sistema :)"
                echo
                echo "Nombre del equipo: $(hostname)"
                echo
                echo 
                echo "Dirección IP: $(hostname -I)"
                echo
                echo
                echo "Dirección MAC: $(ip link show | awk '/ether/ {print $2}')"
                echo
                echo
                echo "Fecha y hora: $(date)"
                echo
                echo
                echo "Versión del kernel: $(uname -r)"
                echo
                echo
                echo "Usuarios conectados: $(who -q)"
                echo
                echo
                echo "Memoria RAM disponible: $(free -h)"
                echo
                echo
                echo "Espacio en disco: $(df -h)"
                echo
                echo
                # Obtener la arquitectura del sistema
                arquitectura=$(arch)
                echo "Arquitectura del sistema: $arquitectura"
                echo
                echo
                # Obtener la versión del sistema operativo (requiere el paquete lsb-release)
                if [ -x "$(command -v lsb_release)" ]; then
                    version_so=$(lsb_release -d | awk -F ":\t" '{print $2}')
                    echo "Versión del sistema operativo: $version_so"o
                
                fi
                ;;

            "time")
                # Obtiene la hora actual
                time=$(timedatectl)
                # Muestra la hora actual
                echo "La hora actual es: $time"
                ;;





            "find")
            # Verifica si se proporcionaron los dos parámetros
            if [ $# -ne 2 ]; then
                echo "Uso: $0 <directorio> <nombre_de_archivo>"
                exit 1
            fi

            directorio="$1"
            archivo_a_buscar="$2"

            # Utiliza el comando find para buscar el archivo en el directorio especificado
            resultado=$(find "$directorio" -name "$archivo_a_buscar")

            # Verifica si el archivo fue encontrado
            if [ -n "$resultado" ]; then
                echo "El archivo $archivo_a_buscar fue encontrado en el directorio $directorio."
            else
                echo "El archivo $archivo_a_buscar no fue encontrado en el directorio $directorio."
            fi

            ;;

            

            *)
                echo "Opción no válida :(" ;;
        esac
    else
        echo "Contraseña incorrecta para el usuario $usuario"
    fi
else
    echo "El usuario $usuario no existe en el sistema"
fi
