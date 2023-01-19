#!/bin/bash

#@Autor:		      Jeremy García Meneses
#@Autor:		      Dulce Elízabeth Mendoza de la Vega
#@Fecha:	 	      18/01/2023
#@Descripción:		Script para configurar tnsname.ora
# recuerda que este archivo se ejecuta por USUARIO ROOT

host=$1
ORACLE_SID=meproyga
tnsname=/u01/app/oracle/product/19.3.0/dbhome_1/network/admin/tnsnames.ora

if [ -z "${host}" ]; then
  echo "ERROR: No se indica el host"
else
if ! grep -q "${ORACLE_SID^^}" $tnsname; then
echo configurando archivo
echo -e "
LISTENER_${ORACLE_SID^^} =
  (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}-virtual.fi.unam)(PORT = 1521))

${ORACLE_SID^^} =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}-virtual.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = ${ORACLE_SID}.fi.unam)
    )
  )

${ORACLE_SID^^}_DEDICATED =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}-virtual.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = ${ORACLE_SID}.fi.unam)
      (SERVER = DEDICATED)
    )
  )

${ORACLE_SID^^}_SHARED =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}-virtual.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = ${ORACLE_SID}.fi.unam)
      (SERVER = SHARED)
    )
  )

${ORACLE_SID^^}_POOLED =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-${host}-virtual.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = ${ORACLE_SID}.fi.unam)
      (SERVER = POOLED)
    )
  )" >> $tnsname
else
  echo "La configuración ya existe en el archivo"
fi
fi
