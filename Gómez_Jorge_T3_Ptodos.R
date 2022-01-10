#-------------------------------------------------------------------------1.Estructuras de selección---------
exams<-c(10,10,10)
tar_quiz<-c(10,10,10,10,10,10,10,10,10,10)
rest<-20
if(mean(exams)>7){
  if(((mean(exams)*50/10)+(mean(tar_quiz)*30)/10+rest)>=70){
    print(paste("you passed with", ((mean(exams)*50/10)+(mean(tar_quiz)*30)/10+rest)/10))
  }else print(paste("you have to take the exam ´cause you got", ((mean(exams)*50/10)+(mean(tar_quiz)*30)/10+rest)/10))
}else print("you have to take the final 'cause you don't have the minimum exam average")
#-------------------------------------------------------------------------2.Estructuras de selección---------
b_day<-c(7,12,1999) #day, month, year
age<-(((as.numeric(format(Sys.Date(),"%Y"))-b_day[3])*365)-(-((as.numeric(format(Sys.Date(),"%m")))-b_day[2])*31)+b_day[1])/365
age<-(2020-b_day[3]) #tried more, didn't work at all
age
zodiac<-if((b_day[2]==1 & b_day[1]<=19)|b_day[2]==12 & b_day[1]>21){
  print("you're capricorn")
}else if((b_day[2]==1 & b_day[1]>19)|b_day[2]==2 &b_day[1]<=18){
  print("you're aquarius")
}else if((b_day[2]==2 & b_day[1]>18)|b_day[2]==3 &b_day[1]<=20){
  print("you're pisces")
}else if((b_day[2]==3 & b_day[1]>20)|b_day[2]==4 &b_day[1]<=19){
  print("your're aries")
}else if((b_day[2]==4 & b_day[1]>19)|b_day[2]==5 &b_day[1]<=20){
  print("you're taurus")
}else if((b_day[2]==5 & b_day[1]>20)|b_day[2]==6 &b_day[1]<=21){
  print("you're gemini")
}else if((b_day[2]==6 & b_day[1]>21)|b_day[2]==7 &b_day[1]<=22){
  print("you're cancer")
}else if((b_day[2]==7 & b_day[1]>22)|b_day[2]==8 &b_day[1]<=22){
  print("you're leo")
}else if((b_day[2]==8 & b_day[1]>22)|b_day[2]==9 &b_day[1]<=22){
  print("you're virgo")
}else if((b_day[2]==9 & b_day[1]>22)|b_day[2]==10 &b_day[1]<=22){
  print("you're libra")
}else if((b_day[2]==10 & b_day[1]>22)|b_day[2]==11 &b_day[1]<=21){
  print("you're scorpio")
}else if((b_day[2]==11 & b_day[1]>21)|b_day[2]==12 &b_day[1]<=21){
  print("you're sagittarius")
}
zodiac
season<-if(b_day[2]==12|b_day[2]<=2){
  print("born in winter")
}else if(b_day[2]>=3 & b_day[2]<6){
  print("born in spring")
}else if(b_day[2]>=6 & b_day[2]<9){
  print("born in summer")
}else if(b_day[2]>=9 & b_day[2]<12){
  print("born in autumn")
}
season
#-------------------------------------------------------------------------3.Alineamiento---------
nuc<-readDNAStringSet("exer_1.fna")
width(nuc)
nam<-paste0("sequence_",1:10)
names(nuc)<-nam
com<-complement(nuc)
rev_com<-reverseComplement(nuc)
rev<-reverse(nuc)
trans<-translate(nuc,if.fuzzy.codon = "solve")
library(msa)
msa(trans[order(width(trans))][c(1,2)])
msa(trans[order(width(trans))][c(length(trans),(length(trans)-1))])#this will always select the last 2 sequences, no matter how many there are
vmatchPattern("TGA", nuc)
vmatchPattern("TAG", nuc)
vmatchPattern("TAA", nuc)
vmatchPattern("ATG", nuc)
nuc[which(width(nuc)>mean(width(nuc))),]
#-------------------------------------------------------------------------4.Modelo de Markov---------
e_coli<-readDNAStringSet("e_coli_gen_com.fasta")
e_coli
nuc<-c("A","C","G","T")
alphabetFrequency(e_coli, baseOnly= T)
dinucleotideFrequency(e_coli)
trinucleotideFrequency(e_coli)
###
###
kk<-matrix(c((dinucleotideFrequency(e_coli)[c(1:4)])/alphabetFrequency(e_coli, baseOnly= T)[1],
             (dinucleotideFrequency(e_coli)[c(5:8)])/alphabetFrequency(e_coli, baseOnly= T)[2],
             (dinucleotideFrequency(e_coli)[c(9:12)])/alphabetFrequency(e_coli, baseOnly= T)[3],
             (dinucleotideFrequency(e_coli)[c(13:16)])/alphabetFrequency(e_coli, baseOnly= T)[4]),ncol=4,byrow=T)
kk
colnames(kk)<-nuc
row.names(kk)<-nuc
AAAA<-kk[1,1]*kk[1,1]*kk[1,1]
ACGT<-kk[1,2]*kk[2,3]*kk[3,4]
AATT<-kk[1,1]*kk[1,4]*kk[4,4]
###
###
ll<-matrix(c((trinucleotideFrequency(e_coli)[c(1:4)])/dinucleotideFrequency(e_coli)[1],
         (trinucleotideFrequency(e_coli)[c(5:8)])/dinucleotideFrequency(e_coli)[2],
         (trinucleotideFrequency(e_coli)[c(9:12)])/dinucleotideFrequency(e_coli)[3],
         (trinucleotideFrequency(e_coli)[c(13:16)])/dinucleotideFrequency(e_coli)[4],
         (trinucleotideFrequency(e_coli)[c(17:20)])/dinucleotideFrequency(e_coli)[5],
         (trinucleotideFrequency(e_coli)[c(21:24)])/dinucleotideFrequency(e_coli)[6],
         (trinucleotideFrequency(e_coli)[c(25:28)])/dinucleotideFrequency(e_coli)[7],
         (trinucleotideFrequency(e_coli)[c(29:32)])/dinucleotideFrequency(e_coli)[8],
         (trinucleotideFrequency(e_coli)[c(33:36)])/dinucleotideFrequency(e_coli)[9],
         (trinucleotideFrequency(e_coli)[c(37:40)])/dinucleotideFrequency(e_coli)[10],
         (trinucleotideFrequency(e_coli)[c(41:44)])/dinucleotideFrequency(e_coli)[11],
         (trinucleotideFrequency(e_coli)[c(45:48)])/dinucleotideFrequency(e_coli)[12],
         (trinucleotideFrequency(e_coli)[c(49:52)])/dinucleotideFrequency(e_coli)[13],
         (trinucleotideFrequency(e_coli)[c(53:56)])/dinucleotideFrequency(e_coli)[14],
         (trinucleotideFrequency(e_coli)[c(57:60)])/dinucleotideFrequency(e_coli)[15],
         (trinucleotideFrequency(e_coli)[c(61:64)])/dinucleotideFrequency(e_coli)[16]), ncol=4, byrow=T)
ll
colnames(ll)<-nuc
row.names(ll)<-colnames(as.matrix(dinucleotideFrequency(e_coli)))
AAAA<-ll[1,1]*ll[1,1]
ACGT<-ll[2,3]*ll[7,4]
AATT<-ll[1,4]*ll[4,4]
###
###
mm<-matrix(NA, ncol=4,nrow=64)

#algo estoy haciendo tremendamente mal, porque si sigo así, debería de sacar 256 opciones, similar a lo de abajo 
###
###------
vcountPattern("AAAA",e_coli)
vcountPattern("AAAC",e_coli)
vcountPattern("AAAG",e_coli)
vcountPattern("AAAT",e_coli)

vcountPattern("AACA",e_coli)
vcountPattern("AACC",e_coli)
vcountPattern("AACG",e_coli)
vcountPattern("AACT",e_coli)

vcountPattern("AAGA",e_coli)
vcountPattern("AAGC",e_coli)
vcountPattern("AAGG",e_coli)
vcountPattern("AAGT",e_coli)

vcountPattern("AATA",e_coli)
vcountPattern("AATC",e_coli)
vcountPattern("AATG",e_coli)
vcountPattern("AATT",e_coli)

vcountPattern("ACAA",e_coli)
vcountPattern("ACAC",e_coli)
vcountPattern("ACAG",e_coli)
vcountPattern("ACAT",e_coli)

vcountPattern("ACCA",e_coli)
vcountPattern("ACCC",e_coli)
vcountPattern("ACCG",e_coli)
vcountPattern("ACCT",e_coli)

vcountPattern("ACGA",e_coli)
vcountPattern("ACGC",e_coli)
vcountPattern("ACGG",e_coli)
vcountPattern("ACGT",e_coli)

vcountPattern("AAAA",e_coli)
vcountPattern("AAAC",e_coli)
vcountPattern("AAAG",e_coli)
vcountPattern("AAAT",e_coli)

vcountPattern("ATAA",e_coli)
vcountPattern("ATAC",e_coli)
vcountPattern("ATAG",e_coli)
vcountPattern("ATAT",e_coli)

vcountPattern("ACGA",e_coli)
vcountPattern("ACGC",e_coli)
vcountPattern("ACGG",e_coli)
vcountPattern("ACGT",e_coli)

vcountPattern("ACTA",e_coli)
vcountPattern("ACTC",e_coli)
vcountPattern("ACTG",e_coli)
vcountPattern("ACTT",e_coli)

vcountPattern("AGAA",e_coli)
vcountPattern("AGAC",e_coli)
vcountPattern("AGAG",e_coli)
vcountPattern("AGAT",e_coli)

vcountPattern("AGCA",e_coli)
vcountPattern("AGCC",e_coli)
vcountPattern("AGCG",e_coli)
vcountPattern("AGCT",e_coli)

vcountPattern("AGTA",e_coli)
vcountPattern("AGTC",e_coli)
vcountPattern("AGTG",e_coli)
vcountPattern("AGTT",e_coli)

vcountPattern("ATAA",e_coli)
vcountPattern("ATAC",e_coli)
vcountPattern("ATAG",e_coli)
vcountPattern("ATAT",e_coli)

vcountPattern("ATCA",e_coli)
vcountPattern("ATCC",e_coli)
vcountPattern("ATCG",e_coli)
vcountPattern("ATCT",e_coli)

vcountPattern("ATGA",e_coli)
vcountPattern("ATGC",e_coli)
vcountPattern("ATGG",e_coli)
vcountPattern("ATGT",e_coli)

vcountPattern("ATTA",e_coli)
vcountPattern("ATTC",e_coli)
vcountPattern("ATTG",e_coli)
vcountPattern("ATTT",e_coli)

#----
#no jaló
mm<-matrix(NA, ncol=4,nrow=64)
mm
rownames(mm)<-colnames(as.matrix(trinucleotideFrequency(e_coli)))
colnames(mm)<-nuc
#-------------------------------------------------------------------------5.Principio de tío Ben---------
#strength 1-4 points
#intelligence 1-3 points
#speed 1-2 points
#charisma 1 point
Thor<-c(4,1,2,1)
Spider_Man<-c(2,3,2,1)
Wolverine<-c(3,2,1,0)
Batman<-c(1,3,1,1)
Robin<-c(1,2,1,1)
Captain_America<-c(2,2,1,1)
Black_widow<-c(1,3,1,1)
Wonder_woman<-c(3,3,2,1)
Green_lantern<-c(3,3,2,0)
super_man<-c(4,3,2,1)
super<-data.frame(Thor,Spider_Man,Wolverine,Batman,Robin,
             Captain_America,Black_widow,Wonder_woman,Green_lantern,
             super_man)
if(any(colSums(super)>=8)){
  print(paste(names(which(colSums(super)>=8)), "un gran poder conlleva una gran responsabilidad"))
}else print("todos son débiles, prro")




