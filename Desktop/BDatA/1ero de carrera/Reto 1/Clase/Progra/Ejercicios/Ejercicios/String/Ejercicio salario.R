#crear primer data frame
employee <- c('Johnn Doe','Peter Gynn','Jolie Hope') ##Los nombres de los empleados
salary <- c(21000, 23400, 26800) ##el salario que cobra cada uno de los empleados
 startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14')) #la fecha que empezaron a trabajar
 employ.data1 <- data.frame(employee, salary, startdate) #crea un data frame con los valores que hemo creado anteriormente mediante la funcion data.frame()
 str(employ.data1) ##aparece un resumen de las variables y el tipo de ellas
 head(employ.data1) ##muestreo del data frame que hemos creado
 employ.data2 <- data.frame(employee, salary, startdate, stringsAsFactors=FALSE)

 #crear segundo data frame
 employee2 <- c('Johnn Defoe','Peter Gylliam','Jolie Hopeless') #otro vector de trabajadores 
 salary2 <- c(21200, 23600, 27800) #el salario de cada uno de ellos
 startdate2 <- as.Date(c('2010-11-1','2008-3-25','2007-3-14')) #la fecha que empezaron a trabajar
 employ.data2 <- data.frame(employee2, salary2, startdate2) #crea un  segundo data frame con los valores que hemo creado anteriormente mediante la funcion data.frame()
 str(employ.data2) ##aparece un resumen de las variables y el tipo de ellas
 head(employ.data2)##muestreo del data frame que hemos creado
 employ.data2 <- data.frame(employee2, salary2, startdate2, stringsAsFactors=FALSE)
 
 #ahora voy a cambiar el salario en data frame 1 con el salario de data frame 1
 #a todos los que se llamen igual en data frame 2
  
 
 #primero establecemos el filtro y verificamos que va bien
 indice<-substr(employ.data1$employee,1,4)==substr(employ.data2$employee2,1,4)
 indice

 #accedemos a  las columnas que se desean modificar
 employ.data1[indice,2]
 
 #hacemos el intercambio de asignacion de los valores del segundo data frame al primero si tienen el mismo nombres
 employ.data1[indice,2] <-
    employ.data2[indice,2]
View( employ.data1)  ##nos muestra como se quedan los valores cambiados
 