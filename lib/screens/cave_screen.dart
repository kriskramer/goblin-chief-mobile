import 'package:flutter/material.dart';
import 'package:goblin_chief/widgets/inventory_display.dart';

class CaveScreen extends StatefulWidget {
  @override
  _CaveScreenState createState() => _CaveScreenState();
}

class _CaveScreenState extends State<CaveScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Stuff',
                ),
                Tab(
                  text: 'Build',
                ),
                Tab(
                  text: 'Trophies',
                ),
                Tab(
                  text: 'Altar',
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: TabBarView(
            children: <Widget>[
              InventoryDisplay(),
              Center(
                child: Text('Workbenches'),
              ),
              Center(
                child: Text('Trophies'),
              ),
              Center(
                child: Text('Alter and stuff'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}