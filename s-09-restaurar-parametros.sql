--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             18/01/2023
--@Descripción:          Script para restaurar parametros a la configuración por default

Prompt Conenctando como usuario SYS
connect sys/system2 as sysdba

create spfile from pfile='/media/HDD/proyecto_final/unam_bda/gym_bd/compartido/copiainicial-spparameter-pfile.txt';