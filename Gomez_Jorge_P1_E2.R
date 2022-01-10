library(Biostrings)
sec_aa<-readAAStringSet("exam_fasta.fna")
sec_aa #loaded the sequences
alphabetFrequency(sec_aa) #check for alphabet frequency
any(width(sec_aa)>51) #show if any sequence is shorter than 50 aa
ali_clw<-msa(sec_aa[width(sec_aa)>51,], method = "ClustalW") #fisrt alignment with clustal W
ali_clo<-msa(sec_aa[width(sec_aa)>51,], method = "ClustalOmega") #second alignment, with clustal Omega
library(vegan)
vegdist(alphabetFrequency(sec_aa[width(sec_aa)<=51,]))#distance matrix, may change which method i wish to use to calculate it
#no sequences is less tha 51 aa, only 51 as the shortest
vegdist(alphabetFrequency(sec_aa))
plot(hclust(vegdist(alphabetFrequency(sec_aa))))#chance y es chicle y pega
