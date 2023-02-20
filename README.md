# Instrucciones para instalar y configurar el entorno de trabajo

## Instalación automática
Para facilitar la instalación del entorno de trabajo, se ha creado un script que instalará automáticamente todas las dependencias necesarias. Para ejecutar el script, sigue los siguientes pasos:

1. Descarga el script de instalación:

2. Dale permisos de ejecución al script:
```
chmod +x install.sh
```
3. Ejecuta el script:
```
./install.sh
```

El script instalará automáticamente las siguientes herramientas y librerías:

- pyenv
- Python 3.10.0
- Node.js y nodemon
- Librerías base para desarrollo en Python y C
- AWS CLI v2
- Powerlevel10k
- bspwm, sxhkd, y Alacritty

>Este script está diseñado para ser ejecutado en un entorno de Linux, y requiere permisos de administrador para instalar ciertas dependencias.

>Una vez ejecutado, el script se instalarán todas las dependencias necesarias y configurará el entorno de trabajo de manera óptima para comenzar a desarrollar.

### **Disclaimer**
Es importante que se revisen los detalles del script antes de ejecutarlo, ya que puede haber algunas dependencias que ya estén instaladas y no sea necesario volver a instalarlas. También es importante tener en cuenta que este script es una guía básica y se puede personalizar según las necesidades específicas de cada proyecto o entorno de trabajo.