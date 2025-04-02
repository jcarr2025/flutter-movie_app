import 'package:flutter/material.dart';
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
              trailing: new Icon( Icons.local_movies  ) ,
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Television'),
              trailing: new Icon( Icons.live_tv  ) ,
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
        children: <Widget>[
          new MediaList()

        ],
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
}
