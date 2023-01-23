--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear a los usuarios de la BD

whenever sqlerror exit rollback;

Prompt Conectando como usuario SYS
connect sys/system2 as sysdba

set serveroutput on
Prompt Creando usuario
declare
  v_count number;
  v_username varchar2(40);
  cursor cur_user_names is
    select username from all_users where username in (
      'ADMIN_M1',
      'BACKUP_M1',
      'ADMIN_M2',
      'BACKUP_M2'
    );
begin
  for user in cur_user_names loop
    dbms_output.put_line('Eliminando a usuario: ' || user.username);
    execute immediate 'drop user ' ||user.username|| ' cascade';
  end loop;
end;
/

Prompt Creando al usuario ADMIN_MODULO1
create user admin_m1 identified by admin;
grant create session, create table, create procedure, create user, create sequence to admin_m1;

Prompt Creando al usuario BACKUP_MODULO1
create user backup_m1 identified by backup_m1;
grant create session, sysbackup to backup_m1;

Prompt Creando al usuario ADMIN_MODULO2
create user admin_m2 identified by admin;
grant create session, create table, create procedure, create user, create sequence  to admin_m2;

Prompt Creando al usuario BACKUP_MODULO2
create user backup_m2 identified by backup_m2;
grant create session, sysbackup to backup_m2;


--//////////////////////////////////////////////////////////////////////////////////
--Asignando cuota ilimitada y tablespace por defecto donde  se almacenan sus objetos

prompt Asignando cuotas a usuarios

alter user admin_m1 quota unlimited on catalogo1_ts;
alter user admin_m1 quota unlimited on sala_ts;
alter user admin_m1 quota unlimited on derivados_cliente_ts;
alter user admin_m1 quota unlimited on medidas_ts;
alter user admin_m1 quota unlimited on cliente_ts;
alter user admin_m1 quota unlimited on sesion_ts;
alter user admin_m1 quota unlimited on calorias_ts;
alter user admin_m1 quota unlimited on dispositivo_ts;
alter user admin_m1 quota unlimited on historico_ts;
alter user admin_m1 quota unlimited on blob_ts;
alter user admin_m1 quota unlimited on indices_sc_ts;
alter user admin_m1 quota unlimited on mod_sesiones_ts;

alter user admin_m2 quota unlimited on gimnasios_ts;
alter user admin_m2 quota unlimited on empleado_ts;
alter user admin_m2 quota unlimited on catalogo2_ts;
alter user admin_m2 quota unlimited on biometricos_ts;
alter user admin_m2 quota unlimited on multimedia_ts;
alter user admin_m2 quota unlimited on docs_ts;
alter user admin_m2 quota unlimited on mod_gimnasio_ts;
alter user admin_m2 quota unlimited on indices_g_ts;

prompt Cambiano el tablespace por default de cada usuario.

alter user admin_m1 default tablespace mod_sesiones_ts;
alter user backup_m1 default tablespace mod_sesiones_ts;
alter user admin_m2 default tablespace mod_gimnasio_ts;
alter user backup_m2 default tablespace mod_gimnasio_ts;

prompt Cambiando el tablespace temporary de cada usuario.

alter user admin_m1 temporary tablespace tempts1;
alter user backup_m1 temporary tablespace tempts1;
alter user admin_m2 temporary tablespace tempts1;
alter user backup_m2 temporary tablespace tempts1;

whenever sqlerror continue;

