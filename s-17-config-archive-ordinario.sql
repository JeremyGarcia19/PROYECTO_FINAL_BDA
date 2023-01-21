--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para habilitar el modo archive en la BD


--La instancia debe estar iniciada antes de ejecutar este script
Prompt Conectandonos a la BD como SYS
connect sys/system2 as sysdba

!sudo mkdir -p /media/HDD/proyecto_final/unam_bda/gym_bd/archive_files/u01
!sudo mkdir -p /media/HDD/proyecto_final/unam_bda/gym_bd/archive_files/u02

!sudo chown -R oracle:oinstall /media/HDD/proyecto_final/unam_bda/gym_bd/archive_files
!sudo chmod -R 750 /media/HDD/proyecto_final/unam_bda/gym_bd/archive_files

--Agregando miembros a los grupos de redo
alter database add logfile member 
  '/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/MEPROYGA/redo01a.log' to group 1;
alter database add logfile member 
  '/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/MEPROYGA/redo01b.log' to group 1;
alter database add logfile member 
  '/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/MEPROYGA/redo02a.log' to group 2;
alter database add logfile member 
  '/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/MEPROYGA/redo02b.log' to group 2;
alter database add logfile member 
  '/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/MEPROYGA/redo03a.log' to group 3;
alter database add logfile member 
  '/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/MEPROYGA/redo03b.log' to group 3;


--Reiniciamos la instancia en modo mount 
shutdown
startup mount
alter database archivelog;

--Abrimos la instancia y verificamos que el modo archive esté activo
alter database open;
archive log list

--Destino de los archive redo log en la FRA
alter system set log_archive_dest_3 = 'LOCATION=USE_DB_RECOVERY_FILE_DEST MANDATORY' scope = both;

--Detenemos completamente la instancia
shutdown