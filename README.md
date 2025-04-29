# 🧪 Pipeline to Analyze the Saliva Metatranscriptome

This pipeline processes metatranscriptomic data from saliva samples, including human RNA removal, quality filtering, and reference genome alignment using Snakemake.

---

## 📁 Step 1: Create Directory Structure

Create the following directories on your server:

- `resources/reads/` — for the raw FASTQ files  
- `resources/references/human_reference/` — for the human genome reference  
- `resources/references/GTDB/` — for GTDB reference files  

- `results/01_concat/`  
- `results/02_fastp/`  
- `results/03_index_human_reference/`  
- `results/04_no_human/`  
- `results/05_no_rrna/`  
- `results/06_create_reference_genome/`  
- `results/06_create_reference_genome/tmp/`  


---

## 📝 Step 2: Configure the Snakefile

Open the Snakefile located at `workflow/Snakefile` and update the following path variables:

```python
READS_DIR = "resources/reads"
REF_GENOME_DIR = "resources/references/human_reference"
RESULTS_DIR = "results"

CONCAT_DIR = os.path.join(RESULTS_DIR, "01_concat")
FASTP_DIR = os.path.join(RESULTS_DIR, "02_fastp")
REF_GENOME_INDEX_DIR = os.path.join(RESULTS_DIR, "03_index_human_reference")
NO_HUMAN_DIR = os.path.join(RESULTS_DIR, "04_no_human")
NO_RRNA_DIR = os.path.join(RESULTS_DIR, "05_no_rrna")



Then, update the reference genome filename in two specific rules:

    **build_bowtie_index**
    Modify the input, output, and shell sections to reflect the correct filename.

    **remove_human_rna**
    Modify the input and params sections with the correct genome name.

## Step 3: Run the Workflow

Once everything is set up, launch the pipeline using:

```
snakemake -s workflow/Snakefile --cores NUMBER_OF_CORES --use-conda
```

💡 Replace NUMBER_OF_CORES with the number of CPU cores you want to allocate for parallel execution.
