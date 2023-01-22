--@Autor:		      Jeremy García Meneses
--@Autor:		      Dulce Elízabeth Mendoza de la Vega
--@Fecha:	 	      19/01/2023
--@Descripción:		Script para crear a las tablas de la BD

connect admin_modulo1/admin
-- 
-- TABLE: CLIENTE 
--
CREATE TABLE CLIENTE(
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    CURP                VARCHAR2(18)     NOT NULL,
    FOTO                BLOB             NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    EMAIL               VARCHAR2(50)     NOT NULL,
    USERNAME            VARCHAR2(40)     NOT NULL,
    PASSWORD            VARCHAR2(40)     NOT NULL,
    DIRECCION           VARCHAR2(100)    NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    CONSTRAINT CLIENTE_PK PRIMARY KEY (CLIENTE_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE_PK ON CLIENTE(CLIENTE_ID)
      TABLESPACE INDICES_SC_TS   
    )
) TABLESPACE CLIENTE_TS
LOB(FOTO) STORE AS (TABLESPACE BLOB_TS);



-- 
-- TABLE: SENSOR 
--

CREATE TABLE SENSOR(
    SENSOR_ID       NUMBER(10, 0)    NOT NULL,
    NUM_SERIE       VARCHAR2(10)     NOT NULL,
    FECHA_COMPRA    DATE,
    MARCA           VARCHAR2(40)     NOT NULL,
    CLIENTE_ID      NUMBER(10, 0),
    CONSTRAINT SENSOR_PK PRIMARY KEY (SENSOR_ID)
    USING INDEX (
      CREATE UNIQUE INDEX SENSOR_PK ON SENSOR(SENSOR_ID)
      TABLESPACE INDICES_SC_TS   
    ), 
    CONSTRAINT SENSOR_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE DERIVADOS_CLIENTE_TS;



-- 
-- TABLE: CREDENCIAL 
--

CREATE TABLE CREDENCIAL(
    CREDENCIAL_ID       NUMBER(10, 0)    NOT NULL,
    FOLIO               VARCHAR2(8)      NOT NULL,
    FECHA_EXPEDICION    DATE             NOT NULL,
    FECHA_INICIO        DATE             NOT NULL,
    FECHA_FIN           DATE             NOT NULL,
    CODIGO_BARRAS       BLOB             NOT NULL,
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CREDENCIAL_PK PRIMARY KEY (CREDENCIAL_ID)
    USING INDEX(
      CREATE UNIQUE INDEX CREDENCIAL_PK ON CREDENCIAL(CREDENCIAL_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT CREDENCIAL_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE DERIVADOS_CLIENTE_TS;



-- 
-- TABLE: MEDIDAS 
--

CREATE TABLE MEDIDAS(
    MEDIDAS_ID       NUMBER(10, 0)    NOT NULL,
    PESO             NUMBER(3, 0)     NOT NULL,
    MASA_CORPORAL    NUMBER(10, 0)    NOT NULL,
    ESTATURA         NUMBER(3, 0),
    CLIENTE_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MEDIDAS_PK PRIMARY KEY (MEDIDAS_ID)
    USING INDEX(
      CREATE UNIQUE INDEX MEDIDAS_PK ON MEDIDAS(MEDIDAS_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT MEDIDAS_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
) TABLESPACE MEDIDAS_TS;


connect admin_modulo2/admin

-- 
-- TABLE: GIMNASIO 
--

CREATE TABLE GIMNASIO(
    GIMNASIO_ID       NUMBER(10, 0)    NOT NULL,
    TELEFONO          VARCHAR2(10)     NOT NULL,
    PAGINA_WEB_URL    VARCHAR2(100)    NOT NULL,
    LONGITUD          NUMBER(9, 5)     NOT NULL,
    LATITUD           NUMBER(9, 5)     NOT NULL,
    FOLIO             VARCHAR2(5)      NOT NULL,
    DIRECCION         VARCHAR2(70)     NOT NULL,
    NOMBRE            VARCHAR2(40)     NOT NULL,
    GERENTE_ID        NUMBER(10, 0)    NULL,
    CONSTRAINT GIMNASIO_PK PRIMARY KEY (GIMNASIO_ID)
    USING INDEX(
      CREATE UNIQUE INDEX GIMNASIO_PK ON GIMNASIO(GERENTE_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT GIMNASIO_GERENTE_ID_FK FOREIGN KEY (GERENTE_ID)
    REFERENCES ADMINISTRADOR(EMPLEADO_ID)
) TABLESPACE GIMNASIOS_TS;



-- 
-- TABLE: CONTENIDO_MULTIMEDIA 
--

CREATE TABLE CONTENIDO_MULTIMEDIA(
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    ARCHIVO                    BLOB             NOT NULL,
    FECHA_INICIO               DATE             NOT NULL,
    FECHA_FIN                  DATE,
    BANDERA_EXPIRACION         NUMBER(1, 0)     NOT NULL,
    GIMNASIO_ID                NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CONTENIDO_MULTIMEDIA_PK PRIMARY KEY (CONTENIDO_MULTIMEDIA_ID)
    USING INDEX(
      CREATE UNIQUE INDEX CONTENIDO_MULTIMEDIA_PK ON CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT CONTENIDO_MULTIMEDIA_GIMNASIO_ID_FK FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO(GIMNASIO_ID)
) TABLESPACE GIMNASIOS_TS
LOB(ARCHIVO) STORE AS (TABLESPACE MULTIMEDIA_TS);



-- 
-- TABLE: PUESTO 
--

CREATE TABLE PUESTO(
    PUESTO_ID      NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(5)      NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    DESCRIPCION    VARCHAR2(200)    NOT NULL,
    CONSTRAINT PUESTO_PK PRIMARY KEY (PUESTO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX PUESTO_PK ON PUESTO(PUESTO_ID)
      TABLESPACE INDICES_G_TS
    )
) TABLESPACE CATALOGO2_TS;



-- 
-- TABLE: EMPLEADO 
--

CREATE TABLE EMPLEADO(
    EMPLEADO_ID         NUMBER(10, 0)    NOT NULL,
    NUM_EMPLEADO        NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(50)     NOT NULL,
    TIPO                CHAR(1)          NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    RFC                 VARCHAR2(13)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    CURP                VARCHAR2(18)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    GIMNASIO_ID         NUMBER(10, 0)    NOT NULL,
    PUESTO_ID           NUMBER(10, 0)    NOT NULL,
    CONSTRAINT EMPLEADO_PK PRIMARY KEY (EMPLEADO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX EMPLEADO_PK ON EMPLEADO(EMPLEADO_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT EMPLEADO_PUESTO_ID_FK FOREIGN KEY (PUESTO_ID)
    REFERENCES PUESTO(PUESTO_ID),
    CONSTRAINT EMPLEADO_GIMANASIO_ID_FK FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO(GIMNASIO_ID)
) TABLESPACE EMPLEADO_TS;



-- 
-- TABLE: EMPLEADO_BIOMETRICOS 
--

CREATE TABLE EMPLEADO_BIOMETRICOS(
    EMPLEADO_BIOMETRICOS_ID    NUMBER(10, 0)    NOT NULL,
    FOTO                       BLOB             NOT NULL,
    PULGAR_IZQ                 BLOB             NOT NULL,
    PULGAR_DER                 BLOB             NOT NULL,
    INDICE_IZQ                 BLOB             NOT NULL,
    INDICE_DER                 BLOB             NOT NULL,
    MEDIO_IZQ                  BLOB             NOT NULL,
    MEDIO_DER                  BLOB             NOT NULL,
    ANULAR_IZQ                 BLOB             NOT NULL,
    ANULAR_DER                 BLOB             NOT NULL,
    CHICO_IZQ                  BLOB             NOT NULL,
    CHICO_DER                  BLOB             NOT NULL,
    EMPLEADO_ID                NUMBER(10, 0)    NOT NULL,
    CONSTRAINT EMPLEADO_BIOMETRICOS_PK PRIMARY KEY (EMPLEADO_BIOMETRICOS_ID)
    USING INDEX(
      CREATE UNIQUE INDEX EMPLEADO_BIOMETICOS_PK ON EMPLEADO_BIOMETRICOS(EMPLEADO_BIOMETRICOS_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT EMPLEADO_BIOMETRICOS_EMPLEADO_ID_FK FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
) TABLESPACE BIOMETRICOS_TS;



-- 
-- TABLE: ADMINISTRADOR 
--

CREATE TABLE ADMINISTRADOR(
    EMPLEADO_ID        NUMBER(10, 0)    NOT NULL,
    USERNAME           VARCHAR2(20)     NOT NULL,
    PASSWORD           VARCHAR2(20)     NOT NULL,
    DESCRIPCION_ROL    VARCHAR2(200)    NOT NULL,
    CERTIFICADO        BLOB             NOT NULL,
    CONSTRAINT ADMINISTRADOR_PK PRIMARY KEY (EMPLEADO_ID)
    USING INDEX(
      CREATE UNIQUE INDEX ADMINISTRADOR_PK ON ADMINISTRADOR(EMPLEADO_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT ADMINISTRADOR_EMPLEADO_ID_FK FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
) TABLESPACE EMPLEADO_TS
LOB(CERTIFICADO) STORE AS (TABLESPACE DOCS_TS);



-- 
-- TABLE: INSTRUCTOR 
--

CREATE TABLE INSTRUCTOR(
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    ANIOS_EXP      NUMBER(2, 0)     NOT NULL,
    CEDULA         BLOB             NOT NULL,
    SUPLENTE_ID    NUMBER(10, 0),
    CONSTRAINT INSTRUCTOR_PK PRIMARY KEY (EMPLEADO_ID)
    USING INDEX(
      CREATE UNIQUE INDEX INSTRUCTOR_PK ON INSTRUCTOR(EMPLEADO_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT INSTRUCTOR_EMPLEADO_ID_FK FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID),
    CONSTRAINT INSTRUCTOR_SUPLENTE_ID_FK FOREIGN KEY (SUPLENTE_ID)
    REFERENCES INSTRUCTOR(EMPLEADO_ID),
) TABLESPACE EMPLEADO_TS
LOB(CEDULA) STORE AS (TABLESPACE DOCS_TS);;



-- 
-- TABLE: INSTRUCTOR_URL 
--

CREATE TABLE INSTRUCTOR_URL(
    INSTRUCTOR_URL_ID    NUMBER(10, 0)    NOT NULL,
    URL                  VARCHAR2(40)     NOT NULL,
    INSTRUCTOR_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT INSTRUCTOR_URL_PK PRIMARY KEY (INSTRUCTOR_URL_ID)
    USING INDEX(
      CREATE UNIQUE INDEX INSTRUCTOR_URL_PK ON INSTRUCTOR_URL(INSTRUCTOR_URL_ID)
      TABLESPACE INDICES_G_TS
    ), 
    CONSTRAINT INSTRUCTOR_URL_INSTRUCTOR_ID_FK FOREIGN KEY (INSTRUCTOR_ID)
    REFERENCES INSTRUCTOR(EMPLEADO_ID)
) TABLESPACE EMPLEADO_TS;

connect admin_modulo1/admin

-- 
-- TABLE: SALA 
--

CREATE TABLE SALA(
    SALA_ID           NUMBER(10, 0)    NOT NULL,
    NOMBRE_SALA       VARCHAR2(20)     NOT NULL,
    CAPACIDAD_MAX     NUMBER(2, 0)     NOT NULL,
    CLAVE             VARCHAR2(3)      NOT NULL,
    GIMNASIO_ID       NUMBER(10, 0)    NOT NULL,
    RESPONSABLE_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT SALA_PK PRIMARY KEY (SALA_ID)
    USING INDEX(
      CREATE UNIQUE INDEX SALA_PK ON SALA(SALA_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT SALA_GIMNASIO_ID_FK FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO(GIMNASIO_ID),
    CONSTRAINT SALA_RESPONSABLE_ID_FK FOREIGN KEY (RESPONSABLE_ID)
    REFERENCES ADMINISTRADOR(EMPLEADO_ID)
) TABLESPACE SALA_TS;



-- 
-- TABLE: DISCIPLINA 
--

CREATE TABLE DISCIPLINA(
    DISCIPLINA_ID    VARCHAR2(40)     NOT NULL,
    CLAVE            VARCHAR2(5)      NOT NULL,
    LOGO             BLOB             NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(200)    NOT NULL,
    CONSTRAINT DISCIPLINA_PK PRIMARY KEY (DISCIPLINA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX DISCIPLINA_PK ON DISCIPLINA(DISCIPLINA_ID)
      TABLESPACE INDICES_SC_TS
    )
) TABLESPACE CATALOGO1_TS
LOB(LOGO) STORE AS (TABLESPACE BLOB_TS);;


-- 
-- TABLE: SALA_DISCIPLINA 
--

CREATE TABLE SALA_DISCIPLINA(
    SALA_DISCIPLINA_ID    NUMBER(10, 0)    NOT NULL,
    DISCIPLINA_ID         VARCHAR2(40)     NOT NULL,
    SALA_ID               NUMBER(10, 0)    NOT NULL,
    CONSTRAINT SALA_DISCIPLINA_PK PRIMARY KEY (SALA_DISCIPLINA_ID)
    USING INDEX(
      CREATE UNIQUE INDEX SALA_DISCIPLINA_PK ON SALA_DISCIPLINA(SALA_DISCIPLINA_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT SALA_DISCIPLINA_DISCIPLINA_ID_FK FOREIGN KEY (DISCIPLINA_ID)
    REFERENCES DISCIPLINA(DISCIPLINA_ID),
    CONSTRAINT SALA_DISCIPLINA_SALA_ID_FK FOREIGN KEY (SALA_ID)
    REFERENCES SALA(SALA_ID)
)TABLESPACE SALA_TS;



-- 
-- TABLE: SESION 
--

CREATE TABLE SESION(
    NUMERO_SESION    NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID       NUMBER(10, 0)    NOT NULL,
    EN_LINEA         NUMBER(1, 0)     NOT NULL,
    DURACION         NUMBER(3, 0)     NOT NULL,
    FECHA_INICIO     DATE             NOT NULL,
    INSTRUCTOR_ID    NUMBER(10, 0)    NOT NULL,
    SALA_ID          NUMBER(10, 0),
    CONSTRAINT SESION_PK PRIMARY KEY (NUMERO_SESION, CLIENTE_ID)
    USING INDEX(
      CREATE UNIQUE INDEX SESION_PK ON SESION(NUMERO_SESION,CLIENTE_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT SESION_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID),
    CONSTRAINT SESION_INSTRUCTOR_ID_FK FOREIGN KEY (INSTRUCTOR_ID)
    REFERENCES INSTRUCTOR(EMPLEADO_ID),
    CONSTRAINT SESION_SALA_ID FOREIGN KEY (SALA_ID)
    REFERENCES SALA(SALA_ID)
) TABLESPACE SESION_TS;



-- 
-- TABLE: BITACORA_CALORIAS 
--

CREATE TABLE BITACORA_CALORIAS(
    BITACORA_CALORIAS_ID    NUMBER(10, 0)    NOT NULL,
    CALORIAS                NUMBER(3, 0)     NOT NULL,
    MINUTO                  DATE             NOT NULL,
    NUMERO_SESION           NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT BITACORA_CALORIAS_PK PRIMARY KEY (BITACORA_CALORIAS_ID)
    USING INDEX(
      CREATE UNIQUE INDEX BITACORA_CALORIAS_PK ON BITACORA_CALORIAS(BITACORA_CALORIAS_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT BITACORA_CALORIAS_ID_FK FOREIGN KEY (NUMERO_SESION, CLIENTE_ID)
    REFERENCES SESION(NUMERO_SESION, CLIENTE_ID)
) TABLESPACE CALORIAS_TS;



-- 
-- TABLE: STATUS_DISPOSITIVO 
--

CREATE TABLE STATUS_DISPOSITIVO(
    STATUS_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(200)    NOT NULL,
    CONSTRAINT STATUS_DISPOSITIVO_PK PRIMARY KEY (STATUS_DISPOSITIVO_ID)
    USING INDEX(
      CREATE UNIQUE INDEX STATUS_DISPOSITIVO_PK ON STATUS_DISPOSITIVO(STATUS_DISPOSITIVO_ID)
      TABLESPACE INDICES_SC_TS
    )
) TABLESPACE DISPOSITIVO_TS;



-- 
-- TABLE: TIPO_DISPOSITIVO 
--

CREATE TABLE TIPO_DISPOSITIVO(
    TIPO_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE                 VARCHAR2(40)     NOT NULL,
    CONSTRAINT TIPO_DISPOSITIVO PRIMARY KEY (TIPO_DISPOSITIVO_ID)
    USING INDEX(
      CREATE UNIQUE INDEX TIPO_DISPOSITIVO_PK ON TIPO_DISPOSITIVO(TIPO_DISPOSITIVO_ID)
      TABLESPACE INDICES_SC_TS
    )
) TABLESPACE CATALOGO1_TS;



-- 
-- TABLE: DISPOSITIVO 
--

CREATE TABLE DISPOSITIVO(
    DISPOSITIVO_ID           NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS             DATE             NOT NULL,
    NOMBRE                   VARCHAR2(20)     NOT NULL,
    FECHA_ADQUISICION        DATE             NOT NULL,
    DESCRIPCION              VARCHAR2(200)    NOT NULL,
    NUM_INVENTARIO           VARCHAR2(18)     NOT NULL,
    TIPO_DISPOSITIVO_ID      NUMBER(10, 0)    NOT NULL,
    STATUS_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    SALA_ID                  NUMBER(10, 0)    NOT NULL,
    CONSTRAINT DISPOSITIVO_PK PRIMARY KEY (DISPOSITIVO_ID)
      USING INDEX(
      CREATE UNIQUE INDEX DISPOSITIVO_PK ON DISPOSITIVO(DISPOSITIVO_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT DISPOSITIVO_TIPO_DISPOSITIVO_ID_FK FOREIGN KEY (TIPO_DISPOSITIVO_ID)
    REFERENCES TIPO_DISPOSITIVO(TIPO_DISPOSITIVO_ID),
    CONSTRAINT DISPOSITIVO_STATUS_DISPOSITIVO_ID_FK FOREIGN KEY (STATUS_DISPOSITIVO_ID)
    REFERENCES STATUS_DISPOSITIVO(STATUS_DISPOSITIVO_ID),
    CONSTRAINT DISPOSITIVO_SALA_ID_FK FOREIGN KEY (SALA_ID)
    REFERENCES SALA(SALA_ID)
) TABLESPACE DISPOSITIVO_TS;



-- 
-- TABLE: DISPOSITIVOS_SESION 
--

CREATE TABLE DISPOSITIVOS_SESION(
    DISPOSITIVOS_SESION_ID    VARCHAR2(40)     NOT NULL,
    NUMERO_SESION             NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID                NUMBER(10, 0)    NOT NULL,
    DISPOSITIVO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT DISPOSITIVOS_SESION_PK PRIMARY KEY (DISPOSITIVOS_SESION_ID)
    USING INDEX(
      CREATE UNIQUE INDEX DISPOSITIVOS_SESION_PK ON DISPOSITIVOS_SESION(DISPOSITIVOS_SESION_ID)
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT DISPOSITIVOS_SESION_SESION_CLIENTE_FK FOREIGN KEY (NUMERO_SESION, CLIENTE_ID)
    REFERENCES SESION(NUMERO_SESION, CLIENTE_ID),
    CONSTRAINT DISPOSITIVOS_SESION_DISPOSITIVO_ID_FK FOREIGN KEY (DISPOSITIVO_ID)
    REFERENCES DISPOSITIVO(DISPOSITIVO_ID)
) TABLESPACE SESION_TS;



-- 
-- TABLE: HIST_STATUS_DISP
--

CREATE TABLE HIST_STATUS_DISP(
    HIST_STATUS_DISP_ID      NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS             DATE             NOT NULL,
    STATUS_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    DISPOSITIVO_ID           NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HIST_STATUS_DISP_PK PRIMARY KEY (HIST_STATUS_DISP_ID)
    USING INDEX(
      CREATE UNIQUE INDEX
      TABLESPACE INDICES_SC_TS
    ), 
    CONSTRAINT HIST_STATUS_DISP_STATUS_DISPOSITIVO_ID_FK FOREIGN KEY (STATUS_DISPOSITIVO_ID)
    REFERENCES STATUS_DISPOSITIVO(STATUS_DISPOSITIVO_ID),
    CONSTRAINT  HIST_STATUS_DISP_DISPOSITIVO_ID_FK FOREIGN KEY (DISPOSITIVO_ID)
    REFERENCES DISPOSITIVO(DISPOSITIVO_ID)
) TABLESPACE HISTORICO_TS;



-- 
-- INDEX: SENSOR - CLIENTE_ID_FK
--

CREATE INDEX SENSOR_CLIENTE_ID_FK_IX ON SENSOR(CLIENTE_ID);

-- 
-- INDEX: CREDENCIAL - CLIENTE_ID_FK
--

CREATE UNIQUE INDEX CREDENCIAL_CREDENCIAL_ID_FK_UK ON CREDENCIAL(CLIENTE_ID);

-- 
-- INDEX: MEDIDAS - CLIENTE_ID_FK
--

CREATE INDEX MEDIDAS_CLIENTE_ID_FK_IX ON SENSOR(CLIENTE_ID);

connect admin_modulo2/admin

-- 
-- INDEX: EMPLEADO_BIOMETRICOS - EMPLEADO_ID_FK
--

CREATE INDEX EMPLEADO_BIOMETRICOS_EMPLEADO_ID_FK_IX ON EMPLEADO_BIOMETRICOS(EMPLEADO_ID);

connect admin_modulo1/admin
-- 
-- INDEX: SALA - RESPONSABLE_ID_FK
--

CREATE UNIQUE INDEX SALA_RESPONSABLE_ID_FK_UK ON SALA(SALA_ID);

-- 
-- INDEX: BITACORA_CALORIAS - CLIENTE_ID_FK
--

CREATE INDEX BITACORA_CALORIAS_CLIENTE_ID_FK_IX ON BITACORA_CALORIAS(CLIENTE_ID);

-- 
-- INDEX: HIST_STATUS_DISP - DISPOSITIVO_ID_FK
--

CREATE INDEX HIST_STATUS_DISP_DISPOSITIVO_ID_FK_FK_IX ON HIST_STATUS_DISP(DISPOSITIVO_ID);




