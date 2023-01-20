--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script deshabilitar el pool de conexiones

whenever sqlerror exit rollback;

Prompt Conectando como usuario SYS
connect sys/system2 as sysdba

exec dbms_connection_pool.stop_pool();
exec dbms_connection_pool.restore_defaults();


whenever sqlerror continue;
