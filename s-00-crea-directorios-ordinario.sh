#!/bin/bash

#@Autor:		Jeremy García Meneses
#@Autor:		Dulce Elízabeth Mendoza de la Vega
#@Fecha:	 	17/01/2023
#@Descripción:		Script para generar la estructura de directorios de la BD (Ejecutar donde se quiere generar)
# recuerda que este archivo se ejecuta por USUARIO NORMAL
#Directorio raíz de la bd
dir_root_bd="unam_bda/gym_bd"

#Oracle SID
ORACLE_SID=meproyga

#Verificar si el directorio existe
if [ -d $dir_root_bd ]; then
  echo "La estructura de directorio ya existe"
else
  #Creación de la estructura de directorios
  mkdir -p unam_bda/gym_bd/dbs
  mkdir -p unam_bda/gym_bd/redo_groups
    mkdir -p unam_bda/gym_bd/redo_groups/u01
    mkdir -p unam_bda/gym_bd/redo_groups/u02
    mkdir -p unam_bda/gym_bd/redo_groups/u03
  mkdir -p unam_bda/gym_bd/compartido
  mkdir -p unam_bda/gym_bd/archive_files/u01
  mkdir -p unam_bda/gym_bd/archive_files/u02
  mkdir -p unam_bda/gym_bd/backups
  mkdir -p unam_bda/gym_bd/fra
  mkdir -p unam_bda/gym_bd/modulo_01
    mkdir -p unam_bda/gym_bd/modulo_01/u01/cliente_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u02/indices_sc_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u03/catalogo1_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u04/sala_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u05/derivados_cliente_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u06/medidas_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u07/sesion_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u08/calorias_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u09/dispositivo_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u10/historico_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u11/blob_ts
    mkdir -p unam_bda/gym_bd/modulo_01/u12/mod_sesioes_ts
  mkdir -p unam_bda/gym_bd/modulo_02
    mkdir -p unam_bda/gym_bd/modulo_02/u01/gimnasios_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u02/empleado_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u03/catalogo2_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u04/biometricos_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u05/multimedia_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u06/docs_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u07/indices_g_ts
    mkdir -p unam_bda/gym_bd/modulo_02/u08/mod_gimasio_ts
  mkdir -p unam_bda/disk_images
  echo "Se ha creado la estructura de directorios"
fi
