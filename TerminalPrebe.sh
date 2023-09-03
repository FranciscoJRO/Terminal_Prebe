#!/bin/bash

echo "Hola, por favor ingresa tu nombre de usuario:"
read usuario
echo "Contraseña:"
read -s contrasena



# Comprueba si el usuario existe en el sistema
if id "$usuario" &>/dev/null; then #Se utiliza el comando id para verificar si el usuario especificado existe en el sistema operativo. Si existe, este comando no producirá ningún mensaje de error y la salida se redirige a /dev/null
    # Intenta autenticar al usuario usando su contraseña
    if su -c "exit" - "$usuario" 2>/dev/null <<< "$contrasena"; then #Se utiliza el comando su para intentar autenticar al usuario especificado. Si la autenticación es exitosa, el comando exit devolverá un estado de salida de 0 y la salida se redirigirá a /dev/null
        echo "Inicio de sesión exitoso para el usuario $usuario"
        # Colores de texto
        rojo="\033[31m"
        verde="\033[32m"
        amarillo="\033[33m"
        azul="\033[34m"
        magenta="\033[35m"
        cian="\033[36m"
        Blanco="\033[37m"
        reset="\033[0m"
        echo -e "${amarillo}BBBBBBBB    II  EEEEEEEE    NNN     NN    VV       VV   EEEEEEEE   NNN     NN     II   DDDD      OOOO   II ${reset} "   
        echo -e "${azul}BB    BB    II  EE          NN N    NN     VV     VV    EE         NN N    NN     II   D   D    O    O  II ${reset}"   
        echo -e "${verde}BBBBBB      II  EEEEEEE     NN  N   NN      VV   VV     EEEEEEE    NN  N   NN     II   D    D   O    O  II ${reset}"   
        echo -e "${rojo}BB   BB     II  EE          NN   N  NN       VV VV      EE         NN   N  NN     II   D   D    O    O     ${reset}"   
        echo -e "${magenta}BBBBBBBB    II  EEEEEEEE    NN    NNNN        VV        EEEEEEEE   NN    NNNN     II   DDDD      OOOO   O  ${reset}"
        
    else
        echo "Contraseña incorrecta para el usuario $usuario"
    fi
else
    echo "El usuario $usuario no existe en el sistema"
fi
