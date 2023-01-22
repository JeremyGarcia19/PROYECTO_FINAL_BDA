connect sys/system2 as sysdba

whenever sqlerror exit rollback;

Prompt Cargando Datos GIMNASIO
@s-20-carga-gimnasio.sql
Prompt Cargando Datos CONTENIDO_MULTIMEDIA
@s-21-carga-contenido-multimedia.sql
Prompt Cargando Datos PUESTO
@s-22-carga-puesto.sql
Prompt Cargando Datos EMPLEADO
@s-23-carga-empleado.sql
Prompt Cargando Datos ADMINISTRADOR
@s-24-carga-administrador.sql
Prompt Cargando Datos INSTRUCTOR
@s-25-carga-instructor.sql
Prompt Cargando Datos INSTRUCTOR_URL
@s-26-instructor_url.sql

Prompt Cargando EMPLEADO_BIOMETRICO
@s-27-carga-empleado-biometrico.sql
Prompt Cargando CLIENTE
@s-28-carga-cliente.sql
Prompt Cargando CREDENCIAL
@s-29-carga-credencial.sql
Prompt Cargando SENSOR
@s-30-carga-sensor.sql
Prompt Cargando MEDIDAS
@s-31-carga-medidas.sql
Prompt Cargando SALA
@s-32-carga-sala.sql
Prompt Cargando DISCIPLINA
@s-33-carga-disciplina.sql
Prompt Cargando SALA_DISCIPLINA
@s-34-carga-sala-disciplina.sql
Prompt Cargando SESION
@s-35-carga-sesion.sql
Prompt Cargando BITACORA_CALORIAS
@s-36-carga-bitacora-calorias.sql
Prompt Cargando TIPO_DISPOSITIVO
@s-37-carga-tipo-dispositivo.sql
Prompt Cargando STATUS_DISPOSITIVO
@s-38-carga-status-dispositivo.sql
Prompt Cargando DISPOSITIVO
@s-39-carga-dispositivo.sql
Prompt Cargando DISPOSITIVO_SESION
@s-40-carga-dispositivo-sesion.sql
Prompt Cargando HIST_STATUS_DISP
@s-41-carga-hist_status_disp.sql

commit;

whenever sqlerror continue;