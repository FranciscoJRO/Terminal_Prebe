            # Genera un número aleatorio
            numero=$((RANDOM % 100 + 1))

            # Bucle de juego
            for i in {1..10}; do
            # Solicitar un número
            echo "Adivina el número mágico (1-100): "
            numero_jugador=$(read -p "Tu número: ")

            # Comprobar si el número es correcto
            if [ "$numero_jugador" = "$numero" ]; then
                echo "¡Ganaste!"
                break
            elif [ "$numero_jugador" -lt "$numero" ]; then
                echo "El número es mayor"
            else
                echo "El número es menor"
            fi
            done

            # Mostrar el resultado
            if [ "$numero_jugador" != "$numero" ]; then
            echo "¡Perdiste!"
            fi