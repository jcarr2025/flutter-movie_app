import 'package:flutter/material.dart';
import 'package:s15v189movie_app/common/httpHandler.dart';
import 'model/Media.dart';

class MediaListx extends StatefulWidget {
  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaListx> {
  List<Media> _media = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchPopularMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Image.network(_media[index].getPosterUrl())
            ],
          );
        },
        itemCount: _media.length,
      ),
    );
  }
}
