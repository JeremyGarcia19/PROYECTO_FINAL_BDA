--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		              18/01/2023
-- @Descripción: Creación de archivo SPFILE a partir del PFILE
-- recuerda que este archivo se ejecuta por USUARIO ORACLE
--export ORACLE_SID=meproyga

--Conectando a la base de datos con usurio sys
Prompt conectando como usuario sys
connect sys/hola1234* as sysdba

--Creación del archivp SPFILE a partir de PFILE
Prompt creando SPFILE
create spfile from pfile;

!ls ${ORACLE_HOME}/dbs/spfile${ORACLE_SID}.ora
