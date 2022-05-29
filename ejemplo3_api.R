library(spotidy)
SPOTIFY_CLIENT_ID <-"79ba4f46f96048509889804d6ae01f8c"
SPOTIFY_CLIENT_SECRET <- "840aa37dd39a4b01a3d388f4d61ec931"

my_token <- get_spotify_api_token(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)

#search_artist: Search artists based on given input
#devuelve DF
artist <- search_artists(
  "Michael Jackson",
)
