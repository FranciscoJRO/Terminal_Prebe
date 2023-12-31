#!/bin/bash
trap ' ' 2 20


                    echo "Información del sistema :)"
                    echo ".... NO! ...                  ... MNO! ...                          
                        ..... MNO!! ...................... MNNOO! ...                         
                      ..... MMNO! ......................... MNNOO!! .                         
                     .... MNOONNOO!   MMMMMMMMMMPPPOII!   MNNO!!!! .                          
                      ... !O! NNO! MMMMMMMMMMMMMPPPOOOII!! NO! ....                           
                         ...... ! MMMMMMMMMMMMMPPPPOOOOIII! ! ...                             
                        ........ MMMMMMMMMMMMPPPPPOOOOOOII!! .....                            
                        ........ MMMMMOOOOOOPPPPPPPPOOOOMII! ...                              
                         ....... MMMMM..    OPPMMP    .,OMI! ....                             
                          ...... MMMM::   o.,OPMP,.o   ::I!! ...                              
                              .... NNM:::.,,OOPM!P,.::::!! ....                               
                               .. MMNNNNNOOOOPMO!!IIPPO!!O! .....                             
                              ... MMMMMNNNNOO:!!:!!IPPPPOO! ....                              
                                .. MMMMMNNOOMMNNIIIPPPOO!! ......                             
                               ...... MMMONNMMNNNIIIOO!..........                             
                            ....... MN MOMMMNNNIIIIIO! OO ..........                          
                         ......... MNO! IiiiiiiiiiiiI OOOO ...........                        
                       ...... NNN.MNO! . O!!!!!!!!!O . OONO NO! ........                      
                        .... MNNNNNO! ...OOOOOOOOOOO .  MMNNON!........                       
                        ...... MNNNNO! .. PPPPPPPPP .. MMNON!........                         
                           ...... OO! ................. ON! .......                           
                              ................................"

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
                    fi

trap - 2 20