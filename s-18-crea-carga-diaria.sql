--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear a los usuarios de la BD

create sequence backup_modulo1.sesion
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..500 loop
 select backup_modulo1.sesion into v_sequence from 
dual;
 insert into backup_modulo1.sesion
 values ( v_sequence,TRUNC(DBMS_RANDOM.value(1,1000000000)),
 TRUNC(DBMS_RANDOM.value(0,1)),TRUNC(DBMS_RANDOM.value(1,100))
  TO_DATE('20-MAR-2006','DD-MON-YYYY')
  TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/

create sequence backup_modulo1.bitacoras_calorias
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..500000 loop
 select backup_modulo1.bitacoras_calorias into v_sequence from 
dual;
 insert into backup_modulo1.bitacoras_calorias
 values ( TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,100))
  TRUNC(DBMS_RANDOM.value(1,100)),
  TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/

create sequence backup_modulo1.HIST_STATUS_DISP
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..500 loop
 select backup_modulo1.HIST_STATUS_DISP into v_sequence from 
dual;
 insert into backup_modulo1.HIST_STATUS_DISP
 values ( TRUNC(DBMS_RANDOM.value(1,1000000000)),
 TO_DATE('20-MAR-2006','DD-MON-YYYY')
  TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/

create sequence backup_modulo1.medidas
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..1000 loop
 select backup_modulo1.medidas into v_sequence from 
dual;
 insert into backup_modulo1.medidas
 values ( v_sequence, TRUNC(DBMS_RANDOM.value(1,100)),
TRUNC(DBMS_RANDOM.value(1,100)),TRUNC(DBMS_RANDOM.value(1,1000000000)),
  TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/


commit;

