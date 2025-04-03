import 'package:flutter/material.dart';

import 'model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  const MediaListItem({required this.media});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/placeholder.jpg",
            image: media.getBackDropUrl(),
            fit: BoxFit.cover,
            fadeInDuration: new Duration(milliseconds: 40),
            height: 200.0,
            width: double.infinity ,
          )
        ],
      ),
    );
  }
}
