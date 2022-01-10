nc<-readDNAStringSet("NC_001341.fna")
names(nc)<-"Acholeplasma"
yy<-readDNAStringSet("NC_001499.fna")
names(nc)<-"Acholeplasma"

trans1<-function(arglist){
  kk<-c()
  rr<-as.matrix(arglist)
  for (i in 1:(width(arglist)/3)) {
    ff<-paste(rr[i*3-2],rr[i*3-1],rr[i*3],sep = "")
    if((ff=="GGC")|(ff=="GGT")|(ff=="GGA")|(ff=="GGG")){
      kk<-c(kk,"G")
    }else if((ff=="TTT")|(ff=="TTC")){
      kk<-c(kk,"F")
    }else if((ff=="TTA")|(ff=="TTG")|(ff=="CTT")|(ff=="CTC")|(ff=="CTA")|(ff=="CTG")){
      kk<-c(kk,"L")
    }else if((ff=="TCT")|(ff=="TCC")|(ff=="TCA")|(ff=="TCG")|(ff=="AGT")|(ff=="AGC")){
      kk<-c(kk,"S")
    }else if((ff=="TAT")|(ff=="TAC")){
      kk<-c(kk,"Y")
    }else if((ff=="TGT")|(ff=="TGC")){
      kk<-c(kk,"C")
    }else if(ff=="TGG"){
      kk<-c(kk,"W")
    }else if((ff=="CCT")|(ff=="CCC")|(ff=="CCA")|(ff=="CCG")){
      kk<-c(kk,"P")
    }else if((ff=="CAT")|(ff=="CAC")){
      kk<-c(kk,"H")
    }else if((ff=="CAA")|(ff=="CAG")){
      kk<-c(kk,"Q")
    }else if((ff=="CGT")|(ff=="CGC")|(ff=="CGA")|(ff=="CGG")|(ff=="AGA")|(ff=="AGG")){
      kk<-c(kk,"R")
    }else if((ff=="ATT")|(ff=="ATC")|(ff=="ATA")){
      kk<-c(kk,"I")
    }else if((ff=="ATG")){
      kk<-c(kk,"M")
    }else if((ff=="ACT")|(ff=="ACC")|(ff=="ACA")|(ff=="ACG")){
      kk<-c(kk,"T")
    }else if((ff=="AAT")|(ff=="AAC")){
      kk<-c(kk,"N")
    }else if((ff=="AAA")|(ff=="AAG")){
      kk<-c(kk,"K")
    }else if((ff=="GTT")|(ff=="GTC")|(ff=="GTA")|(ff=="GTG")){
      kk<-c(kk,"V")
    }else if((ff=="GCT")|(ff=="GCC")|(ff=="GCA")|(ff=="GCG")){
      kk<-c(kk,"A")
    }else if((ff=="GAT")|(ff=="GAC")){
      kk<-c(kk,"D")
    }else if((ff=="GAA")|(ff=="GAG")){
      kk<-c(kk,"E")
    }else if((ff=="TAA")|(ff=="TAG")|(ff=="TGA")){
      kk<-c(kk,"*")
    }
  } 
  return(paste(kk,sep = ""))
}
trans1(nc)#only works with one sequence at a time

frq<-function(s){
  aa<-as.matrix(s)
  Ass<-0
  Tss<-0
  Gss<-0
  Css<-0
  ll<-width(s)
  mat<-matrix(ncol=4)
  colnames(mat)<-c("A","T","G","C")
  for (i in 1:width(s)){
    if(aa[i]=="A"){
      Ass<-(Ass+1)
    }else if(aa[i]=="T"){
      Tss<-(Tss+1)
    }else if(aa[i]=="G"){
      Gss<-(Gss+1)
    }else if(aa[i]=="C"){
      Css<-(Css+1)
    }
  }
  ans<-readline(prompt=paste("¿Lo quieres en porcentaje?(Y/N) "))
  if(ans=="Y"){
  frequecy_A<-(Ass/ll)
  frequecy_T<-(Tss/ll)
  frequecy_G<-(Gss/ll)
  frequecy_C<-(Css/ll)
  mat[1,c(1:4)]<-c(frequecy_A,frequecy_T,frequecy_G,frequecy_C)
  return(mat)
  }else 
  mat[1,c(1:4)]<-c(Ass,Tss,Gss,Css)
  totl<-mat
  return(totl)
}
frq(nc)

