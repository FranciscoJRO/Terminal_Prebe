#!/bin/bash
trap ' ' 2 20

chmod +x ./*

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
        reset="\033[0m"
        echo -e "${amarillo}BBBBBBBB    II  EEEEEEEE    NNN     NN    VV       VV   EEEEEEEE   NNN     NN     II   DDDD      OOOO   II ${reset}"
        echo -e "${azul}BB    BB    II  EE          NN N    NN     VV     VV    EE         NN N    NN     II   D   D    O    O  II ${reset}"
        echo -e "${verde}BBBBBB      II  EEEEEEE     NN  N   NN      VV   VV     EEEEEEE    NN  N   NN     II   D    D   O    O  II ${reset}"
        echo -e "${rojo}BB   BB     II  EE          NN   N  NN       VV VV      EE         NN   N  NN     II   D   D    O    O     ${reset}"
        echo -e "${magenta}BBBBBBBB    II  EEEEEEEE    NN    NNNN        VV        EEEEEEEE   NN    NNNN     II   DDDD      OOOO   O  ${reset}"
        
        carpeta_codigos=$(pwd)
        echo
        echo " Escribe 'Ayuda' para ver una lista de comandos especiales disponibles :)"
        echo 
        echo

        while true; do
            # Obtener la carpeta actual
            carpeta_actual=$(pwd)

            echo
            echo -e "${cian}Carpeta actual: $carpeta_actual ${reset}"
            echo
            echo -e "${cian}Bienvenido $usuario, ¿Qué deseas hacer? ${reset}"
            # Leer la opción del usuario
            read -r opcion

            # Evaluar la opción
            case $opcion in
                "Ayuda")
                    source "$carpeta_codigos/ayuda.sh"
                    ;;
                
                "infosis")
                    source "$carpeta_codigos/infosis.sh"
                    
                    ;;
    
                "time")
                    source "$carpeta_codigos/time.sh"
                    ;;
    
                "find")
                    source "$carpeta_codigos/find.sh"
                    ;;

                "creditos")
                    source "$carpeta_codigos/creditos.sh"
                    ;;

                "juegos")
                source "$carpeta_codigos/juegos.sh"
                ;;

                "musica")
                source "$carpeta_codigos/Musica.sh"
                ;;

                "exit")
                    echo "Saliendo del sistema :("
                    exit 0 
                    ;;

                *)
                    eval "$opcion" || clear
                    ;;
            esac
            
        done
    else
        echo "Contraseña incorrecta para el usuario $usuario"
    fi
else
    echo "El usuario $usuario no existe en el sistema"
fi

trap - 2 20