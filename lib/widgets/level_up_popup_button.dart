import 'package:flutter/material.dart';

import 'package:goblin_chief/models/worker.dart';

class LevelUpPopupButton extends StatelessWidget {
  const LevelUpPopupButton({
    Key key,
    @required this.worker,
  }) : super(key: key);

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Task Select popup button
      width: 25,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: () async {
          _showLevelUpPopup(context, worker);
        },
        child: Icon(
          Icons.star,
          color: worker.skillPoint > 0 ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }
}

Future<void> _showLevelUpPopup(BuildContext context, Worker worker) {
//  final worker = Provider.of<Worker>(context);
  if (worker.skillPoint == 0) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Level up for ' + worker.name),
          content: Column(
            children: <Widget>[
              Text(
                  'Select an attribute to level up. Click the plus icon next to an attribute to add one point for each skill point earned.',
                  style: TextStyle(
                    fontSize: 12,
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                  worker.name + ' has ' + worker.skillPoint.toString() + ' skill points.',
                  style: TextStyle(
                    fontSize: 14,
                  )),
              SizedBox(
                height: 15,
              ),
              DefaultTextStyle(
                style: TextStyle(fontSize: 14, color: Colors.black),
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(95),
                    1: FixedColumnWidth(25),
                    2: FixedColumnWidth(35),
                  },
                  children: [
                    TableRow(children: [
                      Text('Focus'),
                      Text(worker.focus.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Perception'),
                      Text(worker.perception.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Loyalty'),
                      Text(worker.loyalty.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Strength'),
                      Text(worker.strength.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Toughness'),
                      Text(worker.constitution.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Cunning'),
                      Text(worker.cunning.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Intelligence'),
                      Text(worker.intelligence.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Spirit'),
                      Text(worker.spirit.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
                      ),
                    ]),
                    TableRow(children: [
                      Text('Dexterity'),
                      Text(worker.dexterity.toString()),
                      Container(
                        width: 20,
                        child: worker.skillPoint > 0 ? FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ) : null,
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
  } else {
    return null;
  }
}
