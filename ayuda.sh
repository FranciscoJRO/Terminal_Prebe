#!/bin/bash
trap ' ' 2 20

echo "Listado de comandos disponibles :)" 
echo "Ayuda: Muestra una lista de los comandos disponibles :)"
echo "infosis: Muestra la información del sistema :)"
echo "time: Muestra la hora actual :)"
echo "find: Busca un archivo en un directorio :)"
echo "creditos: Muestra los créditos :)"
echo "juegos: Muestra nuestros juegos :)"
echo "exit: Sale del sistema :("
echo

trap - 2 20