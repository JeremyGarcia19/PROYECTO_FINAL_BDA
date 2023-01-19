--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             18/01/2023
--@Descripción:        	 Script para crear un pfile a partir de un spfile
--Ejecutar despues de crear la BD
Prompt Conenctando como usuario SYS
connect sys/system2 as sysdba

create pfile='/media/HDD/proyecto_final/unam_bda/gym_bd/compartido/copiainicial-spparameter-pfile.txt' from spfile;

Prompt Comprobando la creación del archivo
!sudo ls unam_bda/gym_bd/compartido

