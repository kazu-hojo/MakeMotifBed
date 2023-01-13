# mk.motif.bed
Create bed file of motif you are interested in

## Requires
### R packages
* Biostrings

### Input fasta file of genome you are using
Input fasta file of genome you are using must be at working directory

## Installation
```
remotes::install_github("kazu-hojo/MakeMotifBed")
```

## Usage
```
mk.motif.bed(Motif, Genome)
```

## Argument
| Argument | Definition |
| ---- | ---- |
| Motif | Motif you are interested in |
| Genome | Input fasta file of genome you are using |

## Example
Generate Homeobox motif 'TAAT'
```
TAAT.bed <- mk.motif.bed("TAAT", "genome.fa")
write.table(TAAT.bed, "TAATT_UCSC_mm10.bed", row.names = FALSE, col.names = FALSE, sep = "\t", quote = F)
```
