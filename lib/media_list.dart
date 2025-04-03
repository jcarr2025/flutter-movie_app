import 'package:flutter/material.dart';
import 'package:s15v189movie_app/common/httpHandler.dart';
import 'package:s15v189movie_app/media_list_item.dart';
import 'model/Media.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
              return new MediaListItem(media: _media[index] );
        },
        itemCount: _media.length,
      ),
    );
  }
}
