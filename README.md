# snakemake_indel+snv_vcf-to-csv
SNAKEMAKE PIPELINE (indel+snv>csv) USING CONDA FOR DEPENDENCY MANAGEMENT
<br>
# PRE-REQUISITE:
1) CONDA
<br>

# Input:
 i) Somatics Indel VCF: https://nf-co.re/sarek/3.4.2/results/sarek/results-b5b766d3b4ac89864f2fa07441cdc8844e70a79e/test_full_aws/annotation/strelka/HCC1395T_vs_HCC1395N/?file=HCC1395T_vs_HCC1395N.strelka.somatic_indels_VEP.ann.vcf.gz
 
 (file: HCC1395T_vs_HCC1395N.strelka.somatic_indels_VEP.ann.vcf.gz)

ii) Somatic SNV CVF: https://nf-co.re/sarek/3.4.2/results/sarek/results-b5b766d3b4ac89864f2fa07441cdc8844e70a79e/test_full_aws/annotation/strelka/HCC1395T_vs_HCC1395N/?file=HCC1395T_vs_HCC1395N.strelka.somatic_snvs_VEP.ann.vcf.gz

(file: CC1395T_vs_HCC1395N.strelka.somatic_snvs_VEP.ann.vcf.gz)

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
