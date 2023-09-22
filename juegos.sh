#!/bin/bash
# Imprimir diseño
echo -e "\e[36m           █▀▀▀ █▀▀█ █▀▄▀█ █▀▀ "
echo -e "\e[36m           █░▀█ █▄▄█ █░▀░█ █▀▀ "
echo -e "\e[36m           ▀▀▀▀ ▀░░▀ ▀░░░▀ ▀▀▀ "

while true; do
    echo "     
         ,....,                                          
        ,::::::<                                           
       ,::/^\"``.                                          
      ,::/, \`   e\`.                                        
     ,::; |        \'.                                      
     ,::|  \\___,-.  c)                                     
     ;::|     \\\   '-'                                      
     ;::|      \\                                           
     ;::|   _.=\`\\                                          
     \`;:|.=\` _.=\`\\                                         
       '|_.=\`   __\\                                        
       \`\\_..==\`\\ /                                         
        .'.___.-'.                                         
       /          \                                        
  jgs ('--......--')                                       
      /'--......--'\\                                       
      \`\"--......--\"\`"

    echo "Bienvenido a nuestros juegos :)"
    echo "Escribe 'Magica' para jugar al ahorcado :)"
    echo "Escribe 'Piedra' para jugar a piedra papel o tijera :)"
    echo "Escribe 'Salir' para salir de los juegos :("
    read -p "Ingresa la palabra clave de la opción: " opcion_juegos

    case $opcion_juegos in

    "Magica")
        
            echo "Bienvenido al juego de la palabra Magica."
            echo "
                                   __________________________
                                  |OFFo oON                  |
                                  | .----------------------. |
                                  | |  .----------------.  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  |                |  | |
                                  | |  '----------------'  | |
                                  | |__GAME BOY____________/ |
                                  |          ________        |
                                  |    .    (Nintendo)       |
                                  |  _| |_   \"\"\"\"\"\"\"\"   .-.  |
                                  |-[_   _]-       .-. (   ) |
                                  |   |_|         (   ) '-'  |
                                  |    '           '-'   A   |
                                  |                 B        |
                                  |          ___   ___       |
                                  |         (___) (___)  ,., |
                                  |        select start ;:;: |
                                  |                    ,;:;' /
                               jgs|                   ,:;:'.' 
                                  '-----------------------'
                                                                "
            
                    # Genera un número aleatorio
                    numero=$((RANDOM % 100 + 1))

                    # Bucle de juego
                    for i in {1..10}; do
                    # Solicitar un número
                    echo "Adivina el número mágico (1-100): "
                    read numero_jugador

                    # Comprobar si el número es correcto
                    if [ "$numero_jugador" -eq "$numero" ]; then
                        echo "¡Ganaste!"
                        break
                    elif [ "$numero_jugador" -lt "$numero" ]; then
                        echo "El número es mayor"
                    else
                        echo "El número es menor"
                    fi
                    done

                    # Mostrar el resultado
                    if [ "$numero_jugador" -ne "$numero" ]; then
                    echo "¡Perdiste!"
                    fi
                    
                    ;;



        "Piedra")
                # Código del juego de Piedra, Papel o Tijera aquí
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
                            return 0
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
                ;;

            "Salir")
                echo "Saliendo de los juegos."
                return 0
                ;;

    *)
        echo "Opción de juegos no válida :("
        ;;
    esac
done
