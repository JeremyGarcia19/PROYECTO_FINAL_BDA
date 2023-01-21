--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             18/01/2023
--@Descripción:	         Script para crear el diccionario de datos de la BD
-- recuerda que este archivo se ejecuta por USUARIO 

--Conectando a la base de datos con usurio sys
Prompt conectando como usuario sys
connect sys/system2 as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

--Conectando a la base de datos con usurio system
Prompt conectando como usuario sys
connect system/system2
@?/sqlplus/admin/pupbld.sql

connect sys/system2 as sysdba
shutdown immediate