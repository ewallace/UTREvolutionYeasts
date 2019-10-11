## code to align approximate 5' UTR seqs

cd /Users/edwardwallace/Repos/UTREvolutionYeasts/

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Tos6_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Tos6_Saccharomyces_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Tos1_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Tos1_Saccharomyces_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Cts1_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Cts1_Saccharomyces_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Sun4Sim1_Saccharomyces_500upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Sun4Sim1_Saccharomyces_500upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Sun4Sim1_Saccharomyces_700upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Sun4Sim1_Saccharomyces_700upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Uth1Nca3_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Uth1Nca3_Saccharomyces_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_pluscer/Ccw12Ccw22_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Ccw12Ccw22_Saccharomyces_200upstream_muscle.fa 

cat results/ortho_UTR_groups/Sacc_pluscer/Tos1_Saccharomyces_200upstream.fa \
  results/ortho_UTR_groups/Sacc_noncer/Tos1_Nakaseomyces_200upstream.fa | \
muscle -out results/ortho_UTR_groups/Sacc_pluscer_aligned/Tos1_SaccNaka_200upstream_muscle.fa 

cat results/ortho_UTR_groups/Sacc_pluscer/Cts1_Saccharomyces_200upstream.fa \
  results/ortho_UTR_groups/Sacc_noncer/Cts1_Nakaseomyces_200upstream.fa | \
muscle -out results/ortho_UTR_groups/Sacc_pluscer_aligned/Cts1_SaccNaka_200upstream_muscle.fa 

cat results/ortho_UTR_groups/Sacc_pluscer/Sun4Sim1_Saccharomyces_700upstream.fa \
  results/ortho_UTR_groups/Sacc_noncer/Sun4Sim1_Nakaseomyces_700upstream.fa | \
muscle -out results/ortho_UTR_groups/Sacc_pluscer_aligned/Sun4Sim1_SaccNaka_700upstream_muscle.fa 

cat results/ortho_UTR_groups/Sacc_pluscer/Uth1Nca3_Saccharomyces_200upstream.fa \
  results/ortho_UTR_groups/Sacc_noncer/Uth1Nca3_Nakaseomyces_200upstream.fa | \
muscle -out results/ortho_UTR_groups/Sacc_pluscer_aligned/Uth1Nca3_SaccNaka_200upstream_muscle.fa 


muscle -in results/ortho_UTR_groups/Sacc_noncer/Tos1_Kazachstania_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Tos1_Kazachstania_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_noncer/Cts1_Kazachstania_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Cts1_Kazachstania_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_noncer/Sun4Sim1_Kazachstania_700upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Sun4Sim1_Kazachstania_700upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_noncer/Uth1Nca3_Kazachstania_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Uth1Nca3_Kazachstania_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_noncer/Ccw12Ccw22_Kazachstania_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Ccw12Ccw22_Kazachstania_200upstream_muscle.fa 


muscle -in results/ortho_UTR_groups/Sacc_pluscer/Hsp26_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Hsp26_Saccharomyces_200upstream_muscle.fa 

cat results/ortho_UTR_groups/Sacc_pluscer/Hsp26_Saccharomyces_200upstream.fa \
  results/ortho_UTR_groups/Sacc_noncer/Hsp26_Nakaseomyces_200upstream.fa | \
muscle -out results/ortho_UTR_groups/Sacc_pluscer_aligned/Hsp26_SaccNaka_200upstream_muscle.fa 

muscle -in results/ortho_UTR_groups/Sacc_noncer/Hsp26_Kazachstania_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Hsp26_Kazachstania_200upstream_muscle.fa 


muscle -in results/ortho_UTR_groups/Sacc_pluscer/Hsp150_Saccharomyces_200upstream.fa \
-out results/ortho_UTR_groups/Sacc_pluscer_aligned/Hsp150_Saccharomyces_200upstream_muscle.fa 

cat results/ortho_UTR_groups/Sacc_pluscer/Hsp150_Saccharomyces_200upstream.fa \
  results/ortho_UTR_groups/Sacc_noncer/Hsp150_Nakaseomyces_200upstream.fa | \
muscle -out results/ortho_UTR_groups/Sacc_pluscer_aligned/Hsp150_SaccNaka_200upstream_muscle.fa 
