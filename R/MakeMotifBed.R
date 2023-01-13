#' @name mk.motif.bed
#' @title Create bed file of motif you are interested in
#' @description /code{mk.motif.bed} create bed file of motif you are interested in

#' @param Motif Motif you are interested in
#' @param Genome Input fasta file of genome you are using
#' @return Dataframe of input motif in bed file format
#' @importFrom Biostrings
#' @importFrom dplyr
#' @export
#' @example
#' # mk.motif.bed("Motif", "Genome.fa")

library("Biostrings")
library("dplyr")

mk.motif.bed <- function(Motif, Genome){
  Genome <- readDNAStringSet(Genome, format = "fasta")
  motif <- vmatchPattern(Motif, Genome)
  n <- 3
  motif.all.chr <- data.frame(matrix(rep(NA, n), nrow=1))[numeric(0), ]
  colnames(motif.all.chr) <- c("chr", "start", "end")
  for (i in 1:length(motif)) {
    assign(paste(Motif, motif@NAMES[i], sep = "."), data.frame(chr = rep(motif@NAMES[i], length(motif@ends[i])), start = motif@ends[[i]], end = motif@ends[[i]]))
    motif.all.chr <- rbind(motif.all.chr, data.frame(eval(parse(text = paste(Motif, motif@NAMES[i], sep = ".")))))
  }
  motif.all.chr$start <- motif.all.chr$start - (nchar(Motif) - 1)
  return(motif.all.chr)
}
