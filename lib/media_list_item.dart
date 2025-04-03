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
          Container(
              child: Stack(children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: "assets/placeholder.jpg",
              image: media.getBackDropUrl(),
              fit: BoxFit.cover,
              fadeInDuration: new Duration(milliseconds: 40),
              height: 200.0,
              width: double.infinity,
            ),
            Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[900]?.withOpacity(0.5),
                  ),
                  constraints: new BoxConstraints.expand(
                    height: 55.0,
                  ),
                )),
          ]))
        ],
      ),
    );
  }
}
