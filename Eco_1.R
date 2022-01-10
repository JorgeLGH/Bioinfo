eco_data<-read.csv("C:/Users/fotgo/OneDrive/Documentos/Try_eco_2.csv")
eco_data
names(eco_data)

ass<-eco_data[,c(1:3,7)]
ass

ggplot(ass, aes(x=Tiempo, group=1)) + 
  geom_line(aes(y = P_a), color = "darkred", size=2) + 
  geom_line(aes(y = S_a), color="steelblue", size=2)+
  geom_line(aes(y = T_a), color = "green", size=2)+
  geom_point(aes(y = P_a), color = "darkred", size=5)+
  geom_point(aes(y = S_a), color="steelblue", size=5)+
  geom_point(aes(y = T_a), color = "green", size=5)+
  xlab("Generación")+
  ylab("Individuos")+
  ggtitle("Reproducción asexual")+
  theme(   
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))

eco_data2<-read.csv("C:/Users/fotgo/OneDrive/Documentos/Try_eco_3.csv")
eco_data2
names(eco_data2)

P_ss<-eco_data2[1:16,]
P_ss
ggplot(P_ss, aes(x=Tiempo, y=Individuos, fill=Sexo))+
  geom_bar(stat="identity", position = "dodge")+
  xlab("Generación")+
  ylab("Individuos")+
  ggtitle("Reproducción sexual Crecimiento Explosivo")+
  theme(   
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))

S_ss<-eco_data2[17:32,]
S_ss
ggplot(S_ss, aes(x=Tiempo, y=Individuos, fill=Sexo))+
  geom_bar(stat="identity", position = "dodge")+
  xlab("Generación")+
  ylab("Individuos")+
  ggtitle("Reproducción sexual Juego de la Permanencia")+
  theme(   
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))

T_ss<-eco_data2[33:48,]
T_ss
ggplot(T_ss, aes(x=Tiempo, y=Individuos, fill=Sexo))+
  geom_bar(stat="identity", position = "dodge")+
  xlab("Generación")+
  ylab("Individuos")+
  ggtitle("Reproducción sexual Juego de la Extinción")+
  theme(   
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))

ggplot(eco_data2, aes(x=Tiempo, y=Individuos, fill= Sexo))+
  geom_bar(stat="identity", position = "dodge")+
  facet_wrap(~Experimento)+
  xlab("Generación")+
  ylab("Individuos")+
  ggtitle("Reproducción sexual")+
  theme(   
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"))

x4 <- sample(-10:10, 14, replace=F)
x4

