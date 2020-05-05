import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:goblin_chief/models/worker.dart';
import './worker_attributes_card.dart';
import './worker_task_card.dart';
import './worker_interaction_card.dart';

class WorkerDisplayItem extends StatefulWidget {
  @override
  _WorkerDisplayItemState createState() => _WorkerDisplayItemState();
}

class _WorkerDisplayItemState extends State<WorkerDisplayItem> {
  bool showExpandedDisplay = false;

  void toggleDisplay() {
    setState(() {
      showExpandedDisplay = !showExpandedDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final worker = Provider.of<Worker>(context);
    Color borderColor = Colors.black;
    Color backgroundColor = Colors.white;

    if (worker.workerType == WorkerType.Grunt) {
      borderColor = Colors.green[800];
      backgroundColor = Colors.green[100];
    } else if (worker.workerType == WorkerType.Builder) {
      borderColor = Colors.blue[800];
      backgroundColor = Colors.blue[100];
    } else if (worker.workerType == WorkerType.Shaman) {
      borderColor = Colors.purple[600];
      backgroundColor = Colors.purple[100];
    } else if (worker.workerType == WorkerType.Warrior) {
      borderColor = Colors.red[400];
      backgroundColor = Colors.red[100];
    } else if (worker.workerType == WorkerType.Banished) {
      borderColor = Colors.grey[700];
      backgroundColor = Colors.grey[100];
    }

    return Card(
      elevation: 8,
      child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                width: 3,
                color: borderColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: deviceWidth,
          height: showExpandedDisplay ? 260 : 90,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 1),
                width: deviceWidth - 20,
                child: LinearProgressIndicator(
                  value: worker.exp * 0.01,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              showSummaryView(worker, deviceWidth, toggleDisplay, showExpandedDisplay),
              showExpandedDisplay
                  ? showExpandedSection(worker, deviceWidth)
                  : Row(),
            ],
          ),
        ),
    );
  }
}

Widget showSummaryView(Worker worker, double deviceWidth, Function toggleFunction, bool showExpandedDisplay) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          // This is the goblin image at the left of the summary view
          Card(
            elevation: 2,
            color: Colors.brown,
            child: Container(
              margin: EdgeInsets.all(1),
              height: 45,
              width: 40,
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/goblin1.jpg'),
                    fit: BoxFit.contain,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                width: 40,
                child: LinearProgressIndicator(
                  value: worker.health * 0.01,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    // The goblin's name
                    worker.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(' (' + worker.level.toString() + ')'),
                  SizedBox(
                    width: 10,
                  ),
                  CurrentTaskDisplay(worker: worker),
                  SizedBox(
                    width: 20,
                  ),
                  worker.tool1Equipped ||
                          worker.tool2Equipped ||
                          worker.tool3Equipped
                      ? Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          child: Text(
                            ' T ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    width: 10,
                  ),
                  worker.weapon1Equipped ||
                          worker.weapon2Equipped ||
                          worker.weapon3Equipped
                      ? Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.red[500],
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          child: Text(
                            ' W ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(children: <Widget>[
                worker.starLevel >= 1 ? Icon(Icons.star, size: 10, color: Colors.green[800],) : SizedBox(width: 1,),
                worker.starLevel >= 2 ? Icon(Icons.star, size: 10, color: Colors.green[800],) : SizedBox(width: 1,),
                worker.starLevel >= 3 ? Icon(Icons.star, size: 10, color: Colors.green[800],) : SizedBox(width: 1,),
                worker.starLevel >= 4 ? Icon(Icons.star, size: 10, color: Colors.green[800],) : SizedBox(width: 1,),
                worker.starLevel >= 5 ? Icon(Icons.star, size: 10, color: Colors.green[800],) : SizedBox(width: 1,),
                SizedBox(height: 10,),
              ],),
              Container(
                width: deviceWidth - 120,
                child: LinearProgressIndicator(
                  value: worker.hunger * 0.01,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              ),
              Container(
                width: deviceWidth - 120,
                child: LinearProgressIndicator(
                  value: worker.fatigue * 0.01,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.yellow),
                ),
              ),
              Container(
                width: deviceWidth - 120,
                child: worker.buildOrder != null
                    ? LinearProgressIndicator(
                  value: worker.buildOrder.progress * 0.01,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                ) : null,
              ),
            ],
          ),
          GestureDetector(
            onTap: () => toggleFunction(),
            child: Card(
              elevation: 2,
              color: Colors.green[700],
              child: Container(
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(3),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.yellow,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: showExpandedDisplay ? Icon(Icons.arrow_upward, color: Colors.white) : Icon(Icons.arrow_downward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          width: deviceWidth - 40,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: Text(
                worker.status,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  //color: Colors.grey,
                ),
              ),
        ),
    ],
  );
}

class CurrentTaskDisplay extends StatelessWidget {
  final Worker worker;
  const CurrentTaskDisplay({
    Key key,
    this.worker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: Colors.green[700],
          //border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Text(
        worker.getTaskString(),
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}

Widget showExpandedSection(Worker worker, double deviceWidth) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 3, child: WorkerAttributesCard(worker: worker)),
          Expanded(flex: 3, child: WorkerTaskCard(worker: worker)),
          Expanded(flex: 3, child: WorkerInteractionCard(worker: worker)),
        ],
      ),
    ],
  );
}
