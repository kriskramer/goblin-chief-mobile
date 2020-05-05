import 'package:flutter/foundation.dart';
import 'package:goblin_chief/models/inventory.dart';
import 'package:goblin_chief/models/worker.dart';

class WorkerList with ChangeNotifier {
  List<Worker> _workers = [];
  Inventory inventory;

  WorkerList(Inventory inv) {
    inventory = inv;
    _workers.add(new Worker(1, inventory));
    _workers.add(new Worker(2, inventory));
    _workers.add(new Worker(3, inventory));
  }

  List<Worker> get allWorkers {
    return [..._workers];
  }

  List<Worker> get allGrunts {
    return [..._workers.where((w) => w.workerType == WorkerType.Grunt)];
  }

  List<Worker> get allBuilders {
    return [..._workers.where((w) => w.workerType == WorkerType.Builder)];
  }

  Worker findById(int id) {
    return _workers.firstWhere((w) => w.id == id);
  }

  void addWorker(int id) {
    _workers.add(new Worker(id, inventory));
    notifyListeners();
  }
}

