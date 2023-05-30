import 'package:flutter/material.dart';
import 'package:music_flutter/data/database_helper.dart';
import 'package:music_flutter/ui/home.dart';

import '../data/album.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  DbHelper? dbHelper;
  List<Album>? albums;
  
  loadAlbums() async {
    await dbHelper?.openDb();
    final result = await dbHelper?.fetchAllAlbum();
    setState(() {
      albums = result;
    });
  }

  @override
  void initState() {
    albums = List.empty();
    dbHelper = DbHelper();
    loadAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: albums?.length, 
        itemBuilder: (context, index) {
          return AlbumItem(album: albums![index]);
        }),
    );
  }
}