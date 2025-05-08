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
  Widget _builderCast( BuildContext ctx, int index) {
    var cast = _casts[index];
    return Padding(
        padding: const EdgeInsets.only(
          right: 16.0,
        ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: new NetworkImage(cast.getCastUrl()) ,
          )
        ],
      ),
    );

  }
  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:<Widget>[
        SizedBox.fromSize(
          size: Size.fromHeight(180.0),
          child: ListView.builder(
              itemCount: _casts.length,
              scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 20.0,
            ),
            itemBuilder: _builderCast,
          ),
        ),
      ]
    );
  }
}
