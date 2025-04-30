import 'package:flutter/material.dart';
import 'package:s15v189movie_app/model/Media.dart';
class MediaDetail extends StatelessWidget {
  final Media media;
  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,

          )
        ],
      ),
    );
  }
}
