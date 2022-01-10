nom<-c("Liz","Parker","Jorge")

for (i in nom) {
  
  fecha<-readline(prompt=paste(i,"Dime el número de tu mes de nacimiento "))
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
  
  fecha<-readline(prompt=paste(i,"Dime el número de tu mes de nacimiento "))
  fecha<-as.numeric(fecha)
}
