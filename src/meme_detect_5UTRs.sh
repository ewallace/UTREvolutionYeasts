## code to combine approximate 5' UTR seqs from Ssd1 targets in Saccharomyces spp

cd /Users/edwardwallace/Repos/UTREvolutionYeasts/
cd results/ortho_UTR_groups/Sacc_pluscer

cat Ccw12Ccw22_Saccharomyces_200upstream.fa \
	Cln2Cln1_Saccharomyces_200upstream.fa \
	Cts1_Saccharomyces_200upstream.fa \
	Dse2_Saccharomyces_200upstream.fa \
	Hsp26_Saccharomyces_200upstream.fa \
	Hsp150_Saccharomyces_200upstream.fa \
	Lre1Hlr1_Saccharomyces_200upstream.fa \
	Scw4Scw10_Saccharomyces_200upstream.fa \
	Ssd1_Saccharomyces_500upstream.fa \
	Sun4Sim1_Saccharomyces_700upstream.fa \
	Tos1_Saccharomyces_200upstream.fa \
	Tos6_Saccharomyces_200upstream.fa \
	Uth1Nca3_Saccharomyces_200upstream.fa \
	> selectSsd1target_5UTRs_collated.fa

cd /Users/edwardwallace/Repos/UTREvolutionYeasts/
mkdir results/ortho_UTR_groups/
meme -minw 8 -maxw 20 \
    results/ortho_UTR_groups/Sacc_pluscer/selectSsd1target_5UTRs_collated.fa 

## code to combine approximate 5' UTR seqs from Ssd1 targets in Nakaseomyces    
cd ../Sacc_noncer

cat Ccw12Ccw22_Nakaseomyces_200upstream.fa \
	Cln2Cln1_Nakaseomyces_200upstream.fa \
	Cts1_Nakaseomyces_200upstream.fa \
	Hsp26_Nakaseomyces_200upstream.fa \
	Hsp150_Nakaseomyces_200upstream.fa \
	Scw4Scw10_Nakaseomyces_200upstream.fa \
	Ssd1_Nakaseomyces_500upstream.fa \
	Sun4Sim1_Nakaseomyces_700upstream.fa \
	Tos1_Nakaseomyces_200upstream.fa \
	Uth1Nca3_Nakaseomyces_200upstream.fa \
	> selectSsd1target_5UTRs_Nakaseomyces_collated.fa

cat Ccw12Ccw22_Kazachstania_200upstream.fa \
	Cln2Cln1_Kazachstania_200upstream.fa \
	Cts1_Kazachstania_200upstream.fa \
	Hsp26_Kazachstania_200upstream.fa \
	Scw4Scw10_Kazachstania_200upstream.fa \
	Ssd1_Kazachstania_500upstream.fa \
	Sun4Sim1_Kazachstania_700upstream.fa \
	Tos1_Kazachstania_200upstream.fa \
	Tos6_Kazachstania_200upstream.fa \
	Uth1Nca3_Kazachstania_200upstream.fa \
	> selectSsd1target_5UTRs_Kazachstania_collated.fa
	
meme selectSsd1target_5UTRs_Kazachstania_collated.fa -dna -oc . -nostatus -time 18000 -mod anr -nmotifs 3 -minw 8 -maxw 20 -objfun classic -markov_order 1

cat Ccw12Ccw22_Tetrapisispora_200upstream.fa \
	Cln2Cln1_Tetrapisispora_200upstream.fa \
	Cts1_Tetrapisispora_200upstream.fa \
	Scw4Scw10_Tetrapisispora_200upstream.fa \
	Ssd1_Tetrapisispora_500upstream.fa \
	Sun4Sim1_Tetrapisispora_700upstream.fa \
	Tos1_Tetrapisispora_200upstream.fa \
	Uth1Nca3_Tetrapisispora_200upstream.fa \
	> selectSsd1target_5UTRs_Tetrapisispora_collated.fa