import 'package:flutter/material.dart';
import 'package:music_flutter/data/album.dart';
import 'package:music_flutter/data/http_helper.dart';

class Home extends StatefulWidget {

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Album>? albums; 
  HttpHelper? httpHelper;

  Future initialize() async {
    albums = List.empty();
    albums =  await httpHelper?.getAlbums();
    setState(() {
      albums = albums;
    });
  }

  @override
  void initState() async {
    httpHelper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I miss her'),
      ),
      body: ListView.builder(
        itemCount: albums?.length,
        itemBuilder: (context,index) {
          return Card(
            child: ListTile(
              title: Text(albums![index].name!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(albums![index].artirst!),
                  Text(albums![index].yearReleased!)
                ]),
              leading: Image(image: NetworkImage(albums![index].urlPoster!))
            ),
          );
        }
        ),
    );
  }
}