#!/bin/bash
#@Autor:                Jeremy García Meneses
#@Autor:                Dulce Elízabeth Mendoza de la Vega
#@Fecha		              18/01/2023
#@Descripción:        	Script para crear el pfile de la bdll

echo "1. Creando un archivo de parámetros básico"
export ORACLE_SID=meproyga

pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora

if [ -f "${pfile}" ]; then
read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;

echo \
"db_name='${ORACLE_SID}'
memory_target=768M
control_files=(unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl)
">$pfile

echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}
