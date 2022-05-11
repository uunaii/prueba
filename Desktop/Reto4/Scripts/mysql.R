#install.packages("odbc")
#install.packages("DBI")
#install.packages("RSQLite")
#install.packages("sqldf")
#Mostrar tablas BD
conexion<-dbConnect(odbc(),"conexionIKEA")
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
