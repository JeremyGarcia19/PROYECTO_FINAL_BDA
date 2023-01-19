--@Autor:		Jeremy García Meneses
--@Fecha creación:	26/10/2022
--@Descripción:		Script para configurar una conexión compartida temporalmente

whenever sqlerror exit rollback;

Prompt Conectando como usuario SYS
connect sys/system2 as sysdba

Prompt Configurando conexión compartida

alter system set shared_servers=4

alter system set dispatchers='(dispatchers=2)(PROTOCOL=tcp)'

Prompt Verificación de parametros
show parameter shared_servers;
show parameter dispatchers;

--El listener tiene que estar iniciado

Prompt Actualizando la configuración del listener
alter system register;

Prompt Mostrando lista de servicios.
!lsnrctl services


whenever sqlerror continue;
