import 'package:flutter/material.dart';
import 'package:s15v189movie_app/model/Media.dart';
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {
  final Media media;

  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.9),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          new SingleChildScrollView(
            child: new Container(
              margin:  const EdgeInsets.all(20.0),
              child: Column(
                children:<Widget> [
                  new Container(
                    alignment: Alignment.center,
                    child: new Container(
                      width: 390.0,
                      height: 390.0,

                    ),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      image: new DecorationImage(
                          image: new NetworkImage(media.getPosterUrl()),
                      ),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                          offset: new Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}