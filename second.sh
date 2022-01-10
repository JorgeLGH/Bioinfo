#!/bin/bash
#################################################################################
###upper left
#search for specific string in file fasta_try
egrep -c "TGA|TAG|TAA" fasta_try

###middle left
#search the ATG in the directory with recursive argument
grep -cr ATG ~/bioinfo/

###low left
#make the text
nano baby_shark
#put the text
Baby shark, doo doo doo doo
doo doo
Baby shark, doo doo doo doo
doo doo
Baby shark, doo doo doo doo
doo doo
Baby shark!
#change the names
sed s/Baby/Mommy/g baby_shark> mommy_shark
sed s/Baby/Daddy/g baby_shark> daddy_shark
sed s/Baby/Grandma/g baby_shark> Grandma_shark
sed s/Baby/Grandpa/g baby_shark> Grandpa_shark
sed s/Baby/"Let's go hunt"/g baby_shark> lets_shark
#make everything run
more baby_shark ; more mommy_shark ; more daddy_shark ; more Grandma_shark ; more Grandpa_shark ; more lets_shark
#concatenate all
cat *shark  > all_sharks

#####################################################################################
###upper middle
#gives you all you need
date

###middle middle
#get the files
wget https://ftp.ncbi.nlm.nih.gov/genomes/HUMAN_MICROBIOM/Bacteria/Acinetobacter_baumannii_6013113_uid33017/NZ_ACYR00000000.scaffold.fna.tgz
wget https://ftp.ncbi.nlm.nih.gov/genomes/HUMAN_MICROBIOM/Bacteria/Actinomyces_coleocanis_DSM_15436_uid31427/NZ_ACFG00000000.scaffold.fna.tgz
wget https://ftp.ncbi.nlm.nih.gov/genomes/HUMAN_MICROBIOM/Bacteria/Actinomyces_oral_taxon_178_F0338_uid53009/NZ_AEUH00000000.scaffold.fna.tgz
wget https://ftp.ncbi.nlm.nih.gov/genomes/HUMAN_MICROBIOM/Bacteria/Actinomyces_viscosus_C505_uid38743/NZ_ACRE00000000.scaffold.fna.tgz
wget https://ftp.ncbi.nlm.nih.gov/genomes/HUMAN_MICROBIOM/Bacteria/Afipia_clevelandensis_ATCC_49720_uid52157/NZ_AGWY00000000.scaffold.fna.tgz
#decompress files
cat *.tar.gz | tar zxvf - -i
#concatenate them
cat *fna > all.fna
#compress files
gzip all.fna
#check the file without decompressing
zless all.fna.gz
#check for sequence AGTC
zgrep AGTC all.fna.gz

###low middle
#Suppose we have a sequence called genome.fna
#change the letters
sed "s/A/a/g;s/T/t/g;s/C/c/g;s/G/g/g" genome.fna > nuevo_archivo.fna

######################################################################################
###upper right
#change the vowels into the letter e
sed s/[a,i,o,u]/e/g mi_libro

###middle right
#download the files
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/acerodon_celebensis_polyomavirus_1_uid280292/NC_026767.faa
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/achimota_rubulavirus_2_uid265895/NC_025404.faa
#count coding regions
#doesn´t apply 'cuase it's amino acids
#count lysines
grep -c K *faa
#count valines
grep - V *faa
#count both
egrep -c "K|V" *faa

###low right
#Download sequence
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/Viruses/acholeplasma_virus_l2_uid14066/NC_001447.gff
#Rename
mv NC_001447.gff NC.gff
#see the file
more NC.gff
#Check the coordinates using grep, if we only search for coding sequences (CDS) only those rows with the info will show
grep CDS *gff 
