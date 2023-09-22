#!/bin/bash

echo "Hola, por favor ingresa tu nombre de usuario:"
read usuario
echo "Contraseña:"
read -s contrasena

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
        
        while true; do
            # Obtener la carpeta actual
            carpeta_actual=$(pwd)

            echo
            echo -e "${cian}Carpeta actual: $carpeta_actual ${reset}"
            echo
            echo -e "${cian}Bienvenido $usuario, ¿Qué deseas hacer? ${reset}"
            echo
            echo " Escribe 'Ayuda' para ver una lista de comandos disponibles :)"
            echo " Escribe 'infosis' para ver la información del sistema :)"
            echo " Escribe 'time' para ver la hora actual :)"
            echo " Escribe 'find' para buscar un archivo en un directorio debes pasar 2 parametros:)"
            echo " Escribe 'juegos' para ver nuestros juegos :)"
            echo " Escribe 'creditos' para ver los créditos :)"
            echo " Escribe 'exit' para salir :("
            echo 
            echo

            # Leer la opción del usuario
            read -p "Ingresa la palabra clave de la opción: " opcion

            # Evaluar la opción
            case $opcion in
                "Ayuda")
                    echo "Listado de comandos disponibles :)" 
                    echo "Ayuda: Muestra una lista de los comandos disponibles :)"
                    echo "infosis: Muestra la información del sistema :)"
                    echo "time: Muestra la hora actual :)"
                    echo "find: Busca un archivo en un directorio :)"
                    echo "creditos: Muestra los créditos :)"
                    echo "juegos: Muestra nuestros juegos :)"
                    echo "exit: Sale del sistema :("
                    echo 
                    ;;
                
                "infosis")
                    source infosis.sh
                    
                    ;;
    
                "time")
                    source time.sh
                    ;;
    
                "find")
                    echo "Debes ingresar los parámetros de la siguiente manera: /ruta/a/mi/directorio miarchivo.txt"
                    # Leer el directorio y el nombre del archivo
                    read -p "Ingresa el directorio: " directorio
                    read -p "Ingresa el nombre del archivo: " archivo_a_buscar

                    # Utiliza el comando find para buscar el archivo en el directorio especificado
                    resultado=$(find "$directorio" -name "$archivo_a_buscar")

                    # Verifica si el archivo fue encontrado
                    if [ -n "$resultado" ]; then
                        echo "El archivo $archivo_a_buscar fue encontrado en el directorio $directorio."
                    else
                        echo "El archivo $archivo_a_buscar no fue encontrado en el directorio $directorio."
                    fi
                    ;;
                "creditos")
                    source creditos.sh
                    ;;

                "juegos")
                source juegos.sh
                   
                   
                   ;;

                "exit")
                    echo "Saliendo del sistema :("
                    exit 0 
                    ;;

                *)
                    echo "Opción no válida :("
                    ;;
            esac
            
        done
    else
        echo "Contraseña incorrecta para el usuario $usuario"
    fi
else
    echo "El usuario $usuario no existe en el sistema"
fi
