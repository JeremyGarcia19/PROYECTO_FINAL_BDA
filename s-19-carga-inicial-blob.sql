--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear la carga inicial de datos blob

connect sys/system2 as sysdba

whenever sqlerror exit rollback;

Prompt creando objetos directory
create or replace directory fotos_dir as '/media/HDD/proyecto_final/clientes-blob';
create or replace directory fotos_dir2 as '/media/HDD/proyecto_final/credenciales_blob';
create or replace directory fotos_dir3 as '/media/HDD/proyecto_final/disciplina_foto';
create or replace directory fotos_dir4 as '/media/HDD/proyecto_final/empleados_biometricos';


set serveroutput on
---
---
---
---
Prompt Creando Procedimiento para cargar las fotos de los clientes
connect admin_m1/admin
create or replace procedure actualiza_cliente(
  p_cliente_id_inicio number,
  p_num_imagenes number
) is
  cursor cur_cliente is
  select cliente_id from cliente
   where cliente_id between p_cliente_id_inicio
   and p_num_imagenes;

v_nombre_foto varchar(40);
v_bfile bfile;
v_foto blob;
v_src_offset number;
v_dest_offset number;
v_src_length number;
v_blob_length number;
begin
  for r in cur_cliente loop
    v_nombre_foto := r.cliente_id ||'.jpg';
    v_bfile := bfilename('FOTOS_DIR',v_nombre_foto);
  --verificar si el archivo existe
  if dbms_lob.fileexists(v_bfile) = 0 then
    raise_application_error(-20001,'El archivo ' || v_nombre_foto || ' no existe en el objeto fotos_dir' );
  end if;
  --verificar si el archivo esta cerrado
  if dbms_lob.fileisopen(v_bfile) = 1 then
    raise_application_error(-20001,'El archivo' || v_nombre_foto || 'esta abierto, debe estar cerrado');
  end if;
  
  select foto into v_foto
    from cliente
  where cliente_id = r.cliente_id
  for update;

  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_foto,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );
  --Cerrando el archivo
  dbms_lob.close(v_bfile);

  --verificando la cantida de bits escritos en el objeto blob
  v_blob_length := dbms_lob.getlength(v_foto);

  if v_src_length = v_blob_length then
    dbms_output.put_line('Carga Exitosa');
  else
    raise_application_error(-20001,'Longitud cargada en la columna no es valida');
  end if;
  end loop; 
end;
/
show errors;

---
---
---
---
Prompt Creando Procedimiento para cargar el código de barra de las credenciales
create or replace procedure actualiza_credencial(
  p_credencial_id_inicio number,
  p_num_imagenes number
) is
  cursor cur_credencial is
  select credencial_id from credencial
   where credencial_id between p_credencial_id_inicio
   and p_num_imagenes;

v_nombre_foto varchar(40);
v_bfile bfile;
v_foto blob;
v_src_offset number;
v_dest_offset number;
v_src_length number;
v_blob_length number;
begin
  for r in cur_credencial loop
    v_nombre_foto := r.credencial_id ||'.jpg';
    v_bfile := bfilename('FOTOS_DIR2',v_nombre_foto);
  --verificar si el archivo existe
  if dbms_lob.fileexists(v_bfile) = 0 then
    raise_application_error(-20001,'El archivo ' || v_nombre_foto || ' no existe en el objeto fotos_dir' );
  end if;
  --verificar si el archivo esta cerrado
  if dbms_lob.fileisopen(v_bfile) = 1 then
    raise_application_error(-20001,'El archivo' || v_nombre_foto || 'esta abierto, debe estar cerrado');
  end if;
  
  select codigo_barras into v_foto
    from credencial
  where credencial_id = r.credencial_id
  for update;

  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_foto,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );
  --Cerrando el archivo
  dbms_lob.close(v_bfile);

  --verificando la cantida de bits escritos en el objeto blob
  v_blob_length := dbms_lob.getlength(v_foto);

  if v_src_length = v_blob_length then
    dbms_output.put_line('Carga Exitosa');
  else
    raise_application_error(-20001,'Longitud cargada en la columna no es valida');
  end if;
  end loop; 
end;
/
show errors;


---
---
---
---
Prompt Creando Procedimiento para cargar el logotipo de las disciplinas
create or replace procedure actualiza_disciplina(
  p_disciplina_id_inicio number,
  p_num_imagenes number
) is
  cursor cur_disciplina is
  select disciplina_id from disciplina
   where disciplina_id between p_disciplina_id_inicio
   and p_num_imagenes;

v_nombre_foto varchar(40);
v_bfile bfile;
v_foto blob;
v_src_offset number;
v_dest_offset number;
v_src_length number;
v_blob_length number;
begin
  for r in cur_disciplina loop
    v_nombre_foto := r.disciplina_id ||'.jpg';
    v_bfile := bfilename('FOTOS_DIR3',v_nombre_foto);
  --verificar si el archivo existe
  if dbms_lob.fileexists(v_bfile) = 0 then
    raise_application_error(-20001,'El archivo ' || v_nombre_foto || ' no existe en el objeto fotos_dir' );
  end if;
  --verificar si el archivo esta cerrado
  if dbms_lob.fileisopen(v_bfile) = 1 then
    raise_application_error(-20001,'El archivo' || v_nombre_foto || 'esta abierto, debe estar cerrado');
  end if;
  
  select logo into v_foto
    from disciplina
  where disciplina_id = r.disciplina_id
  for update;

  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_foto,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );
  --Cerrando el archivo
  dbms_lob.close(v_bfile);

  --verificando la cantida de bits escritos en el objeto blob
  v_blob_length := dbms_lob.getlength(v_foto);

  if v_src_length = v_blob_length then
    dbms_output.put_line('Carga Exitosa');
  else
    raise_application_error(-20001,'Longitud cargada en la columna no es valida');
  end if;
  end loop; 
end;
/
show errors;

---
---
---
---
Prompt Creando Procedimiento para actualizar los biometricos de los empleados
connect admin_m2/admin
create or replace procedure actualiza_empleados_biometricos(
  p_empleado_biometricos_id_inicio number,
  p_num_imagenes number
) is
  cursor cur_empleados_biometricos is
  select empleado_biometricos_id from empleado_biometricos
   where empleado_biometricos_id between p_empleado_biometricos_id_inicio
   and p_num_imagenes;

v_nombre_foto varchar(10);
v_bfile bfile;
v_foto blob;
v_pulgar_izq blob;
v_pulgar_der blob;
v_indice_izq blob;
v_indice_der blob;
v_medio_izq blob;
v_medio_der blob;
v_anular_izq blob;
v_anular_der blob;
v_chico_izq blob;
v_chico_der blob;
v_src_offset number;
v_dest_offset number;
v_src_length number;
v_foto_length number;
v_pulgar_izq_length number;
v_pulgar_der_length number;
v_indice_izq_length number;
v_indice_der_length number;
v_medio_izq_length number;
v_medio_der_length number;
v_anular_izq_length number;
v_anular_der_length number;
v_chico_izq_length number;
v_chico_der_length number;


begin
  for r in cur_empleados_biometricos loop
    v_nombre_foto := r.empleado_biometricos_id ||'.jpg';
    v_bfile := bfilename('FOTOS_DIR4',v_nombre_foto);
  --verificar si el archivo existe
  if dbms_lob.fileexists(v_bfile) = 0 then
    raise_application_error(-20001,'El archivo ' || v_nombre_foto || ' no existe en el objeto fotos_dir' );
  end if;
  --verificar si el archivo esta cerrado
  if dbms_lob.fileisopen(v_bfile) = 1 then
    raise_application_error(-20001,'El archivo' || v_nombre_foto || 'esta abierto, debe estar cerrado');
  end if;
  
  select foto,pulgar_izq,pulgar_der,
    indice_izq,indice_der,medio_izq,
    medio_der,anular_izq,anular_der,
    chico_izq,chico_der 
    into v_foto,v_pulgar_izq,v_pulgar_der,
    v_indice_izq,v_indice_der,v_medio_izq,
    v_medio_der,v_anular_izq,v_anular_der,
    v_chico_izq,v_chico_der 
  from empleado_biometricos
  where empleado_biometricos_id = r.empleado_biometricos_id
  for update;

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_foto,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );

  --Cerrando el archivo
  dbms_lob.close(v_bfile);

 --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_pulgar_izq,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );

  --Cerrando el archivo
  dbms_lob.close(v_bfile);  


  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_pulgar_der,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );

  --Cerrando el archivo
  dbms_lob.close(v_bfile);   

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_indice_izq,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

  --Cerrando el archivo
  dbms_lob.close(v_bfile); 

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1; 

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_indice_der,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );

  --Cerrando el archivo
  dbms_lob.close(v_bfile); 

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1; 

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_medio_izq,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

   --Cerrando el archivo
  dbms_lob.close(v_bfile); 

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;   

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_medio_der,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

   --Cerrando el archivo
  dbms_lob.close(v_bfile); 

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;   

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_anular_der,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

   --Cerrando el archivo
  dbms_lob.close(v_bfile); 

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;   

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_anular_izq,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

   --Cerrando el archivo
  dbms_lob.close(v_bfile);   

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;  

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_chico_izq,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

   --Cerrando el archivo
  dbms_lob.close(v_bfile);  

  --Abrimos el archivo.
  dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
  v_src_offset := 1;
  v_dest_offset := 1;   

  v_src_length := dbms_lob.getlength(v_bfile);
  dbms_lob.loadblobfromfile(
    dest_lob    => v_chico_der,
    src_bfile   => v_bfile,
    amount      => v_src_length,
    src_offset  => v_src_offset,
    dest_offset => v_dest_offset
  );  

  --Cerrando el archivo
  dbms_lob.close(v_bfile);

  --verificando la cantida de bits escritos en el objeto blob
  v_foto_length := dbms_lob.getlength(v_foto);
  v_pulgar_der_length := dbms_lob.getlength(v_pulgar_der);
  v_pulgar_izq_length := dbms_lob.getlength(v_pulgar_izq);
  v_indice_izq_length := dbms_lob.getlength(v_indice_izq);
  v_indice_der_length := dbms_lob.getlength(v_indice_der);
  v_medio_izq_length := dbms_lob.getlength(v_medio_izq);
  v_medio_der_length := dbms_lob.getlength(v_medio_der);
  v_anular_izq_length := dbms_lob.getlength(v_anular_izq);
  v_anular_der_length := dbms_lob.getlength(v_anular_der);
  v_chico_izq_length := dbms_lob.getlength(v_chico_izq);
  v_chico_der_length := dbms_lob.getlength(v_chico_der);
  if v_src_length = v_foto_length 
    and v_src_length = v_pulgar_der_length 
    and v_src_length = v_pulgar_izq_length
    and v_src_length = v_indice_izq_length
    and v_src_length = v_indice_der_length
    and v_src_length = v_medio_izq_length
    and v_src_length = v_medio_der_length
    and v_src_length = v_anular_izq_length
    and v_src_length = v_anular_der_length
    and v_src_length = v_chico_izq_length
    and v_src_length = v_chico_der_length then
    dbms_output.put_line('Carga Exitosa');
  else
    raise_application_error(-20001,'Longitud cargada en la columna no es valida');
  end if;
  end loop; 
end;
/
show errors;

--Sección de carga de datos.
begin
  dbms_output.put_line('Cargando datos biometricos de los empleados');
  actualiza_empleados_biometricos(1,20);
  exception
  when others then
    dbms_output.put_line('Codigo ERROR: ' || sqlcode);
    dbms_output.put_line('Codigo ERROR: ' || sqlerrm);
    rollback;
end;
/
commit;

connect admin_m1/admin
--Sección de carga de datos.
begin
  dbms_output.put_line('Cargando Fotos de los clientes');
  actualiza_cliente(1,55);
  dbms_output.put_line('Cargando código de barra de las credenciales');
  actualiza_credencial(1,55);
  dbms_output.put_line('Cargando logo de las disciplianas');
  actualiza_disciplina(1,30);
  exception
  when others then
    dbms_output.put_line('Codigo ERROR: ' || sqlcode);
    dbms_output.put_line('Codigo ERROR: ' || sqlerrm);
    rollback;
end;
/

commit;

connect sys/system2 as sysdba

whenever sqlerror continue;