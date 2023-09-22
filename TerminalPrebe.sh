#!/bin/bash
trap ' ' SIGINT SIGTERM #Evita que las señales mandadas por ctrl+c y ctrl+z sean leídas
# Colores de texto
            rojo="\033[31m"
            verde="\033[32m"
            amarillo="\033[33m"
            azul="\033[34m"
            magenta="\033[35m"
            cian="\033[36m"
            blanco="\033[37m"
            reset="\033[0m"


<<<<<<< HEAD
InfoSistema(){
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
        echo "Versión del sistema operativo: $version_so"
=======
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
>>>>>>> cb8a337 ([ADD][FRANK] Agregue los juegos y agregue imagenes)
    fi
}

tiempo(){
    # Obtiene la hora actual
    time=$(timedatectl)
    # Muestra la hora actual
    echo "La hora actual es: $time"
}

busqueda(){
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
}

infoPrograma(){
    verde="\033[32m"
    reset="\033[0m"
    echo -e "${verde}Créditos del Programador${reset}"
    echo "========================="
    echo "Nombre: Francisco Javier Reynoso Ortega"
    echo "Email: francisco.reynoso2000@gmail.com"
    echo "Sitio web: "
    echo "GitHub: https://github.com/FranciscoJRO"
    echo
    echo "¡Gracias por usar mi programa!"
}

ayuda(){
    echo " Escribe 'Ayuda' para ver una lista de comandos disponibles :)"
    echo " Escribe 'infosis' para ver la información del sistema :)"
    echo " Escribe 'time' para ver la hora actual :)"
    echo " Escribe 'find' para buscar un archivo en un directorio debes pasar 2 parametros:)"
    echo " Escribe 'exit' para salir :("
    echo " Escribe 'juegos' para ver nuestros juegos :)"
    echo " Escribe 'creditos' para ver los creditos :)"
}

# Función para mostrar el estado actual del ahorcado
mostrar_ahorcado() {
    case $intentos in
        0)
            echo "  ____"
            echo " |    |"
            echo " |"
            echo " |"
            echo " |"
            echo " |"
            echo "====="
            ;;
        1)
            echo "  ____"
            echo " |    |"
            echo " |    O"
            echo " |"
            echo " |"
            echo " |"
            echo "====="
            ;;
        2)
            echo "  ____"
            echo " |    |"
            echo " |    O"
            echo " |    |"
            echo " |"
            echo " |"
            echo "====="
            ;;
        3)
            echo "  ____"
            echo " |    |"
            echo " |    O"
            echo " |   /|"
            echo " |"
            echo " |"
            echo "====="
            ;;
        4)
            echo "  ____"
            echo " |    |"
            echo " |    O"
            echo " |   /|\\"
            echo " |"
            echo " |"
            echo "====="
            ;;
        5)
            echo "  ____"
            echo " |    |"
            echo " |    O"
            echo " |   /|\\"
            echo " |   /"
            echo " |"
            echo "====="
            ;;
        6)
            echo "  ____"
            echo " |    |"
            echo " |    O"
            echo " |   /|\\"
            echo " |   / \\"
            echo " |"
            echo "====="
            ;;
    esac
}

# Función para mostrar la palabra oculta
mostrar_palabra() {
    echo "Palabra oculta: $palabra_oculta"
}

# Función para verificar si se adivinó la palabra
adivinar_palabra() {
    if [[ "$palabra_oculta" == "$palabra" ]]; then
        echo "¡Has ganado! La palabra era '$palabra'."
        exit 0
    fi
}

hangman(){
    clear
    # Solicitar al usuario que ingrese la palabra a adivinar
    echo "Bienvenido al juego del ahorcado."
    read -p "Ingresa la palabra a adivinar: " palabra
    # Limpiar la pantalla
    clear
    # Longitud de la palabra
    longitud=${#palabra}
    # Palabra oculta con guiones bajos
    palabra_oculta=$(printf "%.${longitud}s" | tr ' ' '_')
    # Número máximo de intentos
    intentos_maximos=6
    # Número de intentos realizados
    intentos=0
    # Bucle principal del juego
    while [[ $intentos -lt $intentos_maximos ]]; do
        mostrar_ahorcado
        mostrar_palabra
        echo "Ingresa una letra:"
        read letra
        if [[ $letra =~ [a-zA-Z] ]]; then
            if [[ $palabra =~ $letra ]]; then
                for ((i = 0; i < ${#palabra}; i++)); do
                    if [[ "${palabra:$i:1}" == "$letra" ]]; then
                        palabra_oculta="${palabra_oculta:0:$i}$letra${palabra_oculta:$i+1}"
                    fi
                done
            else
                echo "Letra incorrecta. Intenta de nuevo."
                intentos=$((intentos + 1))
            fi
        else
            echo "Ingresa una letra válida."
        fi
        adivinar_palabra
    done
    # Si llegamos aquí, se han agotado los intentos
    mostrar_ahorcado
    echo "¡Has perdido! La palabra era '$palabra'."
}

PPT(){
    # Piedra, Papel o Tijera
    verde="\033[32m"
    while true; do
        echo -e "${verde}Juguemos a Piedra, Papel o Tijera.${reset}"
        echo "Elige una opción:"
        echo "1. Piedra"
        echo "2. Papel"
        echo "3. Tijera"
        echo "4. Salir"

        read -p "Ingresa el número de tu elección: " eleccion

        # Genera una elección aleatoria para la computadora (1 = Piedra, 2 = Papel, 3 = Tijera)
        computadora=$((RANDOM % 3 + 1))

        case $eleccion in
            1)
                jugador="Piedra"
                ;;
            2)
                jugador="Papel"
                ;;
            3)
                jugador="Tijera"
                ;;
            4)
                echo "Gracias por jugar. ¡Hasta luego!"
                return
                ;;
            *)
                echo "Opción no válida. Por favor, elige un número del 1 al 4."
                continue
                ;;
        esac

        case $computadora in
            1)
                comp="Piedra"
                ;;
            2)
                comp="Papel"
                ;;
            3)
                comp="Tijera"
                ;;
        esac

        echo "Jugador: $jugador"
        echo "Computadora: $comp"

        # Determina el resultado
        if [ "$jugador" == "$comp" ]; then
            resultado="Empate"
        elif [ "$jugador" == "Piedra" ] && [ "$comp" == "Tijera" ]; then
            resultado="¡Ganaste!"
        elif [ "$jugador" == "Papel" ] && [ "$comp" == "Piedra" ]; then
            resultado="¡Ganaste!"
        elif [ "$jugador" == "Tijera" ] && [ "$comp" == "Papel" ]; then
            resultado="¡Ganaste!"
        else
            resultado="¡La computadora gana!"
        fi

        echo "Resultado: $resultado"
    done
}

games(){
    echo "Bienvenido a nuestros juegos :)"
    echo "Escribe 'Ahorcado' para jugar al ahorcado :)"
    echo "Escribe 'Piedra' para jugar a piedra papel o tijera :)"
    echo "Escribe 'Salir' para salir de los juegos :("
    read -p "Ingresa la palabra clave de la opción: " opcion_juegos
    #A lo mejor hacerlo un bucle

    case $opcion_juegos in
        "Ahorcado")
            hangman
            ;;

        "Piedra")
            PPT
            ;;

        "Salir")
            echo "Saliendo de los juegos."
            return
            ;;

        *)
            echo "Opción de juegos no válida :("
            ;;
    esac
}

start(){
    echo "Hola, por favor ingresa tu nombre de usuario:"
    read -r usuario
    echo "Contraseña:"
    read -sr contrasena

    # Comprueba si el usuario existe en el sistema
    if id "$usuario" &>/dev/null; then
        # Intenta autenticar al usuario usando su contraseña
        if su -c "exit" - "$usuario" <<< "$contrasena" 2>/dev/null; then
            echo "Inicio de sesión exitoso para el usuario $usuario"

            
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
                ayuda #menú de opciones del menú principal
                echo 
                echo

                # Leer la opción del usuario
                read -p "Ingresa la palabra clave de la opción: " opcion

                # Evaluar la opción
                case $opcion in
                    "Ayuda")
                        ayuda
                        ;;
                    
                    "infosis")
                        InfoSistema
                        ;;
        
                    "time")
                        tiempo
                        ;;
        
                    "find")
                        busqueda
                        ;;
                    "creditos")
                        infoPrograma
                        ;;
                    "juegos")
                        games
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
}


start

trap - SIGINT SIGTERM