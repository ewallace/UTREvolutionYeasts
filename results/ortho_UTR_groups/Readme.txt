Readme.txt for ortho_UTR_groups

This contains information for groups of 5'UTRs from orthologous genes in some yeasts.

Mostly the data are produced by src/GetSsd1OrthologUTRs.Rmd, contained in Sacc_noncer.

Then UTRs from each genus were collated/concatenated into single files, for example
Sacc_noncer/selectSsd1target_5UTRs_Kazachstania_collated.fa for Kazachstania

However, because the 332 genomes repository does not contain sequence data for 
*Saccharomyces cerevisiae* itself, that was added manually (copy/paste) into Sacc_pluscer,
with the data taken from fungidb.

Then `selectSsd1target_5UTRs_collated.fa`, also collated from those.
Collating code prior to meme is in /src/meme_detect_5UTRs.sh

These groups were later used as input for MEME motif analysis.

Sacc_pluscer_aligned contains the UTRs from Sacc_pluscer, each aligned using muscle 
with default parameters. Code for muscle alignment is in /src/muscle_align_5UTRs.sh