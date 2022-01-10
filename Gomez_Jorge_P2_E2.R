library(Biostrings)
sec_1<-DNAString("ATGCA")
sec_2<-DNAString("GTACT")
#number of total mismatches
5-sum((sec_1[1]==sec_2[1])+(sec_1[2]==sec_2[2])+(sec_1[3]==sec_2[3])+
        (sec_1[4]==sec_2[4])+(sec_1[5]==sec_2[5]))#5 is the total, so minus the ones that match (trues), the mismatches are the ones that are left
#Sé que no es eficiente en lo más mínimo, pero a diferencia de mi cerebro en este momento, el código funciona
#
#Otro modo a ver si puedo hacerlo más eficiente ggg
kk<-DNAStringSet(c("ATGCA","GTACT"))
kk
names(kk)<-c("se_1","se_2")
zc<-c("ATGCA")
zd<-c("GTACT")
msa(kk)
mm<-msaConsensusSequence(msa(kk))
mm%in%zc
####################################
#####################################
##################################
#Corrección del examen
cc<-c("A","T","G","C","G")
ll<-c("T","G","C","C","G")
sum(ll==cc)
