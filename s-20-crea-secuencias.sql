--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             20/01/2023
--@Descripción:        	 Script para crear secuencias

connect sys/system2 as sysdba

set serveroutput on

---Creación de secuencias
Prompt Creando secuencia para la sesión
create sequence sec_sesion
 start with 3001
 increment by 1
 nomaxvalue;


Prompt Creando secuencia para la bitacora de calorías ...
create sequence sec_bitacoras_calorias
 start with 3001
 increment by 1
 nomaxvalue;

Prompt Creando secuencia para el historico ...
create sequence sec_hist_status_disp
 start with 3001
 increment by 1
 nomaxvalue;

Prompt Creando secuencia para la tabla sec_medidas
create sequence sec_medidas
  start with 3001
  increment by 1
  nomaxvalue;

