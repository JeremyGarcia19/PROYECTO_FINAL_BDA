--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear a los usuarios de la BD

create sequence sec_sesion
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
 values ( v_sequence,sys.dbms_random.value(1,1000000000),
 sys.dbms_random.value(0,1),sys.dbms_random.value(1,100),
  TO_DATE('20-MAR-2006','DD-MON-YYYY'),
  sys.dbms_random.value(1,1000000000),sys.dbms_random.value(1,1000000000)
  );
 end loop;
end;
/

create sequence sec_bitacoras_calorias
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
 values ( sys.dbms_random.value(1,1000000000),sys.dbms_random.value(1,100),
  sys.dbms_random.value(1,100),
  sys.dbms_random.value(1,1000000000),sys.dbms_random.value(1,1000000000)
  );
 end loop;
end;
/

create sequence sec_HIST_STATUS_DISP
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
 values ( sys.dbms_random.value(1,1000000000),
 TO_DATE('20-MAR-2006','DD-MON-YYYY'),
  sys.dbms_random.value(1,1000000000),sys.dbms_random.value(1,1000000000)
  );
 end loop;
end;
/

create sequence sec_medidas
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
 values ( v_sequence, sys.dbms_random.value(1,100),
sys.dbms_random.value(1,100),sys.dbms_random.value(1,1000000000),
  sys.dbms_random.value(1,1000000000)
  );
 end loop;
end;
/


commit;