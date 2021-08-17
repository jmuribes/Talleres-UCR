# Manipular archivos que se utilizan como referencias.

Es importante comenzar a familiarizarse con los archivos típicos que se utilizan como referencias para los diferentes programas.

## 1. Referencia genómica.

-Descargue el archivo ```Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz```.

-Descomprima el archivo utilizando ```gunzip```.

-Observe el archivo ```less -S```.

-Compruebe el cromosoma del que tenemos secuencia ```grep ">" archivo```).


## 2. Archivo con información de transcritos (gff3).

-Descargue el archivo ```Homo_sapiens.GRCh38.104.chromosome.X.gff3```.

-Observe su composición ```less -S```.

-Cuente cuántas líneas tiene el archivo ```wc -l archivo```.

-Extraiga todas las líneas que tengan información de genes ```awk '{if ($3=="gene") {print} }' Homo_sapiens.GRCh38.104.chromosome.X.gff3 > genes.gtf```. Nota: el comando ```awk``` funciona de la siguiente manera ```awk 'criterio de selección {acción} archivo_input > archivo_output```.

-Extraiga los que tengan información sobre genes que codifican proteínas ```grep "protein_coding" genes.gtf > protein_coding_genes.gtf```.
