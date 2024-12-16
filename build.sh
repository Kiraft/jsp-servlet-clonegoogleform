#!/bin/bash

# Directorios
SOURCE_DIR="."
DEST_DIR="/usr/local/tomcat/apache-tomcat-9.0.97/webapps/bajas/WEB-INF/classes"

# Paso 1: Eliminar archivos .class existentes en el destino
echo "Eliminando archivos .class en ${DEST_DIR}..."
find "${DEST_DIR}" -name "*.class" -type f -delete
echo "Archivos .class eliminados."

# Paso 2: Compilar las clases
echo "Compilando archivos .java en ${DEST_DIR}..."
javac ${DEST_DIR}/*.java
if [ $? -ne 0 ]; then
  echo "Error en la compilación. Abortando."
  exit 1
fi
echo "Compilación completada."


# Paso 4: Reiniciar Tomcat
echo "Reiniciando Tomcat..."
sudo tomcat-off
sudo tomcat-on
