###Vectors

#define a vector
vec<- c(1,2,3,4,4,9,66,54,23,11)

#length of vector
length(vec)

#Make vector with defined interval
vec2<- (1:200)

#Same as above, but with seq can add interesting arguments
#it isn't necessary to write arguments if can remember the order
vec3<- seq(1,100,5)

#Can make the "by" with whatever i want
vec4<- seq(1,2,.01)

#Access specific elements from vector 
vec[1:4]
#They don't have to be consecutive 
vec[c(7,2)]

#now we exclude elements
vec[-c(9,3)]
#same, doesn't have to be consecutive
#can exclude with result from other commands
vec[-length(vec2)]

#add new elements to existing vector
vec<- c(vec[1:4],99,vec[5:10])

#can make empty vectors and then fill them
vec5<- c()
vec5[1:3]<- c(2,4,6)
vec5<- c(vec5,9,12,19)
vec5[length(vec5)+1]<- 77

#can make repetitions of vectors or elements
rep(3,9)
rep(vec,2)
#can specify also frequency of repetition
rep(vec, each=4)

#functions that comply with a certain condition respectivaly
#will show true or false
#any will show if ANY value in the vector complies or not
an1<- seq(1,100,20)
any(an1>10)
any(an1>=81)
#with all, we're checking if ALL values comply with the condition
all(an1>100)
all(an1>0)
all(an1>=1)
#they're good for long vectors that you won't remember

#basic calculus
ca1<-c(1:5)
ca2<-c(6:10)
#sum
ca1+ca2
#minus
ca2-ca1
#they go term by term, doesn't take into account all values
#multiplication
ca1*ca2
2*ca1
sqrt(15)*ca1

#operations
min(ca2)
max(ca2)
#sum all values
sum(ca2)
#unique show the unique elements
unique(ca2)
#show by smallest to biggest unless the argument decrease is T
sort(ca2, decreasing = T)
sort(ca2)
#
range(ca2)

#graph vectors
hist(ca2)


#can name the vectors with specific names of entries
#examples
edades<-c(35,35,70,17,14)
nombres <-c("Jerry","Beth","Rick", "Summer","Morty")
names(edades)<- nombres
mean(edades[-2])
yas<-sort(edades[-5])
any(edades>75)
any(edades<12)
any(edades>c(12:20)) #maybe, not really
any(edades>12 & edades<20) #actually does it 
# ||||| works as an or

#work
ages<- c(20.91,21.67,21,21.67,20.25,21.3,22.91,21.91)
names1<- c("Carmen", "Jorge", "Esther", "Liz", "Andres", "Frank", "Eve", "Cindy")
names(ages)<- names1
min(ages)
max(ages)
mean(ages)
median(ages)
sd(ages)
length(ages)
library(schoolmath)
print(which(is.odd(ages)))
is.odd(ages)


#### show if the data is NA
is.na(vec)
#can't work with NA's
#we can remove the NA's with arguments
vecna<- c(1,5,6,NA,5,23,239)
trna<-vecna*vecna > 10

########
#Ejercicios
virus_name<- c("hepatitis_B","hepatitis_C","hepatitis_A","West Nile Virus", 
               "Abalone Herpesvirus","Acinetobacter virus","Adoxophyes Honmai Entomopoxvirus",
               "abaca_bunchy_top_virus", "abelson_murine_leukemia_virus", "abutilon_brazil_virus")
virus_acc<- c("NC_003977.2","NC_004102.1","M14707.1","NC_001563",
              "NC_018874","NC_015250","NC_021247",
              "NC_010314.1", "NC_001499.1", "NC_014138.1")
names(virus_acc)<-virus_name
virus_gen<- c(3182,9646,7478,10962,10962,159801,228750,1090,5894,2653)
names(virus_gen)<- virus_name
virus_gen
virus_gen[virus_gen>300]
which(virus_gen>300)
boxplot(virus_gen, xlab= virus_name)

######
#####
#MATRICES
#rectangular arrange of only one type of data

#Make matrices
#use function matrix()
#we need a vector and at least one dimension (number of columns or rows)
#fills by column first
#argument byrow= makes it fill by rows rather than columns
mat1<-()


#dimensions
#use function dim() and it will show the dimensions (number of columns and rows)

#we can create a matrix and then we'll add the data, however, it is inefficient
y<- matrix(nrow=2, ncol=2)
y
y[1,1]<- "yas"

#we can make 

#make sure if they have the same dimensions
(dim(n)-dim(m))==0

#multiply matrices %*%
y%*%x

#name the columns and rows
colnames()<-()
rownames()<-()

#function "apply()"
#very useful
#allows to make 
#syntaxis: apply(object,dimension,function)
#example
apply(m, 1, sd)

#view pre-existing matrix
View(m)

#modify pre-existing matrix
edit(m)

#Excercises
ex<- matrix(c(3, 9, 23, 3, 7,1,28,5,6, 9, 6, 5,19, 07, 22, 5,
              0, 6, 19, 5, 7,1,7,6,8, 8, 31, 7),nrow=7, byrow=T)
ex
colnames(ex)<- c("num_fav","birth_m","birth_d","subj")
mean(ex[,"subj"])
table(ex[,2])
table(ex[,3])
install.packages("pracma")
library(pracma)
Mode(ex[,2])
Mode(ex[,3])
sd(ex[,2])




#####
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.11")

library(Biostrings)
#####
#####
#####
#####
#Use of biostrings
#strings: chain of characters
#define a string
dna1<-DNAString("ACGT--TGCC-N")
#make a group of strings
dna2<-DNAStringSet(c("ACTGGAACT","GTCAGGCTAGG","ATTTGCCGC"))
#Can choose from any of the following letters, may substitute
IUPAC_CODE_MAP
#this show the codon for each letter
GENETIC_CODE
###subset my string
dna1[1:6]
##when we subset many strings, subset selects the whole sequence, not specific positions
dna2[2:3]
##to subset wthin one of many, can use subset of subset
dna2[[2]][1:3]
#name the strings
names(dna2)<-paste0("sequence_",1:3)
#exist many possible type of strings
RNAString()
AAString()
BString()

#load sequences
#use readDNAStringSet(), it reads external sequences
readDNAStringSet("direction of the sequence in my computer")

#biological features, get reverse sequence
reverse(dna1)
complement(dna1)
translate(dna2)
reverseComplement(dna2)

#calculate basic info wiht biostrings
alphabetFrequency(dna2)
alphabetFrequency(dna1)
#shows the number of times EACH letter appears, not in that order or together
letterFrequency(dna2, "AT")
#shows possible dinucleotide frequency, must be in that order
dinucleotideFrequency(dna2)
#shows possible trinucleotide frequency
trinucleotideFrequency(dna2)

#####
nc<-readDNAStringSet("try.fna")
aa<-readAAStringSet("trya.faa")
alphabetFrequency(nc, baseOnly=T, as.prob = T)
alphabetFrequency(aa, as.prob = T)
####
length(aa)
aa
dinucleotideFrequency(nc)
trinucleotideFrequency(nc)
#narrow can be used to select a specific zone
narrow(nc,1,20)
###
width(nc)
sum(width(nc)>5000)
nc[width(nc)>5000]
letterFrequency(nc[[2]], letters = "GC", as.prob = TRUE)
barplot(alphabetFrequency(nc, baseOnly=T, as.prob = T), beside = T, col=c("red","yellow"))
#####
####
####
BiocManager::install("BSgenome") 
library(BSgenome)#has many pre-loaded sequences
#visualize the avilable sequences
available.genomes()
#load a specific DNA sequence
BiocManager::install("BSgenome.Celegans.UCSC.ce10")
#now i have the desired sequence in my library
library(BSgenome.Celegans.UCSC.ce10)
#I can visualize the data it hase if print the "library"
BSgenome.Celegans.UCSC.ce10
#can use many functions with it
BSgenome.Celegans.UCSC.ce10$chrII
alphabetFrequency(BSgenome.Celegans.UCSC.ce10$chrII)
trinucleotideFrequency(BSgenome.Celegans.UCSC.ce10$chrIV)
seqlengths(Celegans)
seqnames(Celegans)
alphabetFrequency(Celegans$chrI)
#match pattern: search for specific sequence
matchPattern("ATGCCGTC", Celegans$chrIV)
#can use the vmatchpattern to search for a sequence that may vary from what i'm searching 
vmatchPattern()
#can use complement
complement(BSgenome.Celegans.UCSC.ce10$chrII)
####excercises
seqq<-seqlengths(Celegans)
ch1<-letterFrequency(Celegans$chrI, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrI, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
ch2<-letterFrequency(Celegans$chrII, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrII, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
ch3<-letterFrequency(Celegans$chrIII, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrII, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
ch4<-letterFrequency(Celegans$chrIV, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrII, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
ch5<-letterFrequency(Celegans$chrV, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrII, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
chX<-letterFrequency(Celegans$chrX, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrII, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
chM<-letterFrequency(Celegans$chrM, letters = "GC", as.prob = T)
barplot(alphabetFrequency(Celegans$chrM, baseOnly=T, as.prob = T), beside = T, 
        col=c("red","yellow"))
dinucleotideFrequency(Celegans$chrI, as.prob = T)["GC"]
dinucleotideFrequency(Celegans$chrII, as.prob = T)["GC"]
dinucleotideFrequency(Celegans$chrIII, as.prob = T)["GC"]
dinucleotideFrequency(Celegans$chrIV, as.prob = T)["GC"]
dinucleotideFrequency(Celegans$chrV, as.prob = T)["GC"]
dinucleotideFrequency(Celegans$chrX, as.prob = T)["GC"]
dinucleotideFrequency(Celegans$chrM, as.prob = T)["GC"]
#####having trouble
longestConsecutive(kk, "A")
bye<-(c(Celegans$chrI,Celegans$chrII))
bye
class(bye)
bye1<-as.vector(bye)
kk<-DNAStringSet(c(Celegans$chrI,Celegans$chrII))
###make DNA to RNAn TRIES
replaceAt(Celegans$chrI("T"), "U")
gg<-Celegans$chrII
chartr("T","U",gg)
replaceAmbiguities(gg)
#
RNAString(gg)#only one fucking chromosome at a time
#
###
####
####
###Data frames
personajes<-c("R","J")
edades<-c(sample(13:21,1),13)
df<- data.frame(personajes,edades)
df
df[1,1]
df$personajes
df$edades
stat<-c("muerto","muerto")
df<-cbind(df,stat)
apply(df,2,sort)
df2<-df
df2[,1]<-c("m","h")
df[,2]<-c(15,16)
df2[,3]<-c("m","m")
merge.data.frame(df,df2)
##
#ejercicio pendiente
e.coli<-GCF_000005845.2_ASM584v2_genomic.gff
e.coli$V7
sum(e.coli$V7=="-")
sum(e.coli$V7=="+")

################
#Align multiple seuqences directly in R
BiocManager::install("msa")
library(msa)
library(ape)
library(seqinr)
aa<-readAAStringSet("Rob.fasta")
ali_clw<-msa(aa) #aligns by default with clustalW
print(msa(aa), show="complete")#shows full alignment
aa
msaPrettyPrint(msa(aa), output = "pdf")#try with to customize
ali_clo<-msa(aa,"ClustalOmega")
ali_clo

###
#Selection structures
#structures while programming
#if else structure
x<-5
x<-(-23)
if(x>0){
  print(paste(x, "is a positive number"))
} else {
  print(paste(x, "not a positive number"))
} 
#ifelse in one line
#as long as its simple enough to fit in a line
ifelse(x>0, paste(x,"positive number"), paste(x, "negative number"))
#exercise
x<- c(7, 22,2)
if(mean(x)>10){
  print(paste(mean(x), "is more than 10"))
} else { print(paste(mean(x), "is less than 10"))}
#if... else if.... else if....else
#show to which quarter each month corresponds
x<-12
if(x>0 & x<4){
  print(paste("primer cuarto"))
} else if(x>=4 & x<7){
  print(paste("segundo cuarto"))
} else if(x>=7 & x<10){
  print(paste("tercer tercio"))
} else if(x>=10){
  print(paste("cuarto cuarto"))
}
#
#
#
#
nam<-readline(prompt = "enter name: ")
number<-readline(prompt = "enter a number: ")
number<-as.numeric(number)
######
###selection structures again
#####
#####
######exer. markov with our data
tab1<-read.csv("C:/Users/fotgo/Downloads/Bioinfo2020 - Hoja 1.csv")[-c(23:25),]
tab1
sum((tab1$Chocolate==1)&(tab1$Alcohol==1))/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)&(tab1$The.umbrella.academy==1))/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)&(tab1$Serie.de.Luis.Miguel==1))/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)-(tab1$CÃ³mics==1))/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)-((tab1$Edad<=21)==1))/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)-((tab1$Edad>21)==1))/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)-((tab1$Mes.de.cumpleaÃ.os<=6))==1)/sum(tab1$Chocolate==1)
sum((tab1$Chocolate==1)-((tab1$Mes.de.cumpleaÃ.os>6))==1)/sum(tab1$Chocolate==1)

sum((tab1$Alcohol==1)&(tab1$Chocolate==1))/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&(tab1$The.umbrella.academy==1))/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&(tab1$Serie.de.Luis.Miguel==1))/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&(tab1$CÃ³mics==1))/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&((tab1$Edad<=21)==1))/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&((tab1$Edad>21)==1))/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&((tab1$Mes.de.cumpleaÃ.os<=6))==1)/sum(tab1$Alcohol==1)
sum((tab1$Alcohol==1)&((tab1$Mes.de.cumpleaÃ.os>6))==1)/sum(tab1$Alcohol==1)

############
#############
###Loops
#Loop "for"
#you know beforehand the number of loops you wish to make!!!!!!!!!!!!!
#For(variable and variation range)
for(i in 1:10){
  print("Rob")#lo que quiero que se repita n veces
  print(i)
}
###########
cc<-c("ATGCA","GTACT")

sec_1<-DNAString("ATGCA")
sec_2<-DNAString("GTACT")

diff<-0

for(i in 1:5) {
  if(sec_1[i]!=sec_2[i]){
    diff<-diff+1
  }
}
diff
##########
#exercise
x<-c(1:10)
for (i in x) {
  print(paste(i^2, "is the square of", i))
  print(paste(i^3,"is the cube of", i))
  print(i)
}
###########
#############
##########
#While loops
#don't know how many loops we'll make
x<-1
while (x<5){
  x<-x+1; print(x);
}

while (x<5){
  x<-x+1; print(x)
  break(x==4)
}
###exercise
suma<-0
i<-1
while (suma<100) {
  print(suma) 
  suma<-suma + i
  i<-i+1
}
######
nam<-c("juan","Jake","tavo","luis","andrea","maría","martín","Sol")
sex<-c("h","h","h","h","m","m","h","m")
names(sex)<-nam
for (i in nam) {
  if(sex[i]=="h"){
    print(paste("hola amigo",i))
  }else print(paste("hola amiga",i))
}
i<-1
while (i<=length(nam)) {
  if(sex[i]=="h"){
    print(paste("hola amigo",nam[i]))
  }else print(paste("hola amiga",nam[i]))
  i<-i+1
}
#######
#######
#define functions
fu_1<-function(x,y){
  #here goes what the function does
  return(x+y)#return "prints" the result
}
fu_1(100,12)
##
fu_2<-function(a,b,c){
  x1<-(-b+sqrt(b^2-(4*a)*c))/(2*a)
  x2<-(-b-sqrt(b^2-(4*a)*c))/(2*a)
  return(paste(x1,x2,sep = ","))
}
fu_2(1,2,0)
##############
#####More for and while exercises 
###for
kk<-seq(10,100,10)
x<-0
for (i in kk) {
  x<-x+i
  print(x)
}  
###while
m<-0
i<-1
while (i<=length(kk)){
  m<-m+kk[i]
  i<-i+1
  print(m)
}
#
sum(kk)
####
library(ape)
library(msa)
library(seqinr)
library(Biostrings)
globin<-readAAStringSet("globinas.fasta")
flu<-readAAStringSet("flu_aasequence.fasta")
insu<-readAAStringSet("Insulinas.fasta")
#
ali_glob<-msa(globin)
ali_glob2<-msaConvert(ali_glob, type="seqinr::alignment")
dist_glob<-dist.alignment(ali_glob2)
tree_glob<-nj(dist_glob)
plot(tree_glob)
#
ali_flu<-msa(flu)
ali_flu2<-msaConvert(ali_flu, type="seqinr::alignment")
dist_flu<-dist.alignment(ali_flu2)
tree_flu<-nj(dist_flu)
plot(tree_flu)
#
ali_insu<-msa(insu)
ali_insu2<-msaConvert(ali_insu, type="seqinr::alignment")
dist_insu<-dist.alignment(ali_insu2)
tree_insu<-nj(dist_insu)
plot(tree_insu)

#####
#####
library(ggtree)
library(ggimage)
library(phytools)
tree_globs<-read.tree("tree_glob.nwk")
ggtree(tree_globs, branch.length = T,layout = "rectangular")+
  geom_label2(aes(subset=!isTip, label=node))+
  geom_cladelabel(18, "one", offset=2, barsize=2, angle=90, offset.text=.1, 
                  hjust=0.5, fontsize=6)+
  geom_cladelabel(16, "two", offset=2, barsize=2, angle=90, offset.text=.1, 
                  hjust=0.5, fontsize=6)+
  geom_cladelabel(20, "three", offset=2, barsize=2, angle=90, offset.text=.1, 
                  hjust=0.5, fontsize=6)+
  geom_cladelabel(7, "idk", offset=2, barsize=2, angle=90, offset.text=.1, 
                  hjust=0.5, fontsize=6)+
  geom_hilight(node=20, fill="darkgreen", alpha=0.5)+
  geom_hilight(node=14, fill="yellow", alpha=0.5)+
  geom_tiplab(size=3, color="red")
  

