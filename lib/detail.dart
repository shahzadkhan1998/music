import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Details extends StatefulWidget {
  final songname;
  final artistname;
  final image;
  final count;
  final SongUrl;

  Details(
      {Key? key,
      this.songname,
      this.artistname,
      this.image,
      this.count,
      this.SongUrl})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    print(widget.toString());
    print(widget.artistname.toString());
    print(widget.image.toString());
    print(widget.count.toString());
    print(widget.SongUrl.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridTileBar(
              title: Text(widget.songname),
              subtitle: Text(widget.artistname),
              backgroundColor: Colors.black45,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () async {},
              ),
            ),
            //////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
