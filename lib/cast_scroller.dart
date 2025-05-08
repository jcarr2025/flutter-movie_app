import 'package:flutter/material.dart';
import 'package:s15v189movie_app/common/MediaProvider.dart';
import 'package:s15v189movie_app/model/Cast.dart';
class CastController extends StatefulWidget {
  final MediaProvider provider;
  final   int mediaId;

  const CastController( this.provider,  this.mediaId) ;



  @override
  State<CastController> createState() => _CastControllerState();
}

class _CastControllerState extends State<CastController> {
  @override
  void initState() {
    super.initState();
    loadCast();
  }


  final List<Cast> _casts = [];
  void loadCast() async{
    var results = await widget.provider.fetchCast(widget.mediaId);
    setState(() {
      _casts.addAll(results);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}
