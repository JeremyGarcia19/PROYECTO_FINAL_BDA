# PROYECTO_FINAL_BDA
Proyecto Final para la asignatura Bases de Datos Avanzadas - Facultad de Ingeniería UNAM


To do:
- script para la creación de usuarios (.sql):
  - Solo deben tener privilegios mínimos indispensables (No usar any, admin u option).
  - Cada usuario debe tener cuota ilimitada en los tablespaces donde se almacenarán sus objetos.
  - Su tablespace por default es el tablespace del módulo al que pertenecen.
- script del código DDL (.sql):
  - Modificar el script generado con E/R studio
- Configurar tnsname.ora [manial | script .sh] para configurar modos de conexión (compartido, dedicado, pool de conexiones):
  - Por defecto debe ser conexión dedicada
- Script para habilitar la FRA.
- Script para habilitar el modo archive.
- Script para realizar respaldos [image_copy & backupset]
- Scripts para la carga inicial de datos:
  - Deshabilitar generación de datos de redo para hacer la carga (activar al finalizar).
 - Script para simular una carga de datos diaría
   - Generar mínimo 30MB de datos de redo.
  - Simular proceso de insta recovery para garantizar que mttr sea mínimo
  - Simular proceso de complete media recovery
 
