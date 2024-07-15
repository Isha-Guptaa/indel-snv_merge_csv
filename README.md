# indel-snv_merge_csv
SNAKEMAKE PIPELINE (indel+snv>csv) USING CONDA FOR DEPENDENCY MANAGEMENT
<br>
PRE-REQUISITE: CONDA
<br>
1)Install MAMBA using CONDA:
conda install -n base -c conda-forge mamba

2)Create a new environment for Snakemake workflows:
#Create a new environment for Snakemake
mamba create -c conda-forge -c bioconda -n snakemake snakemake

#Activate the snakemake environment
conda activate snakemake

#Display Snakemake help
snakemake --help

7)Create env.yaml file with content: 

![image](https://github.com/user-attachments/assets/320eaecc-af57-4998-b374-5d446775366f)




8)Given the env.yml recipe file, the environment can be created using the command shown below:

conda env create --file conda.yaml

9)Run:
<br>
snakemake --cores 1 convert --use-conda
