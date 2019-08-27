# OrthoGroupScripts.R
# Code for processing scripts in 332 genomes paper.
library(Biostrings)
library(GenomicFeatures)
library(BSgenome)
library(tidyverse)

.species_concordance <-
    read_tsv("../data/figshare_5854692/0_332yeast_genomes/332taxa_index.txt",
             skip=1,
             col_names=c("fasta_species_id","species_id","species_id_fig2"))

get_ortho_id <- function(my_sid,data=seq_ids_index) {
    ### Find ortho id for one gene of interest
    oid <- data %>%
        filter(s_id==my_sid) %>%
        .$ortho_id
    if (length(oid) == 1) {
        return(oid) 
    } else if (length(oid) == 0) { 
        stop("No s_ids found for ", my_sid)
    } else if (length(oid) > 1) {
        stop("Multiple s_ids found for ", my_sid)
    }
}

get_ortho_group <- function(my_sid,data=seq_ids_index,species_list=NULL) {
    # Extract the names of all members of the ortholog group
    my_orthogroup <- data %>%
        filter(s_id==my_sid) %>%
        .$ortho_group
    stopifnot(length(my_orthogroup) == 1)
    data_out <- filter(data,ortho_group==my_orthogroup)
    if(!is.null(species_list)) {
        data_out <- filter(data_out, species %in% species_list)
    }
    return(data_out)
}


get_orthoid_seqs <- function(OGids,Oseqs=ortho_seqs,data=seq_ids_index) {
    data %>%
        filter(ortho_id %in% OGids) %>%
        .$species_plus_id %>%
        Oseqs[.]
}


get_gtflist <- function(species_list,data_dir="../data/figshare_5854692/0_332yeast_genomes/332_genome_annotations/gtf/") {
    gtflist <- lapply(species_list,function(species) {
        # browser() 
        fasta_species_id <- .species_concordance %>%
            filter(species_id==species) %>%
            .$fasta_species_id
        gtfname <- paste0(data_dir, "/", fasta_species_id, ".max.gtf")
        rtracklayer::readGFFAsGRanges(gtfname)
    } )
    names(gtflist) <- species_list
    return(gtflist)
}

get_fastalist <- function(species_list,data_dir="../data/figshare_5854692/0_332yeast_genomes/332_genome_assemblies/") {
    fastalist <- lapply(species_list,function(species) {
        # browser() 
        fasta_species_id <- .species_concordance %>%
            filter(species_id==species) %>%
            .$fasta_species_id
        ffname <- paste0(data_dir, "/", fasta_species_id, ".fas")
        DNAss <- readDNAStringSet(ffname)
        names(DNAss) <- names(DNAss) %>% str_remove(" .*")
        return(DNAss)
    } )
    names(fastalist) <- species_list
    return(fastalist)
}

get_one_upstream_seq <- function(seq_id_line,fastalist,gtflist,
                                 upstream=10,downstream=3,
                                 feature_type="start_codon", 
                                 verbose=FALSE) {
    # retrieve sequences upstream/downstream of 5' start of a feature
    if(verbose) print(seq_id_line)
    species <- seq_id_line$species[1]
    fasta_species <- fastalist[[species]]
    gtf_species <- gtflist[[species]]
    gtf_seq <- subset(gtf_species,gene_id==seq_id_line$gene_id)
    gtf_start <- subset(gtf_seq,type==feature_type)
    gtf_startflank <- promoters(gtf_start,upstream=upstream,downstream=downstream)
    if(verbose) { 
        print(gtf_start)
        print(gtf_startflank)
    }
    getSeq(fasta_species,gtf_startflank)[[1]]
}

get_upstream_seqs <- function(seq_id_lines,fastalist,gtflist,
                              upstream=10,downstream=3,
                              feature_type="start_codon") {
    # retrieve sequences upstream/downstream of a start of a feature
    seq_id_lines %>%
        group_by(species_plus_id) %>%
        group_map( ~ get_one_upstream_seq(.x,
                                          fastalist=fastalist,
                                          gtflist=gtflist,
                                          upstream=upstream,
                                          downstream=downstream,
                                          feature_type=feature_type) ) %>%
        set_names(seq_id_lines$species_plus_id) %>%
        DNAStringSet
}


get_ortho_upseqs <- function(my_sid,species_list,
                             fastalist,gtflist,
                             upstream=200,downstream=0,
                             feature_type="start_codon",
                             data=seq_ids_index,
                             fname_out=NULL) {
    # retrieve sequences upstream/downstream of start codon for an ortho group
    ortho_ids <- get_ortho_group(my_sid=my_sid, 
                                 data=data,
                                 species_list = species_list)
    ortho_upseqs <- 
        get_upstream_seqs(ortho_ids,
                          fastalist=fastalist,
                          gtflist=gtflist,
                          upstream=upstream,
                          downstream=downstream,
                          feature_type=feature_type)
    if( ! is.null(fname_out) ) {
        writeXStringSet(ortho_upseqs, fname_out)
    }
    return(ortho_upseqs)
}

