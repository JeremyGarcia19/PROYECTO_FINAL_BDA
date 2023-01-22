--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear a los usuarios de la BD

connect target "backup_modulo1@meproyga as as sysbackup";

run {
configure device type disk parallelism 3;
configure default device type to disk;
allocate channel disk1 device type disk format '/media/HDD/proyecto_final/unam_bda/gym_bd/backup_1/MEPROYGA/disk1/%d_backups/%u' maxpiecesize 1g;
allocate channel disk2 device type disk format '/media/HDD/proyecto_final/unam_bda/gym_bd/backup_2/MEPROYGA/disk2/%d_backups/%u' maxpiecesize 1g;
allocate channel disk3 device type disk clear;
configure controlfile autobackup format for device type disk clear;
configure retention policy to recovery window of 30 days;
--para eliminar los backup obsoletos son delete obsolete
configure archivelog deletion policy to backed up 2 times to disk;
configure backup optimization on;

shutdown immediate;
startup mount;
backup database plus archivelog;
backup as copy device type disk database;
backup as backupset database;
backup spfile;
backup as backupset incremental level 0 database;
backup as backupset incremental level 1 database;
backup as backupset incremental level 1 cumulative database;

--reviar parametro log_archive_dest_n='LOCATION=USE_DB_RECOVERY_FILE_DEST'

alter database open;
}