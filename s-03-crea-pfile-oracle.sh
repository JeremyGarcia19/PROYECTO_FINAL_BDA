#!/bin/bash
#@Autor:                Jeremy García Meneses
#@Autor:                Dulce Elízabeth Mendoza de la Vega
#@Fecha		              18/01/2023
#@Descripción:        	Script para crear el pfile de la bdll
# recuerda que este archivo se ejecuta por USUARIO ROOT (sudo)
echo "1. Creando un archivo de parámetros básico"
export ORACLE_SID=meproyga

pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora

if [ -f "${pfile}" ]; then
read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;

echo \
  "db_name='${ORACLE_SID}'
db_domain='fi.unam'
memory_target=768M
control_files=(
/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl)">${pfile}
  
echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}
