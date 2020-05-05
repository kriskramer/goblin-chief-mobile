import 'package:flutter/material.dart';

import 'package:goblin_chief/models/worker.dart';

class LevelUpPopupButton extends StatefulWidget {
  const LevelUpPopupButton({
    Key key,
    @required this.worker,
  }) : super(key: key);

  final Worker worker;

  @override
  _LevelUpPopupButtonState createState() => _LevelUpPopupButtonState();
}

class _LevelUpPopupButtonState extends State<LevelUpPopupButton> {
  void increaseStat(int stat) {
    setState(() {
      widget.worker.increaseStat(stat);
    });
  }

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
          //_showLevelUpPopup(context, widget.worker, increaseStat);
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text('Level up for ' + widget.worker.name),
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
                            widget.worker.name +
                                ' has ' +
                                widget.worker.skillPoint.toString() +
                                ' skill points.',
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
                              0: FixedColumnWidth(105),
                              1: FixedColumnWidth(30),
                              2: FixedColumnWidth(35),
                            },
                            children: [
                              TableRow(children: [
                                Text('Focus'),
                                Text(widget.worker.focus.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(1)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Perception'),
                                Text(widget.worker.perception.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(2)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Loyalty'),
                                Text(widget.worker.loyalty.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(4)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Strength'),
                                Text(widget.worker.strength.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(3)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Toughness'),
                                Text(widget.worker.constitution.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(5)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Cunning'),
                                Text(widget.worker.cunning.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(6)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Intelligence'),
                                Text(widget.worker.intelligence.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(7)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Spirit'),
                                Text(widget.worker.spirit.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(9)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                              TableRow(children: [
                                Text('Dexterity'),
                                Text(widget.worker.dexterity.toString()),
                                Container(
                                  width: 20,
                                  height: 25,
                                  child: widget.worker.skillPoint > 0
                                      ? RaisedButton(
                                          padding: EdgeInsets.all(0),
                                          color: Colors.blue[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          onPressed: () => setState(() => widget.worker.increaseStat(8)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
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
            },
          );
        },
        child: Icon(
          Icons.star,
          color:
              widget.worker.skillPoint > 0 ? Colors.yellow[700] : Colors.grey,
        ),
      ),
    );
  }
}

// Future<void> _showLevelUpPopup(
//     BuildContext context, Worker worker, Function function) {
// //  final worker = Provider.of<Worker>(context);

// }
