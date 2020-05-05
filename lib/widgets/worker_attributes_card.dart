import 'package:flutter/material.dart';

import '../models/worker.dart';

class WorkerAttributesCard extends StatelessWidget {
  final Worker worker;
  const WorkerAttributesCard({Key key, this.worker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: Colors.black),
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(65),
            1: FixedColumnWidth(20),
            2: FixedColumnWidth(30),
          },
          children: [
            TableRow(children: [
              Text('Focus'),
              Text(worker.focus.toString()),
              Text('(+' + worker.focusTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Perception'),
              Text(worker.perception.toString()),
              Text('(+' + worker.perceptionTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Loyalty'),
              Text(worker.loyalty.toString()),
              Text('(+' + worker.loyaltyTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Strength'),
              Text(worker.strength.toString()),
              Text('(+' + worker.strengthTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Toughness'),
              Text(worker.constitution.toString()),
              Text('(+' + worker.constitutionTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Cunning'),
              Text(worker.cunning.toString()),
              Text('(+' + worker.cunningTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Intelligence'),
              Text(worker.intelligence.toString()),
              Text('(+' + worker.intelligenceTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Spirit'),
              Text(worker.spirit.toString()),
              Text('(+' + worker.spiritTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Dexterity'),
              Text(worker.dexterity.toString()),
              Text('(+' + worker.dexterityTemp.toString() + ')'),
            ]),
            TableRow(children: [
              Text('Health'),
              Text(worker.health.toString()),
              Text('/ ' + worker.healthMax.toString()),
            ]),
          ],
        ),
      ),
    );
  }
}
