#* @apiTitle API SPOTYFY Rstudio
#* @apiDescription  En esta api creada apartir de la libreria spotyidy buscaremos artistas


#* Cantate
#* @param artista  Cantante
#* @get /data
function(artista=""){
  search_artists(
    artista,
    output = c("tidy"),
    limit = 20,
    offset = 0,
    token = my_token
  )
}
  