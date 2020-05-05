import 'package:flutter/cupertino.dart';

import './worker_list.dart';
import './inventory.dart';

class GameWorld with ChangeNotifier {
  Inventory inventory;
  WorkerList workerList;

  int currentDay = 0;
  int currentTime = 0;


  GameWorld({this.inventory, this.workerList}) {
    currentDay = 0;
    currentTime = 0;

    // TODO: Start world timer to cound down days and time

    
  }
}