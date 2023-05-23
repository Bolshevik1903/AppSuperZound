import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:music_flutter/data/album.dart';

class HttpHelper {
  final String urlBase = 'https://theaudiodb.com/api/v1/json/523532/mostloved.php?format=album';

  Future<List<Album>?> getAlbums() async{
    http.Response response = await http.get(Uri.parse(urlBase));

    if(response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> albumsMap = jsonResponse['loved'];  
      final List<Album> albums = albumsMap.map((map) => Album.fromJson(map)).toList();
      return albums;
    } else {
      return null;
    }
  }
}