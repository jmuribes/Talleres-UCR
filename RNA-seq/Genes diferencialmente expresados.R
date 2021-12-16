
# Instalar librerías

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("tximport")
BiocManager::install("DESeq2")
BiocManager::install("org.Dr.eg.db")
BiocManager::install("clusterProfiler")
install.packages("tidyverse")
install.packages("factoextra")

# Cargar librerias:
library(tximport)
library(DESeq2)
library(ggplot2)
library(org.Dr.eg.db)
library(clusterProfiler)
library(reshape2)
library(tidyverse)
library(factoextra)

# Pasar de transcrito a gen:

tx2gene = read.table("DanRer11_alltranscripts.tsv", header = T)
samples = sapply(read.table("samples.txt"), as.character)
files = file.path(".", samples, "quant.sf")
names(files) = samples
txi = tximport(files, type = "salmon", tx2gene = tx2gene)

head(txi$abundance)
head(txi$counts)
head(txi$length)

# PCA:
txi.abundance <- t(txi$abundance)
txi.pca <- prcomp(txi.abundance)
fviz_eig(txi.pca)
fviz_pca_ind(txi.pca, repel=TRUE) + theme_minimal()


# Analisis de genes diferencialmente expresados (DESeq2):

sampleTable = data.frame(condition = factor(c(rep("Mutant",3), rep("WT", 3))))
rownames(sampleTable) = colnames(txi$counts)
dds = DESeqDataSetFromTximport(txi, colData = sampleTable, design = ~condition)
dds$condition = relevel(dds$condition, ref = "WT")
dds <- DESeq(dds)
res_mutants <- results(dds, contrast = c("condition", "WT", "Mutant"), alpha = 0.05)
summary(res_mutants)

# PCA:
vsd <- vst(dds, blind="FALSE")
plotPCA(vsd, intgroup=c("condition"))

write.csv(res_mutants, file="res.csv")
