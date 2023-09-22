#!/bin/bash
trap ' ' 2 20

        echo "                                                        ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                                      
                                                        █████ ▄▄ █ ▄▄ █ ▄▄ █▄ ▄█ ▄▄ █ █ ▄▄ ███████████████████████████████████████████                                                        
                                                        █████ ████ ▀▄ █ ▀▄███ ██ ▀▄ █ █ ██ ███████████████████████████████████████████                                                        
                                                        █████ ▀▀ █ ██ █ █████ ██ ██ █ █ ██ ████▀▀▄▄▄▄▀▀███████████████████████████████                                                        
                                                        █████████████████████████████████████▀▄▓███████▄▄▀██████████████▀     ▀███████                                                        
                                                        ███████ ▄▄ █ █ ▄▄ █ ▄▄ █ ▄▄ █ ▄▄ ██▀▄█▓███████████▄▀██████████▀443333344▀█████                                                        
                                                        ███████ ▀▄██ █ ████ ▀▄ █ ▀▄▀█ ██ ██▐▐▓█████████████▐▐█████████ 333333333 █████                                                        
                                                        ███████ ████ █ ▀▀ █ ██ █ ██ █ ▀▄███▐▐▓████████████▌█▐██████████▄ 44444 ▄██████                                                        
                                                        ██████████████████████████████████▌█▌█▀▀▀▀▀██▀▄▄▄▄█▌▌██████████▀█▌   ▐█▀██████                                                        
                                                        ██████████████████▀▄▄▀███████████▌▌█▌▓█▀▀▀▀▄██▀▄  ▄█▄▌████████  ██   ██  █████                                                        
                                                        █████████████ ███ █▀▄█████████████▐▄▌█▄█▄▄█▌█▌███████▐▐███████  ▀     ▀  █████                                                        
                                                        ████████████████▀▄▀▄▀▄▄▀██████████▄▀▓▓█████▐██▐██████▌████████           █████                                                        
                                                        ██████████████▀▄▀▄▄▄▄▀▄█ ███████████▐▓▓█▀█▌█▀▀▄█▀███▀▄████████▄ ▄█████▄ ▄█████                                                        
                                                        █████████████▀▄▀▄▄▄▄▀▐ ▓ ▄▄▄▄▄▄▄▄▄▄▄▄▀▓█▌██▄█████▐██▐▄▄▀███████NCC-1701-D█████                                                        
                                                        ████████████▐█▒▒▄▄▄▄▓▄▓▀▄▓▓██████████▌█▓▐▀▀    ▄█▌█▌████▄▀████████████████████                                                        
                                                        ████████████▐█▒▓▓▓▓▓█▀▄▓██████████████▄▀▀██▄▄▄████▀▄▀█████ ███████████████████                                                        
                                                        ████████████▌██▒▒▓█▀▄█▓▓█████▀▀▀▀▀▀▀▀   ▀▄▀▀▀▀▀▀▀▄▀    ▀▀▀ ███████████████████                                                        
                                                        ███████████▀▄█████▐▓▓▀▀▀▀              ▀▄ ▀▀▀▀▀▀▀              ▀▀█████████████                                                        
                                                        ████████▀  ██████▌█                      ▀▄                         ▀█████████                                                        
                                                        ██████▀▄  ▒▒███▀ ▄  ▄░░██░█░░█░▄                           ▄▄▄▄▄▄▄    ▀███████                                                        
                                                        ██████ █▄▄ ▀▄▄▄░░▀▄░░███████████████████▄▄▄▄▄▄▄▄▄▄▄▄████████████████▄   ▀█████                                                        
                                                        █████▀▄█████████ ░░█████ █████████████████████████████████████████████▄  ▀████                                                        
                                                        ███▀▄█████████▀▄░█████▀   ██████████████████████████████▀▄▌█▐▄▀██████████ ████                                                        
                                                        ███ ████████▀▄░███████    ██████████████████████████████▀▌█▀█▐▀██████████▄ ███                                                        
                                                        ██ █████████ ██████████    ██████████████████████████████▌▌▄▐▐███████/)/\█ ███   "
# Obtener la hora y fecha actual 
grep "rtc_time" /proc/driver/rtc | awk '{print "La hora actual es: "$3}'
grep "rtc_date" /proc/driver/rtc | awk '{print "La fecha de hoy es: "$3}'

trap - 2 20