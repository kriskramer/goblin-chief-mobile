import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:goblin_chief/models/worker_list.dart';
import 'package:goblin_chief/widgets/worker_display_item.dart';

class GruntList extends StatefulWidget {
  @override
  _GruntListState createState() => _GruntListState();
}

class _GruntListState extends State<GruntList> {
  @override
  Widget build(BuildContext context) {
    final workerData = Provider.of<WorkerList>(context);
    //final workers = workerData.allGrunts;
    final workers = workerData.allWorkers;
    
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: workers[index],
          child: WorkerDisplayItem(),
        );
      },
      itemCount: workers.length,
    );
  }
}
