connect sys/system2 as sysdba

whenever sqlerror exit rollback;

Prompt Carga dia 1
@s-18-crea-carga-diaria.sql
Prompt Carga dia 2
@s-18-crea-carga-diaria.sql
Prompt Carga dia 3
@s-18-crea-carga-diaria.sql
Prompt Carga dia 4
@s-18-crea-carga-diaria.sql
Prompt Carga dia 5
@s-18-crea-carga-diaria.sql
Prompt Carga dia 6
@s-18-crea-carga-diaria.sql
Prompt Carga dia 7
@s-18-crea-carga-diaria.sql

whenever sqlerror continue;