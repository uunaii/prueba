library(lubridate)
estadistica <- read.csv("./DatosTransformados/df.csv", sep=",", header = T)
estadistica$X <- NULL

str(estadistica)
dim(estadistica)
summary(estadistica)
colnames(estadistica)


# ANALISIS DE OUTLIERS MEDIANTE BOXPLOTS

boxplot(estadistica$Sales) 
boxplot(estadistica$profit)
boxplot(estadistica$Qty)
boxplot(estadistica$transaction_timestamp)  #Es character, lo cambiamos a formato fecha para que funcione
estadistica$transaction_timestamp<- ymd_hms(estadistica$transaction_timestamp)
boxplot(estadistica$transaction_timestamp) #Las transaciones de dividen mucho durante los dias, por eso no hay outliers
summary(estadistica$transaction_timestamp)

# EN AQUELLAS EN LAS QUE SI HAY OUTLIERS... --> Test Shapiro-Wilk y Rosner

boxplot(estadistica$Sales)
boxplot.stats(estadistica$Sales)$out
#

boxplot(estadistica$profit)
boxplot.stats(estadistica$profit)$out
#

boxplot(estadistica$Qty)
boxplot.stats(estadistica$Qty)$out
#




#SABER SI LA VARIABLE ES DE DISTRIBUCION NORMAL

library(nortest)
lillie.test(nums$Sales)   # p-value < 2.2e-16, NO ES DISTRIBUCION NORMAL
lillie.test(nums$profit)   # p-value < 2.2e-16, NO ES DISTRIBUCION NORMAL
lillie.test(nums$Qty)   # p-value < 2.2e-16, NO ES DISTRIBUCION NORMAL

#Como no es Distrucion Normal no es razonable hacer los test, 
#entonces hacemos boxplot:
boxplot(estadistica$Sales)
boxplot.stats(estadistica$Sales)$out
#
boxplot(estadistica$profit)
boxplot.stats(estadistica$profit)$out
#
boxplot(estadistica$Qty)
boxplot.stats(estadistica$Qty)$out
####
boxplotquality<-ggplot(estadistica, aes(y=Sales))
boxplotquality+geom_boxplot(aes(fill=Sales, color="black"))
boxplot.stats(estadistica$Sales) 

boxplotquality<-ggplot(estadistica, aes(y=profit))
boxplotquality+geom_boxplot(aes(fill=profit, color="black"))
boxplot.stats(estadistica$profit) 

library(ggplot2)
boxplotquality<-ggplot(estadistica, aes(y=Qty))
boxplotquality+geom_boxplot(aes(fill=Qty, color="black"))
boxplot.stats(estadistica$Qty) 

#eliminar outliers
outliers<-estadistica
names(outliers)

outliers<-outliers %>% filter(Sales<3000)
boxplot(outliers$Sales)
boxplot.stats(outliers$Sales)$out
#
outliers<-outliers %>% filter(Qty<300)
boxplot(outliers$Qty)
boxplot.stats(outliers$Qty)$out
#
outliers<-outliers%>% filter(profit< 180000)
boxplot(outliers$profit)
boxplot.stats(outliers$profit)$out