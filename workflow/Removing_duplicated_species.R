setwd("/mnt/data3/alba_cph")

library(data.table)

metadata <- fread("resources/microbiome_saliva_bucal/gtdb-adv-search.csv")

# Keep the largest duplicated files

filesizes <- as.data.table(system("du -s resources/microbiome_saliva_bucal/*", intern = T))
colnames(filesizes) <- "size_specie"
filesizes[, size := as.numeric(stringr::str_split_i(size_specie, "\\s", 1))]
filesizes[, specie := stringr::str_extract(size_specie, "[^/]+$")]
filesizes[, specie := gsub(".zip", "", specie)]

metadata_filesize <- merge(metadata[, .(Accession, `NCBI Taxonomy`)], filesizes, by.x = "Accession", by.y = "specie")
metadata_filesize[, largest := ifelse(size == max(size), "yes", "no"), by = `NCBI Taxonomy`]
table(metadata_filesize$largest)

subset_filesize <- metadata_filesize[largest == "yes"]
subset_filesize[, Accession := paste0(Accession, ".zip")]

fwrite(subset_filesize[, .(Accession)],
    file = "results/05_create_reference_genome/unique_reference_species.txt",
    col.names = F, row.names = F, quote = F, sep = "\t"
)
