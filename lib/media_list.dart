import 'package:flutter/material.dart';
import 'package:s15v189movie_app/common/MediaProvider.dart';
import 'package:s15v189movie_app/resources/api_provider.dart';
import 'package:s15v189movie_app/media_list_item.dart';
import 'media_detail.dart';
import 'model/Media.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category;

  MediaList(this.provider, this.category);

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

  @override
  void didUpdateWidget(MediaList oldWidget) {
    print("...........estoy en  el evento  didUpdateWidget--------->>>>>>>>>>>>>>" );
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = [];
      loadMovies();
    }
    print(oldWidget);

    super.didUpdateWidget(oldWidget);
  }



  void loadMovies() async {
    var media = await widget.provider.fetchMedia( widget.category);
    setState(() {
      _media.addAll(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new ElevatedButton(
            child:new MediaListItem(media: _media[index]),

            onPressed: (){
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new MediaDetail(_media[index], widget.provider),
                ),
              );
            },
          );
        },
        itemCount: _media.length,
      ),
    );
  }
}
