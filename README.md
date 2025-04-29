# 🧪 Pipeline to Analyze the Saliva Metatranscriptome

This pipeline processes metatranscriptomic data from saliva samples, including human RNA removal, quality filtering, and reference genome alignment using Snakemake.

---

## 📁 Step 1: Create Directory Structure

Create the following folders on your server:

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
# Raw data
READS_DIR = "resources/reads"
REF_GENOME_DIR = "resources/references/human_reference"
RESULTS_DIR = "results"

CONCAT_DIR = os.path.join(RESULTS_DIR, "01_concat")
FASTP_DIR = os.path.join(RESULTS_DIR, "02_fastp")
REF_GENOME_INDEX_DIR = os.path.join(RESULTS_DIR, "03_index_human_reference")
NO_HUMAN_DIR = os.path.join(RESULTS_DIR, "04_no_human")
NO_RRNA_DIR = os.path.join(RESULTS_DIR, "05_no_rrna")
