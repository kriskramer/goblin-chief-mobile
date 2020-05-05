import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:goblin_chief/widgets/grunt_list.dart';
import 'package:goblin_chief/widgets/top_display.dart';
import 'package:goblin_chief/models/inventory.dart';

class WorkersScreen extends StatefulWidget {
  @override
  _WorkersScreenState createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  @override
  Widget build(BuildContext context) {
    final inventory = Provider.of<Inventory>(context);

    return Column(
      children: <Widget>[
        TopDisplay(
          inventory: inventory,
        ),
        Expanded(
          child: GruntList(),
        ),
      ],
    );
  }
}
