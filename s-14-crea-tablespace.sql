--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		              18/01/2023
--@Descripción:        	Script para crear un archivo de passwords
-- recuerda que este archivo se ejecuta por USUARIO ORACLE

--//////////////////////////////////////////////////////////////
--/////////////////MODULO: sesiones y clientes//////////////////
--//////////////////////////////////////////////////////////////

whenever sqlerror exit rollback;

prompt Conectando con sys
connect sys/system2 as sysdba


prompt Creando tablespace store_tbs1 ...

create bigfile tablespace cliente_ts
  datafile 'unam_bda/gym_bd/modulo_01/u01/cliente_ts.dbf'
    size 500m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace catalogo1_ts
  datafile 'unam_bda/gym_bd/modulo_01/u03/catalogo1_ts.dbf'
    size 50m
    autoextend off
    --blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;
  
  alter tablespace catalogo1_ts read only;

create tablespace sala_ts
  datafile 'unam_bda/gym_bd/modulo_01/u04/sala_ts.dbf'
    size 100m
    autoextend on next 100m maxsize 500m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace derivados_cliente_ts
  datafile 'unam_bda/gym_bd/modulo_01/u05/derivados_cliente_ts.dbf'
    size 500m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create bigfile tablespace medidas_ts
  datafile 'unam_bda/gym_bd/modulo_01/u06/medidas_ts.dbf'
    size 500m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace sesion_ts
  datafile 'unam_bda/gym_bd/modulo_01/u07/sesion_ts.dbf'
    size 100m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create bigfile tablespace calorias_ts
  datafile 'unam_bda/gym_bd/modulo_01/u08/calorias_ts.dbf'
    size 400m
    autoextend on next 200m maxsize 2048m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace dispositivo_ts
  datafile 'unam_bda/gym_bd/modulo_01/u09/dispositivo_ts.dbf'
    size 100m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace historico_ts
  datafile 'unam_bda/gym_bd/modulo_01/u10/historico_ts.dbf'
    size 500m
    autoextend on next 100m maxsize 2048m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create bigfile tablespace blob_ts
  datafile ' unam_bda/gym_bd/modulo_01/u11/blob_ts.dbf'
    size 1024m
    autoextend on next 100m maxsize 5120m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace indices_sc_ts
  datafile 'unam_bda/gym_bd/modulo_01/u02/indices_sc_ts'
    size 50m
    autoextend on next 10m maxsize 700m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace mod_sesioes_ts
  datafile 'unam_bda/gym_bd/modulo_01/u12/mod_sesioes_ts.dbf'
    size 100m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

--//////////////////////////////////////////////////////////////
--////////////////////MODULO: gimnasio//////////////////////////
--//////////////////////////////////////////////////////////////

create tablespace gimnasios_ts
  datafile 'unam_bda/gym_bd/modulo_02/u01/gimnasios_ts.dbf'
    size 500m
    autoextend on next 100m maxsize 1024m
    blocksize 16k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace empleado_ts
  datafile 'unam_bda/gym_bd/modulo_02/u02/empleado_ts.dbf'
    size 50m
    
    autoextend on next 10m maxsize 500m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace catalogo2_ts
  datafile 'unam_bda/gym_bd/modulo_02/u03/catalogo2_ts.dbf'
    size 100m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace biometricos_ts
  datafile 'unam_bda/gym_bd/modulo_02/u04/biometricos_ts.dbf'
    size 10m
    autoextend on next 10m maxsize 200m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace multimedia_ts
  datafile 'unam_bda/gym_bd/modulo_02/u05/multimedia_ts.dbf'
    size 1024m
    autoextend on next 1024m maxsize 5120m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace docs_ts
  datafile 'unam_bda/gym_bd/modulo_02/u06/docs_ts.dbf'
    size 100m
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace indices_g_ts
  datafile 'unam_bda/gym_bd/modulo_02/u07/indices_g_ts.dbf'
    size 100m 
    autoextend on next 100m maxsize 1024m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;

create tablespace mod_gimasio_ts
  datafile 'unam_bda/gym_bd/modulo_02/u08/mod_gimasio_ts.dbf'
    size 50m
    autoextend on next 10m maxsize 700m
    blocksize 8k
  nologging
  offline
  extent management local
  segment space management auto;


prompt Listo!
disconnect