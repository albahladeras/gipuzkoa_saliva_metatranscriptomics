# Pipeline to analyze the saliva metatranscriptome

1. Create the following directories in your server:
    resources/reads: for the raw fastq files.
    resources/references/human_reference: for the human reference panel
    resources/references/GTDB
    results/01_concat
    results/02_fastp
    resuls/03_index_human_reference
    results/04_no_human
    results/05_no_rrna 
    results/06_create_reference_genome
    results/06_create_reference_genome/tmp
   
2. Open the snakefile "Snakefile".
    Change the paths:
       # Raw data
        READS_DIR = "resources/reads"
        REF_GENOME_DIR = "resources/references/human_reference"
        RESULTS_DIR = "results"
        CONCAT_DIR = os.path.join(RESULTS_DIR, "01_concat")
        FASTP_DIR = os.path.join(RESULTS_DIR, "02_fastp")
        REF_GENOME_INDEX_DIR = os.path.join(RESULTS_DIR, "03_index_human_reference")
        NO_HUMAN_DIR = os.path.join(RESULTS_DIR, "04_no_human")
        NO_RRNA_DIR = os.path.join(RESULTS_DIR, "05_no_rrna")

     Change the name of the reference human genome in the rule "build_bowtie_index". In input, output and shell
     Change the name of the reference human genome in the rule "remove_human_rna". In input and params

 3. Save the snakefile and run
   '''
  snakemake -s workflow/Snakefile --cores NUMBER_OF_CORES --use-conda
   '''
