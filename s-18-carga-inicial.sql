--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para realizar la carga inicial de datos

connect sys/system2 as sysdba

whenever sqlerror exit rollback;

connect admin_m2/admin
Prompt Cargando Datos GIMNASIO
@s-28-carga-gimnasio.sql
Prompt Cargando Datos CONTENIDO_MULTIMEDIA
@s-29-carga-contenido-multimedia.sql
Prompt Cargando Datos PUESTO
@s-30-carga-puesto.sql
Prompt Cargando Datos EMPLEADO
@s-31-carga-empleado.sql
Prompt Cargando Datos ADMINISTRADOR
@s-32-carga-administrador.sql
Prompt Cargando Datos INSTRUCTOR
@s-33-carga-instructor.sql
Prompt Cargando Datos INSTRUCTOR_URL
@s-34-instructor_url.sql
Prompt Cargando EMPLEADO_BIOMETRICO
@s-35-carga-empleado-biometrico.sql
commit;

connect admin_m1/admin
Prompt Cargando CLIENTE
@s-36-carga-cliente.sql
Prompt Cargando CREDENCIAL
@s-37-carga-credencial.sql
Prompt Cargando SENSOR
@s-38-carga-sensor.sql
Prompt Cargando MEDIDAS
@s-39-carga-medidas.sql
Prompt Cargando SALA
@s-40-carga-sala.sql
Prompt Cargando DISCIPLINA
@s-41-carga-disciplina.sql
Prompt Cargando SALA_DISCIPLINA
@s-42-carga-sala-disciplina.sql
Prompt Cargando SESION
@s-43-carga-sesion.sql
Prompt Cargando BITACORA_CALORIAS
@s-44-carga-bitacora-calorias.sql
Prompt Cargando TIPO_DISPOSITIVO
@s-45-carga-tipo-dispositivo.sql
Prompt Cargando STATUS_DISPOSITIVO
@s-46-carga-status-dispositivo.sql
Prompt Cargando DISPOSITIVO
@s-47-carga-dispositivo.sql
Prompt Cargando DISPOSITIVO_SESION
@s-48-carga-dispositivo-sesion.sql
Prompt Cargando HIST_STATUS_DISP
@s-49-carga-hist_status_disp.sql
commit;

connect sys/system2 as sysdba

whenever sqlerror continue;