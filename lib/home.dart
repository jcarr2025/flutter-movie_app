import 'package:flutter/material.dart';
import 'package:s15v189movie_app/common/MediaProvider.dart';
import 'package:s15v189movie_app/media_list.dart';
//import 'package:s15v189movie_app/common/httpHandler.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() =>  new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
    super.initState();

  }

final MediaProvider movieProvider= new  MovieProvider();
final MediaProvider showProvider= new  MovieProvider();
MediaType mediaType= MediaType.movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Movie'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new  DrawerHeader(child: new Material()),
            new ListTile(
              title: new Text('Peliculas'),
              selected: mediaType== MediaType.movie,
              trailing: new Icon( Icons.local_movies  ) ,
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Television'),
              selected:   mediaType==MediaType.show,
              trailing: new Icon( Icons.live_tv  ) ,
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Cerrar'),
              trailing: new Icon( Icons.close  ) ,
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        )

      ),
      body: new PageView(
        children:
          _getMediaList()
        ,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up),
        label: 'Populares',
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update),
        label: 'Proximamente',
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.account_balance_sharp),
        label: 'Mejor Valoradas',
      ),
    ];
  }
   void _changeMediaType(MediaType type){
    if (mediaType!=type){
      setState(() {
        mediaType=type;
      });
    }
   }
   List<Widget> _getMediaList(){
    print("  content of mediatype: "+mediaType.toString());
    return(mediaType== MediaType.movie) ?
    <Widget>[
      new  MediaList(movieProvider)
    ]:
    <Widget>[
      new MediaList(showProvider)
    ];
   }

}
