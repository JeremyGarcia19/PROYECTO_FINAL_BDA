--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             18/01/2023
--@Descripción:		       Script que ejecuta la instrucción create database
-- recuerda que este archivo se ejecuta por USUARIO NORMAL
-- recuerda que antes de ejecutar el script debes exportar la variable ORACLE_SID=meproyga en la terminal

Prompt Conectando como usuario SYS
connect sys/hola1234* as sysdba

Prompt Iniciando la BD en modo nomount
startup nomount

whenever sqlerror exit rollback;

create database meproyga
  user sys identified by system2
  user system identified by system2
  logfile group 1 (
    'unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/MEPROYGA/redo01a.log',
    'unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/MEPROYGA/redo01b.log',
    'unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/MEPROYGA/redo01c.log') size 500m blocksize 512,
  group 2 (
    'unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/MEPROYGA/redo02a.log',
    'unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/MEPROYGA/redo02b.log',
    'unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/MEPROYGA/redo02c.log') size 500m blocksize 512,
  group 3 (
    'unam_bda/gym_bd/redo_groups/u01/app/oracle/oradata/MEPROYGA/redo03a.log',
    'unam_bda/gym_bd/redo_groups/u02/app/oracle/oradata/MEPROYGA/redo03b.log',
    'unam_bda/gym_bd/redo_groups/u03/app/oracle/oradata/MEPROYGA/redo03c.log') size 500m blocksize 512
  maxloghistory 1
  maxlogfiles 6
  maxlogmembers 3
  maxdatafiles 50
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile 'unam_bda/gym_bd/compartido/system01.dbf'
    size 1G reuse autoextend on next 1G maxsize unlimited
  sysaux datafile 'unam_bda/gym_bd/compartido/sysaux01.dbf'
    size 500m reuse autoextend on next 100m maxsize unlimited
  default tablespace users
    datafile 'unam_bda/gym_bd/compartido/users01.dbf'
    size 200m reuse autoextend on next 200m maxsize 1G
  default temporary tablespace tempts1
    tempfile 'unam_bda/gym_bd/compartido/temp01.dbf'
    size 50m reuse autoextend on next 10m maxsize 500m
  undo tablespace undotbs1
    datafile 'unam_bda/gym_bd/compartido/undotbs01.dbf'
    size 250m reuse autoextend on next 250m maxsize 2G;

Prompt Homologando password de sys y system
alter user sys identified by system2;
alter user system identified by system2;
whenever sqlerror continue;