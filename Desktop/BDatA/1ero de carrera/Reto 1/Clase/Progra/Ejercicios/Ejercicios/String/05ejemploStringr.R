#crear primer data frame
employee <- c('Johnn Doe','Peter Gynn','Jolie Hope')
salary <- c(21000, 23400, 26800)
 startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))
 employ.data1 <- data.frame(employee, salary, startdate)
 str(employ.data1)
 head(employ.data1)
 employ.data1 <- data.frame(employee, salary, startdate, stringsAsFactors=FALSE)
 #crear segundo data frame
 employee2 <- c('Johnn Defoe','Peter Gylliam','Jolie Hopeless')
 salary2 <- c(21200, 23600, 27800)
 startdate2 <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))
 employ.data2 <- data.frame(employee2, salary2, startdate2)
 str(employ.data2)
 head(employ.data2)
 employ.data2 <- data.frame(employee2, salary2, startdate2, stringsAsFactors=FALSE)
 
 #ahora voy a cambiar el salario en data frame 1 con el salario de data frame 1
 #a todos los que se llamen igual en data frame 2
  
 
 #primero establecemos el filtro y verificamos que va bien
 indice<-substr(employ.data1$employee,1,4)==substr(employ.data2$employee2,1,4)
 indice
 #accedemos a  las columnas que se desean modificar
 
 employ.data1[indice,2]
 
 #procedemos a la asignacion
 employ.data1[indice,2] <-
    employ.data2[indice,2]
View( employ.data1)  
 