#!/bin/bash
#@Autor:                Jeremy García Meneses
#@Autor:                Dulce Elízabeth Mendoza de la Vega
#@Fecha		              18/01/2023
#@Descripción:        	Script para crear un archivo de passwords

echo "Creando archivo de passwords"

echo "Configurando ORACLE_SID"
export ORACLE_SID=meproyga

echo "ORACLE_SID=${ORACLE_SID}"

echo "Creando archivo de passwords, se sobreescribe si existe"
orapwd FORCE=Y  \
  FILE="${ORACLE_HOME}/dbs/orapw${ORACLE_SID}" \
  FORMAT=12.2 \
  SYS=password

echo "Comprobando creación del archivo"
ls -l ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}


