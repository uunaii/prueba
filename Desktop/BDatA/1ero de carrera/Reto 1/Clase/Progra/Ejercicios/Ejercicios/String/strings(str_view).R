################String################
library(stringr)
#Las expresiones regulares representan patrones de caracteres
x <- c("manzana.", ".banana", "per.a", "europomelo")
str_view(x,"an")
str_view(x, ".o.") #buscar una o que tenga algo por alante y algo por astras
str_view(x,"\\.") ##desactivar la funcion de . con // y entonces busca el punto
str_view(x,"^\\.") #posicion del patron ^ al principio
str_view(x,"\\.$") ##posicion del patron a final
##conjuntos de caracteres
z<-c("123manzana.",".Banana","1per.a","Pomelo")
str_view(z,"[:digit:]") ##buscame algun elemento que sea digito
str_view(z,"[:0-9:{3}]")
str_view(z,"[:lower:]")  ###minuscula
str_view(z,"[:upper:]")
str_view(z,"[:alpha:]")#mayuscula y minuscula
str_view(z,"[:alpha:]")

str_view(x,"\\.$")
str_view(x,"\\.{3}")º
