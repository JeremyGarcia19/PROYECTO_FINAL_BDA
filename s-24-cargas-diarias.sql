--@Autor:                Jeremy García Meneses
--@Autor:                Dulce Elízabeth Mendoza de la Vega
--@Fecha		             20/01/2023
--@Descripción:        	 Script para simular la carga de datos de 7 días

connect sys/system2 as sysdba

whenever sqlerror exit rollback;

Prompt Carga dia 1
@s-27-crea-carga-diaria.sql
Prompt Carga dia 2
@s-27-crea-carga-diaria.sql
Prompt Carga dia 3
@s-27-crea-carga-diaria.sql
Prompt Carga dia 4
@s-27-crea-carga-diaria.sql
Prompt Carga dia 5
@s-27-crea-carga-diaria.sql
Prompt Carga dia 6
@s-27-crea-carga-diaria.sql
Prompt Carga dia 7
@s-27-crea-carga-diaria.sql

whenever sqlerror continue;