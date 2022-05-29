#* @apiTitle   API GOOGLE TRENDS
#* @apiDescription  En esta api creada apartir de la libreria "gogle trends"
#* se hara un jajsj


#* Eco del input
#* @param keyword Palabra clave a buscar
#* @param geo  El pais
#* @param  time La hora
#* @get /dataset 

function(keyword ="", geo="", time=""){
  datos <- gtrends(keyword , 
                   geo  , time)
  list(head(datos$interest_over_time))
}


datos <- gtrends(keyword = "estres", 
                 geo = "MX")
head(datos$interest_by_city)

