# 🧪 Pipeline to Analyze the Saliva Metatranscriptome

## 📁 Step 1: Create Directory Structure

On your server, create the following directories:

resources/ ├── reads/ # Raw FASTQ files └── references/ ├── human_reference/ # Human reference panel └── GTDB/ # GTDB references

results/ ├── 01_concat/ ├── 02_fastp/ ├── 03_index_human_reference/ ├── 04_no_human/ ├── 05_no_rrna/ └── 06_create_reference_genome/ └── tmp/


> ⚠️ Note: Be careful with the typo in `resuls/03_index_human_reference` — it should be `results`.

---

## 📝 Step 2: Configure the Snakefile

Open the Snakefile located at `workflow/Snakefile` and edit the paths:

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

Also update:

    The reference genome name in the rule build_bowtie_index: update input, output, and shell.

    The reference genome name in the rule remove_human_rna: update input and params.
