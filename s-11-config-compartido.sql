--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para configurar el modo de conexión compartido en la BD
whenever sqlerror exit rollback;

Prompt Conectando como usuario SYS
connect sys/system2 as sysdba

Prompt Configurando conexión compartida

alter system set shared_servers = 10  scope = both;

alter system set dispatchers='(dispatchers=5)(PROTOCOL=tcp)' scope = both;

Prompt Verificación de parametros
show parameter shared_servers;
show parameter dispatchers;

--El listener tiene que estar iniciado

Prompt Actualizando la configuración del listener
alter system register;

Prompt Mostrando lista de servicios.
!lsnrctl services


whenever sqlerror continue;
