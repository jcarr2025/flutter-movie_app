import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      drawer: new Drawer(),
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
