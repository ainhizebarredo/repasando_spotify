x<-function(artista_nombre=""){
  artista<-search_artists(
    artista_nombre,
    output = c("tidy", "raw", "id"),
    limit = 20,
    offset = 0,
    token = my_token
  )
  id_artista<-artista[1,2]
  colaboraciones<-get_artist_related_artists(
    id_artista,
    output = c("tidy", "raw"),
    limit = 20,
    offset = 0,
    token = my_token
  )
  colab_popu<-colaboraciones%>%
    select(related_artist_id,popularity)%>%
    arrange(desc(popularity))
  colab_maspopu<-colab_popu[1,1]
  
  cancione<-get_artist_top_tracks(
    colab_maspopu,
    'ES',
    output = c("tidy", "raw"),
    limit = 20,
    offset = 0,
    token = my_token)
  can_mas_fam<-cancione%>%
    arrange(desc(popularity))
  
  can_mas_fam<-can_mas_fam[1,]
  
  paste0('La canción ',can_mas_fam$track,' del cantante ', can_mas_fam$artist_name,' tiene una popularidad de ', can_mas_fam$popularity,' Este artista se hizo muy famoso por colaborar con ', artista_nombre)
}
x('Omar Montes')
