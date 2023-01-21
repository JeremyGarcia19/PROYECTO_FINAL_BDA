#!/bin/bash
#@Autor:                Jeremy García Meneses
#@Autor:                Dulce Elízabeth Mendoza de la Vega
#@Fecha		              18/01/2023
#@Descripción:        	Script para crear el pfile de la bdll
# recuerda que este archivo se ejecuta por USUARIO ORACLE
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
/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl)
log_archive_max_processes = 3
log_archive_dest_1 = 'LOCATION=/media/HDD/proyecto_final/unam_bda/gym_bd/archive_files/u01'
log_archive_dest_2 = 'LOCATION=/media/HDD/proyecto_final/unam_bda/gym_bd/archive_files/u02'
log_archive_format = 'arch_meproyga_%t_%s_%r.arc'
log_archive_min_succeed_dest = 2
db_recovery_file_dest_size = 51200m
db_recovery_file_dest='/media/HDD/proyecto_final/unam_bda/gym_bd/fra'
db_flashback_retention_target = 259200
">${pfile}




echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}
