#* @apiTitle  Tutorial de Plumber API
#* @apiDescription  En esta api creada apartir de la libreria

#* Eco del input
#* @param msg  El mensaje que vamos a repetir
#* @get /echo

function(msg=""){
  list(msg=paste0("El mensaje es :", msg))
}

#* Histograma distribucion normalç
#* @serializer png
#* @get /plot

function(){
  mrand<-rnorm(100)
  hist(mrand)
}

#* Suma de dos parametros
#* @param a el primer numero
#* @param b el segundo numero
#* @post /sum

function(a,b){
  a<- as.numeric(a)
  b<-as.numeric(b)
  list(a=a,
       b=b,
       output=a+b)
}

#* ejemplo serializacion csv
#* @serializer csv
#* @param n numero de filas
#* @get /data

function(n=""){
  head(iris, as.numeric(n))
}
