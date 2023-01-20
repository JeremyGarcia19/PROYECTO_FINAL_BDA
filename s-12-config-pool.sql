--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para cconfigurar habilitar un pool de conexiones


whenever sqlerror exit rollback;

Prompt conectando como sys
connect sys/system2 as sysdba

Prompt Iniciando connection pool
exec dbms_connection_pool.start_pool();

exec dbms_connection_pool.alter_param('','MAXSIZE','30');
exec dbms_connection_pool.alter_param('','MINSIZE','10');

exec dbms_connection_pool.alter_param('','INACTIVITY_TIMEOUT','18000');
exec dbms_connection_pool.alter_param('','MAX_THINK_TIME','18000');


whenever sqlerror continue;
