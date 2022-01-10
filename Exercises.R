###Every, or almost every exercise that comes within Roberto's slides and some of the hw's and exercises


#-------------------------------------------------------------------Vectors----------------------------------------------------
#1. what's the ages' mean without Beth
ages<-c(25,35,70,17,14)
nam<-c("Jerry", "Beth", "Rick", "Summer", "Morty")
names(ages)<-nam
ages
mean(ages[-2])
#2.Take morty out of the vector, save it and make a new vector out of it
new<-ages[-5]
new
#3. Is there an age bigger than 75? Less than 12? Between 12 and 20?
any(ages>75)
any(ages<12)
any(ages>12 & ages>20)
#4.Make a vector with the ages of 10 classmates
ages<-c(20.91,21.67,21,21.67,20.25,21.3,22.91,21.91)
#5. Assign the vector its names
nam<-c("Carmen", "Jorge", "Esther", "Liz", "Andres", "Frank", "Eve", "Cindy")
names(ages)<- nam
ages
#6. Find the mean, maximum, median, standard deviation, vector length, and select only odd numbers
mean(ages)
max(ages)
min(ages)
sd(ages)
median(ages)
length(ages)
ages[which(ages%%2!=0)]
#7. Delete the largest and the smallest and make an histogram from the resultaing vector
hist(sort(ages)[-c(1,length(ages))], col = c("red","blue","yellow","green"))
#8. make a vector with the names of 10 viruses
nam<-virus_name<- c("hepatitis_B","hepatitis_C","hepatitis_A","West Nile Virus", 
                      "Abalone Herpesvirus","Acinetobacter virus","Adoxophyes Honmai Entomopoxvirus",
                      "abaca_bunchy_top_virus", "abelson_murine_leukemia_virus", "abutilon_brazil_virus")
#9.Associate the names of the viruses with their accession numbers
acc<- c("NC_003977.2","NC_004102.1","M14707.1","NC_001563", "NC_018874","NC_015250","NC_021247",
                 "NC_010314.1", "NC_001499.1", "NC_014138.1")
names(acc)<-nam
acc
#10. make another vector that contains the genome length and the names
gen<-c(3182,9646,7478,10962,10962,159801,228750,1090,5894,2653)
names(gen)<-nam
gen
#11.Determine which viruses are longer than 3000 bp
gen[gen>3000]
#12. make a subgroup of the vector that contains teh sequences shorter than 3000 and another with a length bigger than 3000
less<-ages[gen<3000]
more<-ages[gen>3000]
#13. make an histogram with all the sequences
hist(gen)
#14. make a boxplot with all the sequences. Put the name of every virus
boxplot(gen, ylab= nam, horizontal=T)


#-------------------------------------------------------------------Matrices----------------------------------------------------
#1. Make a matrix with the number of rows equal to the number of partners. Assign a name to each row. The columns must be the favourite number, 
#month of birth, birthday, number of subjects taken this semester. Assign names to each columns
nums<-matrix(c(3, 9, 23, 3, 7,1,28,5,6, 9, 6, 5,19, 07, 22, 5,
          0, 6, 19, 5, 7,1,7,6,8, 8, 31, 7),nrow=7, byrow=T)
rownames(nums)<-c("uno","dos","tres","cuatro","cinco","seis","siete")
colnames(nums)<- c("num_fav","birth_m","birth_d","subj")
nums
#2. calculate the mean of subjects taken
apply(nums,2,mean)["subj"]
#3. in which month are there more birthdays?
table(nums[,"birth_m"])
#4. same but with the days
table(nums[,"birth_d"])
#5. standard deviation of our favourite numbers
apply(nums,2,sd)["num_fav"]

#-------------------------------------------------------------------Biostrings----------------------------------------------------
#with langebio exercises
#1. Which sequences are longer than 5000
nc<-readDNAStringSet("try.fna")
nc[width(nc)>5000]
#2. Percentage of GC in shortest sequence
letterFrequency(nc[2], letters = "GC" ,as.prob = T)
#show graphically the nucleotide frquence in each sequence
barplot(alphabetFrequency(nc, baseOnly=T, as.prob = T), beside = T, col=rainbow(2))
#3.Load a genome and determine GC content in each chromosome
library(BSgenome.Celegans.UCSC.ce10)
kk<-getSeq(Celegans)
letterFrequency(kk, letters = "GC", as.prob = T)
#4. plot the nucleotide percentage of each sequence
barplot(alphabetFrequency(kk, baseOnly=T, as.prob = T), beside = T, col=rainbow(7))
#Find longest consecutives of each nucleotide
longestConsecutive(as.vector(kk), "A")
longestConsecutive(as.vector(kk), "T")
longestConsecutive(as.vector(kk), "G")
longestConsecutive(as.vector(kk), "C")
#-------------------------------------------------------------------DataFrames----------------------------------------------------
#1. Download annotation from E. coli str. K-12 substr. MG1655. Put it under the name annotation_ecoli.
an_ecoli<-GCF_000005845.2_ASM584v2_genomic.gff
#2. select all genes within the positive and negative strands. Compare the difference in the number of genes.
pos<-sum(an_ecoli$V7=="+")
neg<-sum(an_ecoli$V7=="-")
pos-neg
#3. select all positive genes that are longer than the mean of the genes
mn<-an_ecoli[which(an_ecoli$V3=="CDS"),]
win<-mn[which(mn$V7=="+"),]
gg<-win[which((win$V5-win$V4)>(mean(mn$V5-mn$V4))),]
#4. calculate the min, max, mean, and median of the length of the genes
mean(mn$V5-mn$V4)
min(mn$V5-mn$V4)
max(mn$V5-mn$V4)
median(mn$V5-mn$V4)
#5. Find all genes after the nucleotide 25000
ll<-an_ecoli[which((an_ecoli$V3=="gene")),]
yy<-ll[which((ll$V4)>25000),]
View(yy)
#6. make a boxplot out of the lenght of all the genes
boxplot(mn$V5-mn$V4)
#-------------------------------------------------------------------IDK, kind of homework I guess--------------------------------------------
#1. Determine zodiac signs
day<-21
month<-"April"
if(month=="January"){
  if(day<=19){
    print("you're capricorn")
  } else if(day>=20)
    print("you're aquarius")
} else if (month=="February"){
  if(day<=18){
    print("you're aquarius")
  } else if(day>18)
    print("you're pisces")
} else if(month=="March"){
  if(day<=20){
    print("you're pisces")
  } else if(day>20)
    print("you're aries")
} else if(month=="April"){
  if(day<=19){
    print("you're aries")
  } else if(day>19)
    print("you're taurus")
} else if(month=="May"){
  if(day<=20){
    print("you're taurus")
  } else if(day>20)
    print("you're gemini")
} else if(month=="June"){
  if(day<=21){
    print("you're gemni")
  } else if(day>21)
    print("you're cancer")
} else if(month=="July"){
  if(day<=22){
    print("you're cancer")
  } else if(day<22)
    print("you're leo")
}else if(month=="August"){
  if(day<=22){
    print("you're leo")
  } else if(day>22)
    print("you're virgo")
}else if(month=="September"){
  if(day<=22){
    print("you're virgo")
  }else if(day>22)
    print("you're libra")
}else if(month=="October"){
  if(day<=22){
    print("you're libra")
  }else if(day>22)
    print("you're scorpio")
}else if(month=="November"){
  if(day<=21){
    print("you're scorpio")
  }else if(day>21)
    print("you're sagittarius")
}else if(month=="December"){
  if(day<=21){
    print("you're sagittarius")
  }else if(day<21)
    print("you're capricorn")
}
b_day<-c(22,12,1999)
if((b_day[2]==1 & b_day[1]<=19)|b_day[2]==12 & b_day[1]>21){
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
#2. Check if you have a passing grade por not
exams<-c(10,10,10)
tar_quiz<-c(10,10,10,10,10,10,10,10,10,10)
rest<-20
if(mean(exams)>7){
  if(((mean(exams)*50/10)+(mean(tar_quiz)*30)/10+rest)>=70){
    print(paste("you passed with", ((mean(exams)*50/10)+(mean(tar_quiz)*30)/10+rest)/10))
  }else print(paste("you have to take the exam ´cause you got", ((mean(exams)*50/10)+(mean(tar_quiz)*30)/10+rest)/10))
}else print("you have to take the final 'cause you don't have the minimum exam average")
#-------------------------------------------------------------------For_loops_hw--------------------------------------------
#1.-same as last hw
nom<-c("Liz","Parker","Jorge","Karla")
for (i in nom) {
  fecha<-readline(prompt=paste(i,"Dime el número del mes en que naciste"))
  fecha<-as.numeric(fecha)
  if(fecha==12|fecha<=2){
    print("born in winter")
  }else if(fecha>=3 & fecha<6){
    print("born in spring")
  }else if(fecha>=6 & fecha<9){
    print("born in summer")
  }else if(fecha>=9 & fecha<12){
    print("born in autumn")
  }
  day<-readline(prompt=paste(i,"Dime el día de tu nacimiento "))
  day<-as.numeric(day)
  if((fecha==1 & day<=19)|fecha==12 & day>21){
    print("you're capricorn")
  }else if((fecha==1 & day>19)|fecha==2 &day<=18){
    print("you're aquarius")
  }else if((fecha==2 & day>18)|fecha==3 &day<=20){
    print("you're pisces")
  }else if((fecha==3 & day>20)|fecha==4 &day<=19){
    print("your're aries")
  }else if((fecha==4 & day>19)|fecha==5 &day<=20){
    print("you're taurus")
  }else if((fecha==5 & day>20)|fecha==6 &day<=21){
    print("you're gemini")
  }else if((fecha==6 & day>21)|fecha==7 &day<=22){
    print("you're cancer")
  }else if((fecha==7 & day>22)|fecha==8 &day<=22){
    print("you're leo")
  }else if((fecha==8 & day>22)|fecha==9 &day<=22){
    print("you're virgo")
  }else if((fecha==9 & day>22)|fecha==10 &day<=22){
    print("you're libra")
  }else if((fecha==10 & day>22)|fecha==11 &day<=21){
    print("you're scorpio")
  }else if((fecha==11 & day>21)|fecha==12 &day<=21){
    print("you're sagittarius")
  }
  year<-readline(prompt=paste(i,"Dime tu año de nacimiento "))
  year<-as.numeric(year)
  age<-(((as.numeric(format(Sys.Date(),"%Y"))-year)*365)-(-((as.numeric(format(Sys.Date(),"%m")))-fecha)*31)-day)/365
  print(paste("you're ", age, "years old"))
}

#2.- same as last hw
nuc<-readDNAStringSet("exer_1.fna")
j<-1
for (i in as.vector(nuc)) {
  names(i)<-paste0("sequence_",j)
  j<-j+1
  print(paste("the lengtht of", names(i),"is", width(i)))
  print(complement(DNAString(i)))
  print(reverseComplement(DNAString(i)))
  print(translate(DNAString(i),if.fuzzy.codon = "solve"))
  print(vmatchPattern("TGA",i))
  print(vmatchPattern("TAG",i))
  print(vmatchPattern("TAA",i))
  print(vmatchPattern("ATG",i))
  if(width(i)>mean(width(nuc))){
    print(paste(names(i),"is longer than the mean length"))
  }

}

#3.-super powers
sup_h<-c("Wolverine","Batman","Spiderman","Thor")
pows<-c(9,6,8,10)
names(pows)<-sup_h
for (k in 1:length(pows)) {
  if(pows[k]>=7){
    print(paste(sup_h[k],"un gran poder conlleva una gran responsabilidad"))
  }else print(paste(sup_h[k], "is weak, bro"))
}

#-------------------------------------------------------------------For_While_functions----------------------------------------------------
#1.- Sum with for loop
suma<-0
i<-1
while (suma<100) {
  print(suma) 
  suma<-suma + i
  i<-i+1
}
#2.-Make the program say hi friend
nam<-c("juan","Jake","tavo","luis","andrea","maría","martín","Sol")
sex<-c("h","h","h","h","m","m","h","m")
names(sex)<-nam
for (i in nam) {
  if(sex[i]=="h"){
    print(paste("hola amigo",i))
  }else print(paste("hola amiga",i))
}
#3.-same as above but with while 
i<-1
while (i<=length(nam)) {
  if(sex[i]=="h"){
    print(paste("hola amigo",nam[i]))
  }else print(paste("hola amiga",nam[i]))
  i<-i+1
}
#4.-Create own function in environment
fu_2<-function(a,b,c){
  x1<-(-b+sqrt(b^2-(4*a)*c))/(2*a)
  x2<-(-b-sqrt(b^2-(4*a)*c))/(2*a)
  return(paste(x1,x2,sep = ","))
}
fu_2(1,2,0)

#-------------------------------------------------------------------msa----------------------------------------------------
#1.- load at least 10 fna sequences (concatenate)
seqs<-readDNAStringSet("all.fna")
#2.- translate the sequences into aa
tran<-translate(seqs, no.init.codon=T,if.fuzzy.codon="X")
#3.- find and graph nucleotide and aa frequency of each sequence
barplot(alphabetFrequency(seqs, baseOnly =T), beside = T, col=rainbow(4))
barplot(alphabetFrequency(translate(seqs, no.init.codon=T,if.fuzzy.codon="X")), beside = T, col=rainbow(10))
#4.- make 3 alignments with the different algorythms
library(msa)
msa(tran, method="ClustalW")
msa(tran, method="ClustalOmega")
msa(tran, method="Muscle")
#5.- make the tree of a pre-existing one made from mega
library(ggtree)
library(ggimage)
library(phytools)
tree_globs<-read.tree("tree_glob.nwk")
ggtree(tree_globs, branch.length = T,layout = "rectangular")+
  geom_label2(aes(subset=!isTip, label=node))+
  geom_cladelabel(18, "one", offset=2, barsize=2, angle=90, offset.text=.1, hjust=0.5, fontsize=6)+
  geom_cladelabel(16, "two", offset=2, barsize=2, angle=90, offset.text=.1, hjust=0.5, fontsize=6)+
  geom_cladelabel(20, "three", offset=2, barsize=2, angle=90, offset.text=.1, hjust=0.5, fontsize=6)+
  geom_cladelabel(7, "idk", offset=2, barsize=2, angle=90, offset.text=.1, hjust=0.5, fontsize=6)+
  geom_hilight(node=20, fill="darkgreen", alpha=0.5)+
  geom_hilight(node=14, fill="yellow", alpha=0.5)+
  geom_tiplab(size=3, color="red")
