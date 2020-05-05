import 'package:flutter/material.dart';
import 'package:goblin_chief/models/game_world.dart';
import 'package:goblin_chief/models/inventory.dart';
import 'package:provider/provider.dart';

import 'package:goblin_chief/screens/beyond_screen.dart';
import 'package:goblin_chief/screens/cave_screen.dart';
import 'package:goblin_chief/screens/tabs_screen.dart';
import 'package:goblin_chief/screens/workers_screen.dart';
import 'package:goblin_chief/models/worker_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Inventory inventory = Inventory();
    final WorkerList workers = WorkerList(inventory);
    final GameWorld gameWorld = GameWorld(inventory: inventory, workerList: workers);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: workers),
        ChangeNotifierProvider.value(value: inventory),
        ChangeNotifierProvider.value(value: gameWorld),
      ],
      child: MaterialApp(
          title: 'Goblin Chief',
          theme: ThemeData(
              primarySwatch: Colors.green,
              accentColor: Colors.orange,
              canvasColor: Color.fromRGBO(255, 254, 229, 1),
              textTheme: ThemeData.light().textTheme.copyWith(
                    body1: TextStyle(
                      color: Color.fromRGBO(20, 51, 51, 1),
                    ),
                    body2: TextStyle(
                      color: Color.fromRGBO(20, 51, 51, 1),
                    ),
                    title: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
          initialRoute: '/',
          routes: {
            '/': (ctx) => TabsScreen(),
            '/workers': (ctx) => WorkersScreen(),
            '/cave': (ctx) => CaveScreen(),
            '/beyond': (ctx) => BeyondScreen(),
          }),
    );
  }
}
