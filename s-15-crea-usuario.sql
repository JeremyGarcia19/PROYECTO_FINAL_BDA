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
      'ADMIN_MODULO1',
      'BACKUP_MODULO1',
      'CONSULTAS_CLIENTE',
      'CONSULTAS_SESION',
      'ADMIN_MODULO2',
      'BACKUP_MODULO2',
      'CONSULTAS_GYMNASIOS'
    );
begin
  for user in cur_user_names loop
    dbms_output.put_line('Eliminando a usuario: ' || user.username);
    execute immediate 'drop user ' ||user.username|| ' cascade';
  end loop;
end;
/

Prompt Creando al usuario ADMIN_MODULO1
create user admin_modulo1 identified by admin;
grant create session, create table, create procedure, create user, create sequence to admin_modulo1;

Prompt Creando al usuario BACKUP_MODULO1
create user backup_modulo1 identified by backup_m1;
grant create session, sysbackup to backup_modulo1;

Prompt Creando al usuario CONSULTAS_CLIENTE
create user consultas_cliente identified by consultas_cliente;
grant create session to consultas_cliente;

Prompt Creando al usuario CONSULTAS_SESION
create user consultas_sesion identified by consultas_sesion;
grant create session to consultas_sesion;

Prompt Creando al usuario ADMIN_MODULO2
create user admin_modulo2 identified by admin;
grant create session, create table, create procedure, create user, create sequence  to admin_modulo2;

Prompt Creando al usuario BACKUP_MODULO2
create user backup_modulo2 identified by backup_m1;
grant create session, sysbackup to backup_modulo2;

Prompt Creando al usuario CONSULTAS_GYM
create user consultas_gym identified by consultas_gym;
grant create session to consultas_gym;

--Para los usuarios de las consultas se les deben agregar privilegios de select una vez que existan las tablas


whenever sqlerror continue;

