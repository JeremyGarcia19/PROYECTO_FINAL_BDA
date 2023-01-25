--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             20/01/2023
--@Descripción:        	 Script para habilitar la generación de datos de redo en los tablespaces necesarios

connect sys/system2 as sysdba

--Carpetas para backups
!sudo mkdir -p /media/HDD/proyecto_final/unam_bda/gym_bd/backups/u01
!sudo mkdir -p /media/HDD/proyecto_final/unam_bda/gym_bd/backups/u02

!sudo chown -R oracle:oinstall /media/HDD/proyecto_final/unam_bda/gym_bd
!sudo chmod -R 750 /media/HDD/proyecto_final/unam_bda/gym_bd

--Activación de flashback
alter database flashback on;

alter tablespace sala_ts logging;
alter tablespace derivados_cliente_ts logging;
alter tablespace medidas_ts logging;
alter tablespace cliente_ts logging;
alter tablespace sesion_ts logging;
alter tablespace calorias_ts logging;
alter tablespace dispositivo_ts logging;
alter tablespace historico_ts logging;
alter tablespace blob_ts logging;
alter tablespace mod_sesiones_ts logging;
alter tablespace gimnasios_ts logging;
alter tablespace empleado_ts logging;
alter tablespace biometricos_ts logging;
alter tablespace multimedia_ts logging;
alter tablespace docs_ts logging;
alter tablespace mod_gimnasio_ts logging;



