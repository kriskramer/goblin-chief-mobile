import 'package:flutter/material.dart';

import 'package:goblin_chief/models/inventory.dart';
import 'package:goblin_chief/widgets/top_display.dart';
import 'package:provider/provider.dart';


class BuilderList extends StatefulWidget {
  @override
  _BuilderListState createState() => _BuilderListState();
}

class _BuilderListState extends State<BuilderList> {
  @override
  Widget build(BuildContext context) {
    final inventory = Provider.of<Inventory>(context);

    return TopDisplay(inventory: inventory);
  }
}
