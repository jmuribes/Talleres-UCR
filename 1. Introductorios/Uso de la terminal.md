# Introducción al uso de la terminal y los ambientes ```conda```.

## 1. Comandos básicos en línea de comandos (```terminal``` o ```cmd```).

Normalmente, el trabajar con datos genéticos requiere la manipulación de archivos pesados (varios Gb) y correr programas que requieren mucha memoria. Por esta razón, muchos de los análisis se realizan directamente en la línea de comandos.

Para comenzar a familiarizarse con el uso de la línea de comandos es bueno intentar ciertos comandos básicos. Primero, descargue el archivo ```Homo_sapiens.GRCh38.104.chromosome.X.gff3 ``` que se encuentra en la misma carpeta que este archivo.


-Inicie la terminal.

-Inspeccione la carpeta donde se encuentra y cambie de directorio (```ls```, ```cd```).

-Cree una nueva carpeta (```mkdir```).

-Copie o mueva el archivo que descargó (```Homo_sapiens.GRC38.104.chromosome.X.gff3```) a la nueva carpeta (```cp```, ```mv```).

-Inspeccione un archivo (```less -S```, ```head```, ```tail```).

-Cuente cuántas líneas tiene el archivo (```wc -l```).

## 2. Instalar ```conda``` para crear ambientes donde trabajar.

Los ambientes en ```conda``` facilitan enormemente la instalación de programas de uso cotidiano, ya que los programas instalados dentro del ambiente quedan activos al iniciar cada sesión.

Instale ```Anaconda``` siguiendo los pasos para su sistema operativo: https://conda.io/projects/conda/en/latest/user-guide/install/index.html
-Confirme que ```Anaconda``` ha sido correctamente instalado (https://docs.anaconda.com/anaconda/install/verify-install/).

Una vez que ```Anaconda``` ha sido instalado, ya puede crear ambientes de la siguiente manera:

```bash
conda create -n nombre_ambiente programa1 programa2 programaN
conda activate nombre_ambiente
conda deactivate nombre_ambiente
```
