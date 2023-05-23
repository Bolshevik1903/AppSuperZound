class Album {
  String? id;
  String? name;
  String? artirst;
  String? yearReleased;
  String? urlPoster;

  Album(
    {
    required this.id, 
    required this.name, 
    required this.artirst, 
    required this.yearReleased, 
    required this.urlPoster,
     });
     
     Album.fromJson(Map<String, dynamic> json) {
      id = json['idAlbum'];
      name = json['strAlbum'];
      artirst = json['strArtist'];
      yearReleased = json['intYearReleased'];
      urlPoster = json['strAlbumthumb'];
     }
}