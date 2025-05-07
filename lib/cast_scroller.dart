import 'package:flutter/material.dart';
import 'package:s15v189movie_app/common/MediaProvider.dart';
class CastController extends StatefulWidget {
  final MediaProvider provider;
  final   int mediaId;
  const CastController( this.provider,  this.mediaId) ;



  @override
  State<CastController> createState() => _CastControllerState();
}

class _CastControllerState extends State<CastController> {
  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}
