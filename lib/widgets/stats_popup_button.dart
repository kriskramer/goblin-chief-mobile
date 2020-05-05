import 'package:flutter/material.dart';

import 'package:goblin_chief/models/inventory.dart';
import 'package:goblin_chief/models/worker.dart';


class StatsPopupButton extends StatelessWidget {
  const StatsPopupButton({
    Key key,
    @required this.worker,
  }) : super(key: key);

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    return Container(  // Stats popup button
      width: 25,
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(0),
        onPressed: () async {
          _showStatsPopup(context, worker);
        },
        child: Icon(
          Icons.poll,
          color: Colors.blue[300],
        ),
      ),
    );
  }
}

Future<void> _showStatsPopup(BuildContext context, Worker worker) {
//  final worker = Provider.of<Worker>(context);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Statistics for ' + worker.name),
        content: Column(
          children: <Widget>[
            Text(worker.name + ' has been ' + worker.getTaskString() + ' for ' + worker.ticksSinceStartWork.toString() + ' hours.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text('Total gathered:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            DefaultTextStyle(
              style: TextStyle(fontSize: 12, color: Colors.black),
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(20),
                  1: FixedColumnWidth(125),
                  2: FixedColumnWidth(30),
                },
                children: [
                  TableRow(children: [
                    Text(' '),
                    Text(
                      'Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                        'Qty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Food'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Food.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Shinies'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Shiny.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Sticks'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Stick.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Rocks'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Rock.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Straw'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Straw.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Clay'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Clay.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Ore'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Ore1.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Herbs'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Herb.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Furs'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Fur.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Bones'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Bone.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Entrails'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Entrails.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Blood'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Blood.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Teeth'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Teeth.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Spores'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Spore.index]
                          .toString()),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Total crafted:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            DefaultTextStyle(
              style: TextStyle(fontSize: 12, color: Colors.black),
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(20),
                  1: FixedColumnWidth(125),
                  2: FixedColumnWidth(30),
                },
                children: [
                  TableRow(children: [
                    Text(' '),
                    Text(
                      'Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                        'Qty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Rough Tools'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Tool1.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Decent Tools'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Tool2.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Good Tools'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Tool3.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Rough Weapons'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Weapon1.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Decent Weapons'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Weapon2.index]
                          .toString()),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                        ''), // Will eventually be an icon for the specific item
                    Text('Good Weapons'),
                    Center(
                      child: Text(worker
                          .totalGathered[InventoryItemEnum.Weapon3.index]
                          .toString()),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
