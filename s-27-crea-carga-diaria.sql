--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             20/01/2023
--@Descripción:        	 Script para simular los datos que se cargan en un dia.

connect admin_m1/admin

set serveroutput on

whenever sqlerror exit rollback;

Prompt Cargando datos diarios de sesiones ...
declare
 v_sequence number;
 v_bit number;
begin
  for n in 1..50000 loop
    v_bit := trunc(sys.dbms_random.value * 2);
    v_bit := mod(v_bit,2);
    --dbms_output.put_line('BIT: ' || v_bit);
    select sec_sesion.nextval into v_sequence from dual;
    --dbms_output.put_line('SEQ_VAL: ' || v_sequence);
    if v_bit = 1 then
      insert into sesion
      values ( 
        v_sequence,
        trunc(sys.dbms_random.value(1,3000)),
        v_bit,
        trunc(sys.dbms_random.value(1,100)),
        TO_DATE('20-MAR-2006','DD-MON-YYYY'),
        trunc(sys.dbms_random.value(501,1000)),
        null
      );
    else 
      insert into sesion
      values ( 
        v_sequence,
        trunc(sys.dbms_random.value(1,3000)),
        v_bit,
        sys.dbms_random.value(1,100),
        trunc(TO_DATE('20-MAR-2006','DD-MON-YYYY')),
        trunc(sys.dbms_random.value(501,1000)),
        trunc(sys.dbms_random.value(1,500))
      );
    end if;
  end loop;
end;
/

Prompt Cargando datos diarios de la bitacora de calorías ...
declare
  v_sequence number;
  v_sesion_cliente_id number;
begin
  for n in 1..50000 loop
  select sec_bitacoras_calorias.nextval into v_sequence from dual;
  --dbms_output.put_line('SEQ_VAL: ' || v_sequence);
  v_sesion_cliente_id := trunc(sys.dbms_random.value(1,3000));
  insert into bitacora_calorias
  values ( 
    v_sequence,
    trunc(sys.dbms_random.value(1,100)),
    trunc(sys.dbms_random.value(1,120)),
    v_sesion_cliente_id,
    v_sesion_cliente_id
  );
 end loop;
end;
/


Prompt Cargando datos diarios del historico ...
declare
 v_sequence number;
begin
  for n in 1..50000 loop
    select sec_hist_status_disp.nextval into v_sequence from  dual;
    --dbms_output.put_line('SEQ_VAL: ' || v_sequence);
    insert into HIST_STATUS_DISP
    values ( 
      v_sequence,
      TO_DATE('20-MAR-2006','DD-MON-YYYY'),
      trunc(sys.dbms_random.value(1,5)),
      trunc(sys.dbms_random.value(1,1000))
    );
  end loop;
end;
/


Prompt Cargando datos diarios de las medidas ...
declare
  v_sequence number;
  v_cliente_id number;
begin
  for n in 1..50000 loop
    select sec_medidas.nextval into v_sequence from dual;
    --dbms_output.put_line('SEQ_VAL: ' || v_sequence);
    select cliente_id into v_cliente_id from cliente where cliente_id = trunc(sys.dbms_random.value(1,3000));
    insert into medidas
      values(
        v_sequence,
        trunc(sys.dbms_random.value(40, 130)),
        trunc(sys.dbms_random.value(1, 100)),
        trunc(sys.dbms_random.value(140, 210)),   
        v_cliente_id
      );
    end loop;
  end;
/


whenever sqlerror continue;