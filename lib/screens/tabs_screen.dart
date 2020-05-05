import 'package:flutter/material.dart';

import './workers_screen.dart';
import './beyond_screen.dart';
import './cave_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen();

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    _pages = [
      {
        'page': WorkersScreen(),
        'title': 'Workers',
      },
      {
        'page': CaveScreen(),
        'title': 'Cave',
      },
      {
        'page': BeyondScreen(),
        'title': 'Beyond',
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedPageIndex]['title']),
      // ),
      //drawer: MainDrawer(),
      body: PageStorage(child: _pages[_selectedPageIndex]['page'], bucket: bucket),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.people),
            title: Text('Workers'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.check_box_outline_blank),
            title: Text('Cave'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.directions_walk),
            title: Text('Beyond'),
          ),
        ],
      ),
    );
  }
}
