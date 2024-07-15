# snakemake_indel+snv_vcf-to-csv
SNAKEMAKE PIPELINE (indel+snv>csv) USING CONDA FOR DEPENDENCY MANAGEMENT
<br>
# PRE-REQUISITE:
1) CONDA
<br>
# steps:
<br>
<br>
1)Install MAMBA using CONDA:
<br>
conda install -n base -c conda-forge mamba
<br>
<br>
2)Create a new environment for Snakemake workflows:
<br>
<br>
#Create a new environment for Snakemake
<br>
mamba create -c conda-forge -c bioconda -n snakemake snakemake
<br>
<br>
#Activate the snakemake environment
<br>
conda activate snakemake
<br>
<br>
#Display Snakemake help
<br>
snakemake --help
<br>
<br>
3)Create env.yaml file with content: 

![image](https://github.com/user-attachments/assets/320eaecc-af57-4998-b374-5d446775366f)

4)Given the env.yml recipe file, the environment can be created using the command shown below:
<br>
<br>
conda env create --file conda.yaml
<br>
<br>
5)Run:
<br>
<br>
snakemake --cores 1 convert --use-conda
