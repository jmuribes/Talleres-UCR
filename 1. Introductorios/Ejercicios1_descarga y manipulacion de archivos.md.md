# Ejercicios para aprender a manipular diferentes tipos de archivos.

### 1. Cree una carpeta nueva que va a servir como directorio de trabajo.
```bash
mkdir talleres
cd talleres/
```

### 2. Descargue los archivos necesarios para trabajar.

En la página de ENSEMBL se pueden encontrar múltiples archivos de interés que se pueden descargar fácilmente a través del sistema FTP (File Transfer Protocol).

```bash
wget http://ftp.ensembl.org/pub/release-104/fasta/drosophila_melanogaster/dna/Drosophila_melanogaster.BDGP6.32.dna.primary_assembly.4.fa.gz
wget http://ftp.ensembl.org/pub/release-104/fasta/drosophila_melanogaster/dna/Drosophila_melanogaster.BDGP6.32.dna.primary_assembly.Y.fa.gz
wget http://ftp.ensembl.org/pub/release-104/gtf/drosophila_melanogaster/Drosophila_melanogaster.BDGP6.32.104.gtf.gz
```

Para poder utilizar los archivos, necesitamos descomprimirlos.

```bash

# Opción 1: cada archivo individualmente.

gunzip Drosophila_melanogaster.BDGP6.32.104.gtf.gz
gunzip Drosophila_melanogaster.BDGP6.32.dna.primary_assembly.4.fa.gz
gunzip Drosophila_melanogaster.BDGP6.32.dna.primary_assembly.Y.fa.gz

# Opción 2: todos los archivos con la misma terminación.

gunzip *.gz
```

### 3. Explore los archivos que descargamos.

- Mueva/copie el archivos en otra carpeta y luego cópielos de regreso al directorio de trabajo (```cp```,```mv```)

- Inspeccione los archivos para ver su formato (```less -S```, ```tail```, ```head```). Note las diferencias entre las diferencias entre un archivo FASTA (```Drosophila_melanogaster.BDGP6.32.dna.primary_assembly.4.fa```).


### 4. Manipule y filtre los archivos para crear nuevos.

Primero, cree un archivo GTF que tenga todos los genes que pertenecen a los cromosomas de los cuales tiene archivos FASTA.

```bash
awk '{if ($1=="4"){print} }' Drosophila_melanogaster.BDGP6.32.104.gtf > chr4.gtf
awk '{if ($1=="Y"){print} }' Drosophila_melanogaster.BDGP6.32.104.gtf > chrY.gtf
```

Segundo, una los archivos GTF creados en unos nuevo.

```bash
cat chr4.gtf chrY.gtf > merge.gtf
```

Explore este nuevo archivo (```less -S```, ```head```, ```tail```) y asegúrese que el nuevo archivo corresponde a la suma de los anteriores (```wc -l```).

Tercero, obtenga la cantidad de elementos que tiene el nuevo archivo ```merge.gtf```.

```bash
awk -F '\t' '{print $3}' merge.gtf | sort | uniq -c
# Nota: 'sort' ordena los resultados de mayor a menor, 'uniq' regresa las líneas únicas, 'uniq -c' cuenta las líneas únicas.
```

Cuarto, cree nuevos archivos que incluyan la información para cada uno de estos elementos en el archivo ```merge.gtf```.

```bash
awk '{if ($3=="CDS"){print} }' merge.gtf > CDS.gtf
awk '{if ($3=="exon"){print} }' merge.gtf > exon.gtf
awk '{if ($3=="five_prime_utr"){print} }' merge.gtf > five_prime_utr.gtf
awk '{if ($3=="gene"){print} }' merge.gtf > gene.gtf
awk '{if ($3=="start_codon"){print} }' merge.gtf > start_codon.gtf
awk '{if ($3=="stop_codon"){print} }' merge.gtf > stop_codon.gtf
awk '{if ($3=="three_prime_utr"){print} }' merge.gtf > three_prime_utr.gtf
awk '{if ($3=="transcript"){print} }' merge.gtf > transcript.gtf
```

Quinto, compruebe que la cantidad de elementos en cada archivo creado concuerda con los números previamente obtenidos.

```bash
wc -l CDS.gtf
wc -l exon.gtf
wc -l five_prime_utr.gtf
wc -l gene.gtf
wc -l start_codon.gtf
wc -l stop_codon.gtf
wc -l three_prime_utr.gtf
wc -l transcript.gtf
```

### 5. Cree un nuevo archivo en blanco en la terminal.

Diferentes comandos permiten crear un archivo nuevo en la línea de comandos, los cuales se pueden guardar según el tipo de archivo que se requiera.

```nano```: CTRL+X para salir. ```nano nombre_archivo``` para ingresar a un archivo ya creado.

```vim```: existe toda una lista de comandos muy útiles con ```vim``` (https://vim.rtorr.com/). En general, cuando se utiliza ```vim```, se presiona una tecla para iniciar una acción (p.ej. ```i```: para "insertar" caracteres, ```r``` para "reemplazar" caracteres). Una vez editado el archivo, se puede guardar con ```:w``` y luego se sale del archivo con ```:q``` o ```:q!``` si no se queren guardar los cambios.


### 6. Eliminar archivos del directorio.

Conforme se avanzan los análisis, es importante comprimir (```gzip```) o eliminar (```rm```) los archivos que ya no se utilizan. Sin embargo, siempre es importante ser muy (!) cuidadoso.
