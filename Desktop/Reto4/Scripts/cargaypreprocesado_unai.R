#df
library(odbc)
conexion<-dbConnect(odbc(),"prueba")
#Mostrar tablas BD
dbListTables(conexion)
dbListFields(conexion,"furniture")

library(odbc)

conexion<-dbConnect(odbc(),"conexionIKEA")
#Mostrar tablas BD
dbListTables(conexion)
dbListFields(conexion,"furniture")

#consultas
#Forma 1
consulta1<-dbGetQuery(conexion,"Select count(*) from furniture" )

consulta1
class(consulta1)


#Forma 2
consulta2<-dbSendQuery(conexion,"Select count(*) from furniture")
primeros10<-dbFetch(consulta2,n=10)
demas<-dbFetch(consulta2)
º