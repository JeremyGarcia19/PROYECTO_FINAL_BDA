connect sys/system2 as sysdba

whenever sqlerror exit rollback;

Prompt Cargando Datos GIMNASIO
@s-26-carga-gimnasio.sql
Prompt Cargando Datos CONTENIDO_MULTIMEDIA
@s-27-carga-contenido-multimedia.sql
Prompt Cargando Datos PUESTO
@s-28-carga-puesto.sql
Prompt Cargando Datos EMPLEADO
@s-29-carga-empleado.sql
Prompt Cargando Datos ADMINISTRADOR
@s-30-carga-administrador.sql
Prompt Cargando Datos INSTRUCTOR
@s-31-carga-instructor.sql
Prompt Cargando Datos INSTRUCTOR_URL
@s-32-instructor_url.sql

Prompt Cargando EMPLEADO_BIOMETRICO
@s-33-carga-empleado-biometrico.sql
Prompt Cargando CLIENTE
@s-34-carga-cliente.sql
Prompt Cargando CREDENCIAL
@s-35-carga-credencial.sql
Prompt Cargando SENSOR
@s-36-carga-sensor.sql
Prompt Cargando MEDIDAS
@s-37-carga-medidas.sql
Prompt Cargando SALA
@s-38-carga-sala.sql
Prompt Cargando DISCIPLINA
@s-39-carga-disciplina.sql
Prompt Cargando SALA_DISCIPLINA
@s-40-carga-sala-disciplina.sql
Prompt Cargando SESION
@s-41-carga-sesion.sql
Prompt Cargando BITACORA_CALORIAS
@s-42-carga-bitacora-calorias.sql
Prompt Cargando TIPO_DISPOSITIVO
@s-43-carga-tipo-dispositivo.sql
Prompt Cargando STATUS_DISPOSITIVO
@s-44-carga-status-dispositivo.sql
Prompt Cargando DISPOSITIVO
@s-45-carga-dispositivo.sql
Prompt Cargando DISPOSITIVO_SESION
@s-46-carga-dispositivo-sesion.sql
Prompt Cargando HIST_STATUS_DISP
@s-47-carga-hist_status_disp.sql

commit;

whenever sqlerror continue;