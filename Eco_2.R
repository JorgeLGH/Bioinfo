Letras<- c("A","B","C","D","E","F")
Datos<- c(0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,1,1,
          1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,
          0,1,1,1,0,0,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,1,0,1)
matrix(cbind(Letras,Datos),ncol= 12)

Let<-as.data.frame(Letras)
md<-matrix(Datos, ncol=12)
as.matrix(cbind(Let, md))
yas<-as.data.frame(cbind(Let, md))
yas

dis<-dist(yas[,2:13], method = "euclidean")
pp<-hclust(dis, method = "average")

plot(pp, label=yas$Letras)
