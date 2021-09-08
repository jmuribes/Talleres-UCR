# Control de calidad de archivos de secuencias (fastq).

## 1. Preparar un  ambiente ```conda``` con los programas necesarios.
```bash
# Recuerde que debe tener instalado miniconda (https://docs.conda.io/en/latest/miniconda.html)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda create -n talleres fastqc trim-galore samtools
conda activate talleres
```

## 2. Observar el formato de un archivo fastq.
```bash
# Descargue un archivo de prueba.
https://bioshare.bioinformatics.ucdavis.edu/bioshare/download/a7dqzw81lojedl2/AB_subsample.fastq

# Observe el archivo utilizando los comandos ya conocidos.
head AB_subsample.fastq
less -S AB_subsample.fastq
```
## 3. Correr fastqc para obtener un informe de la calidad de las secuencias.
```bash
fastqc AB_subsample.fastq
# Esto genera un archivo informe .html que contiene la información.

# Importante: ¿qué observa de particular en las secuencias?
```

### 3. Remover "barcodes" de las secuencias.
```bash
trim_galore --fastqc --quality 30 --output_dir . AB_subsample.fastq
less -S AB_subsample_trimmed.fq
```
