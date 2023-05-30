library(spotidy)

SPOTIFY_CLIENT_ID <-"79ba4f46f96048509889804d6ae01f8c"
SPOTIFY_CLIENT_SECRET <- "840aa37dd39a4b01a3d388f4d61ec931"
my_token <- get_spotify_api_token(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)

#2.	Con el paquete spotidy realiza una consulta para seleccionar los 10 artistas 
#que han hecho las colaboraciones más populares con Rosalía. De dichos artistas, 
#selecciona las canciones en las que no colaboran con ningún artista adicional y 
#quédate con la de publicación más reciente (2).

rosalia<-search_artists(
  'rosalia',
  output = c("tidy", "raw", "id"),
  limit = 20,
  offset = 0,
  token = my_token
)

library(dplyr)

id_rosalia<-rosalia[1,2]

colaboraciones<-get_artist_related_artists(
  id_rosalia,
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token
)

colab_popu<-colaboraciones%>%
  select(related_artist_id,popularity)%>%
  arrange(desc(popularity))

artistas10<-colab_popu[1:10,1]

#primero
art1<-get_artist_top_tracks(
  artistas10[1],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art1_can<-art1%>%
  filter(artist_id==artistas10[1])%>%
  arrange(desc(release_date))
can_art1<-art1_can[1,]

#segundo
art2<-get_artist_top_tracks(
  artistas10[2],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art2_can<-art2%>%
  filter(artist_id==artistas10[2])%>%
  arrange(desc(release_date))
can_art2<-art2_can[1,]

#tercero
art3<-get_artist_top_tracks(
  artistas10[3],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art3_can<-art3%>%
  filter(artist_id==artistas10[3])%>%
  arrange(desc(release_date))
can_art3<-art3_can[1,]

#cuarto
art4<-get_artist_top_tracks(
  artistas10[4],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art4_can<-art4%>%
  filter(artist_id==artistas10[4])%>%
  arrange(desc(release_date))
can_art4<-art4_can[1,]

#quinto
art5<-get_artist_top_tracks(
  artistas10[5],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art5_can<-art5%>%
  filter(artist_id==artistas10[5])%>%
  arrange(desc(release_date))
can_art5<-art5_can[1,]

#sexto
art6<-get_artist_top_tracks(
  artistas10[6],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art6_can<-art6%>%
  filter(artist_id==artistas10[6])%>%
  arrange(desc(release_date))
can_art6<-art6_can[1,]

#septimo
art7<-get_artist_top_tracks(
  artistas10[7],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art7_can<-art7%>%
  filter(artist_id==artistas10[7])%>%
  arrange(desc(release_date))
can_art7<-art7_can[1,]

#octovo
art8<-get_artist_top_tracks(
  artistas10[8],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art8_can<-art8%>%
  filter(artist_id==artistas10[8])%>%
  arrange(desc(release_date))
can_art8<-art8_can[1,]

#noveno
art9<-get_artist_top_tracks(
  artistas10[9],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art9_can<-art9%>%
  filter(artist_id==artistas10[9])%>%
  arrange(desc(release_date))
can_art9<-art9_can[1,]

#decimo
art10<-get_artist_top_tracks(
  artistas10[10],
  'ES',
  output = c("tidy", "raw"),
  limit = 20,
  offset = 0,
  token = my_token)

art10_can<-art10%>%
  filter(artist_id==artistas10[10])%>%
  arrange(desc(release_date))
can_art10<-art10_can[1,]


canciones_recientes_10_artistas<-rbind(can_art1,can_art2,can_art3,can_art4,can_art5,can_art6,can_art7,can_art8,can_art9,can_art10)
