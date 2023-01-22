--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear a los usuarios de la BD

create sequence sesion
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..500 loop
 select sesion into v_sequence from 
dual;
 insert into sesion
 values ( v_sequence,TRUNC(DBMS_RANDOM.value(1,1000000000)),
 TRUNC(DBMS_RANDOM.value(0,1)),TRUNC(DBMS_RANDOM.value(1,100))
  TO_DATE('20-MAR-2006','DD-MON-YYYY')
  TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/

create sequence bitacoras_calorias
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..500000 loop
 select bitacoras_calorias into v_sequence from 
dual;
 insert into bitacoras_calorias
 values ( TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,100))
  TRUNC(DBMS_RANDOM.value(1,100)),
  TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/

create sequence HIST_STATUS_DISP
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..500 loop
 select HIST_STATUS_DISP into v_sequence from 
dual;
 insert into HIST_STATUS_DISP
 values ( TRUNC(DBMS_RANDOM.value(1,1000000000)),
 TO_DATE('20-MAR-2006','DD-MON-YYYY')
  TRUNC(DBMS_RANDOM.value(1,1000000000)),TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/

create sequence medidas
 start with 1
 increment by 1
 nomaxvalue;

declare
 v_sequence number;
begin
 for n in 1..1000 loop
 select medidas into v_sequence from 
dual;
 insert into medidas
 values ( v_sequence, TRUNC(DBMS_RANDOM.value(1,100)),
TRUNC(DBMS_RANDOM.value(1,100)),TRUNC(DBMS_RANDOM.value(1,1000000000)),
  TRUNC(DBMS_RANDOM.value(1,1000000000))
  );
 end loop;
end;
/


commit;

