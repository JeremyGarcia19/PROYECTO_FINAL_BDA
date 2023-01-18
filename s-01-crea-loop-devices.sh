#!/bin/bash

#@Autor:                Jeremy García Meneses
#@Autor:                Dulce Elízabeth Mendoza de la Vega
#@Fecha:                17/01/2023
#@Descripción:          Script para generar la estructura de directorios de la BD (Ejecutar d$

#Directorio raíz de la bd
dir_images="unam_bda/disk_images"

mkdir -p $dir_images
#Verificar si el directorio existe
if [ -d $dir_images ]; then
  #Se verifica si existen los archivos 
  #1> /dev/null 2>&1 Redirige la salida del comando al directorio /dev/null para que no se muestre en pantalla
  if ls $dir_images/*.img 1> /dev/null 2>&1; then
    echo "Los archivos ya existen."
  else
    dd if=/dev/zero of=$dir_images/disk4.img bs=100M count=10
    dd if=/dev/zero of=$dir_images/disk5.img bs=100M count=10
    dd if=/dev/zero of=$dir_images/disk6.img bs=100M count=10
 
    #Comprobando la creación de los archivos
    du -sh $dir_images/disk*.img

    #Asociando los archivos img a loop devices
    losetup -fP $dir_images/disk4.img
    losetup -fP $dir_images/disk5.img
    losetup -fP $dir_images/disk6.img

    #Comprobando la asociación de los loop devices
    losetup -a

    #Dando formato ext4 a los 3 archivos .img
    mkfs.ext4 $dir_images/disk4.img
    mkfs.ext4 $dir_images/disk5.img
    mkfs.ext4 $dir_images/disk6.img

    #Los puntos de montaje ya existen:
    #unam_bda/gym_bd/redo_groups/u01
    #unam_bda/gym_bd/redo_groups/u02
    #unam_bda/gym_bd/redo_groups/u03

    #Montamos los archivos.
    #Editar /etc/fstab
    ruta_disk="/media/HDD/proyecto_final/unam_bda/disk_images"
    ruta_redo_group="/media/HDD/proyecto_final/unam_bda/gym_bd/redo_groups"
    disk1="$ruta_disk/disk4.img		$ruta_redo_group/u01  auto  loop  0 0"
    disk2="$ruta_disk/disk5.img		$ruta_redo_group/u02  auto  loop  0 0"
    disk3="$ruta_disk/disk6.img		$ruta_redo_group/u03  auto  loop  0 0"

    #Verificamos si la línea de configuración está en el archivo, si no está se escribe
    if ! grep -Fxq "$disk1" /etc/fstab; then
      echo "$disk1" >> /etc/fstab
      echo "La línea se agregó correctamente al archivo"
    else
      echo "La línea ya existe en el archivo"
    fi

    if ! grep -Fxq "$disk2" /etc/fstab; then
      echo "$disk2" >> /etc/fstab
      echo "La línea se agregó correctamente al archivo"
    else
      echo "La línea ya existe en el archivo"
    fi

    if ! grep -Fxq "$disk3" /etc/fstab; then
      echo "$disk3" >> /etc/fstab
      echo "La línea se agregó correctamente al archivo"
    else
      echo "La línea ya existe en el archivo"
    fi
    mount -a
    echo "Se han creado los loop devices"
    echo "Reinicia el equipo para aplicar los cambios permanentemente"
  fi
else
  echo "Primero crea el directorio de las imagenes"
fi

