#!/bin/bash

###Homework

#create a directory in home
cd ~
mkdir bio_homework

#make directoryto download desired files
mkdir downloads

#make sure all directories have been made
ls -a

#move to downloads directory
cd downloads

#confirm i'm in the desired directory
pwd

#download web files
wget https://ftp.ncbi.nih.gov/genomes/Viruses/acerodon_celebensis_polyomavirus_1_uid280292/NC_026767.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/acidianus_bottle_shaped_virus_3_uid307795/NC_028787.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/acerodon_celebensis_polyomavirus_2_uid279594/NC_026762.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/acidianus_spindle_shaped_virus_1_uid42351/NC_013585.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/alethinophid_1_reptarenavirus_uid173354/NC_018482.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/almpiwar_sripuvirus_uid265890/NC_025391.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/ancient_caribou_feces_associated_virus_uid261537/NC_024907.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/arboretum_almendravirus_uid265914/NC_025393.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/avian_dependoparvovirus_1_uid14456/NC_004828.fna
wget https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/bacillus_phage_salinjah_uid344170/NC_031034.fna

#check if the files were downloaded
ls -la

#compress files
gzip *.fna

#decompress files
gzip -dk *.gz

#concatenate all fna files
cat *fna > together.fna

#rename the together.fna file
mv together.fna exp.fna

#move the exp.fna file into the bio_homework directory
mv exp.fna ~/bio_homework/

#move to the created directory
cd ~/bio_homework/

#confirm i'm in the desired directory
pwd

#check if my file is there
ls -a

#count how many start and stop codons there are individually
grep ATG exp.fna
grep TAG exp.fna
grep TGA exp.fna
grep TAA exp.fna

#now how many total stop codons there are
egerep "TAG|TGA|TAA" exp.fna

#now all four codons together
egerep "ATG|TAG|TGA|TAA" exp.fna

#show position of codons with colour


#by now our terminal will be full, so lets make it clear
clear

#now we'll change the DNA into RNA in a new file
sed s/T/U/g exp.fna > RNA_file_1.fna

#next, we'll see if we did it right
less RNA_file_1.fna

#just to make sure we dpon't loose anythig, a copy will be nice to have
cp RNA_file_1.fna RNA_copy_2.fna
cp RNA_file_1.fna RNA_copy_3.fna
cp RNA_file_1.fna RNA_copy_4.fna

#we'll move our copy into a newly created directory inside and move inside it
#just for the sake of it we'll make new folders just to ensure we can do them
mkdir copy1 ; mkdir copy2 ; mkdir copy3 ; mv RNA_copy_2.fna ~/bio_homework/copy1/
mv RNA_copy_3.fna ~/bio_homework/copy2
mv RNA_copy_4.fna ~/bio_homework/copy3
cd copy1/

#we make sure our file is there
ls -a

#we notice we don't want the file, nor the directory, so we move up and make it disappear
cd ..
rm -r copy1

#now we'll see the codons and see possible stat and stops
grep ATG exp.fna --color=always | GREP_COLORS="mt=01;34" egrep --color=always "TGA|TAG|TAA"

#clear again
clear