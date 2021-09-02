# Ejercicios individuales de manipulación de datos.

### Ejercicio 1: crear y filtrar archivos.

Objetivo: crear un archivo nuevo con la cantidad de exones anotados en los cromosomas 10 y 14 del pez cebra.

Pasos:

1. Descargar el archivo con la información de los genes del pez cebra.
```bash
curl http://ftp.ensembl.org/pub/release-104/gtf/danio_rerio/Danio_rerio.GRCz11.104.gtf.gz -o zebrafish_104.gtf.gz
gunzip zebrafish_104.gtf.gz
```

2. Filtre el archivo para obtener solamente la información de los cromosomas 10 y 14.
```bash
awk '{if ($1=="10"){print} }' zebrafish_104.gtf > chr10.gtf
awk '{if ($1=="14"){print} }' zebrafish_104.gtf > chr14.gtf
cat chr10.gtf chr14.gtf > merge.gtf
```

3. Cuente la cantidad de elementos que corresponden a exones.
```bash
awk -F '\t' '{print $3}' merge.gtf | sort | uniq -c
# Hay 33222 exones.
```

4. Cree un archivo nuevo con esta información.
```bash
nano
```

5. Bonus: cree un archivo con las coordinadas de inicio de cada exon (columna 4 del archivo GTF).
```bash
# Opción 1:
awk '{if ($3=="exon"){print} }' merge.gtf | awk '{print $4}' > inicio_exones.txt
wc -l inicio_exones.txt

# Opción 2:
awk '{if ($3=="exon"){print $4} }' merge.gtf > inicio_exones.txt
wc -l inicio_exones.txt
```

### Ejercicio 2: buscar información específica en archivos.

Objetivo: practicar la búsqueda de datos específicos en un archivo.

1. ¿Cuántas isoformas tiene el gen ENSDARG00000117492? ¿En qué cromosoma están localizadas?
```bash
grep "ENSDARG00000117492" zebrafish_104.gtf > gene.gtf
less -S gene.gtf
```

2. ¿Cuántos cromosomas tiene el pez cebra?
```bash
awk '{print $1}' zebrafish_104.gtf | sort | uniq
```
