# Manipulación de archivos utilizando bedtools.

Paso 1. Iniciar una computadora virtual en Google Colab.

Paso 2. Instalar miniconda.

```bash
%%bash
MINICONDA_INSTALLER_SCRIPT=Miniconda3-4.5.4-Linux-x86_64.sh
MINICONDA_PREFIX=/usr/local
wget https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT
chmod +x $MINICONDA_INSTALLER_SCRIPT
./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX
```

Paso 3. Instalar los canales necesarios para conda.

```bash
!conda config --add channels bioconda
!conda config --add channels conda-forge
```

Paso 4. Crear un ambiente conda con bedtools y samtools instalado.

```bash
!conda create -n talleres bedtools samtools
```

Paso 5. Descargar archivos.
```bash
!curl -O https://s3.amazonaws.com/bedtools-tutorials/web/cpg.bed
!curl -O https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed
!curl -O https://s3.amazonaws.com/bedtools-tutorials/web/gwas.bed
!curl -O https://s3.amazonaws.com/bedtools-tutorials/web/genome.txt
```



