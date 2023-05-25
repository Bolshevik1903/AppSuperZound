import 'package:flutter/material.dart';
import 'package:music_flutter/data/album.dart';
import 'package:music_flutter/data/http_helper.dart';
import 'package:music_flutter/data/track.dart';

class TrackList extends StatefulWidget {
  const TrackList({super.key, required this.album});
  final Album album;

  @override
  State<StatefulWidget> createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  HttpHelper? httpHelper;
  List<Track>? tracks;

  Future initialize() async {
    tracks = List.empty();
    tracks = await httpHelper?.getTracksByAlbumId(widget.album.id!);
    setState(() {
      tracks = tracks;
    });
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: tracks?.length,
          itemBuilder: (context, index) {
            return TrackItem(tracks![index]);
          }),
    );
  }
}

class TrackItem extends StatefulWidget {
  const TrackItem({super.key, required this.track});
  final Track track;

  @override
  State<TrackItem> createState() => _TrackItemtate();
}

class _TrackItemtate {}
