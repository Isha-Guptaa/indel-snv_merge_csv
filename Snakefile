configfile: "conda.yaml"

vcf_types = ["indels", "snvs"]

somatic_vcf = "/home/isha/Documents/repo/nextflow_VCF-to-CSV/second/HCC1395T_vs_HCC1395N.strelka.somatic_{vcf_type}_VEP.ann.vcf.gz"

rule all:
    input:
        "output/merged.csv"
    default_target: True

rule index_vcf:
    input:
        indel_vcf=somatic_vcf.format(vcf_type="indels"),
        snv_vcf=somatic_vcf.format(vcf_type="snvs")
    output:
        indel_index=somatic_vcf.format(vcf_type="indels") + ".csi",
        snv_index=somatic_vcf.format(vcf_type="snvs") + ".csi"
    conda:
        "conda.yaml"
    shell:
        """
        bcftools index {input.indel_vcf}
        bcftools index {input.snv_vcf}
        """

rule merge_vcf:
    input:
        indel_vcf=somatic_vcf.format(vcf_type="indels"),
        snv_vcf=somatic_vcf.format(vcf_type="snvs"),
        indel_index=somatic_vcf.format(vcf_type="indels") + ".csi",
        snv_index=somatic_vcf.format(vcf_type="snvs") + ".csi"
    output:
        "output/merged.vcf"
    conda:
        "conda.yaml"
    shell:
        """
        bcftools merge -m none --force-samples {input.indel_vcf} {input.snv_vcf} -o {output}
        """

rule convert:
    input:
        "output/merged.vcf"
    output:
        "output/merged.csv"
    conda:
        "conda.yaml"
    shell:
        """
        bcftools query -f '%CHROM,%POS,%ID,%REF,%ALT,%DP,%ReadPosRankSum,%SNVSB\\n' {input} | sed 's/\\t/,/g' > {output}
        """
