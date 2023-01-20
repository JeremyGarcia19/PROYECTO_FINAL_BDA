#@Autor:                Jeremy García Meneses
#@Autor:                Dulce Elízabeth Mendoza de la Vega
#@Fecha		              18/01/2023
#@Descripción:          Script para crear directorios de redo logs y control file
# recuerda que este archivo se ejecuta por USUARIO ROOT (sudo)


# Creación de directorios para data files
export ORACLE_SID=meproyga

# Creación de directorios para Redo Log y Control Files
# Para Loop device 1
echo "Creación de directorios para Redo Log y Control Files Loop Device 1"
mkdir -p unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/${ORACLE_SID^^}

#Para Loop device 2
echo "Creación de directorios para Redo Log y Control Files Loop Device 2"
mkdir -p unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/${ORACLE_SID^^}

#Para Loop device 3
echo "Creación de directorios para Redo Log y Control Files Loop Device 3"
mkdir -p unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/${ORACLE_SID^^}

sudo chown -R oracle:oinstall unam_bda
sudo chmod -R 750 unam_bda

#Mostrando directorios creados
echo "Mostrando directorios para control files y Redo Logs"
ls -l unam_bda/gym_bd/redo_groups/u0*/app/oracle/oradata
