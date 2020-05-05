import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goblin_chief/widgets/console_popup_button.dart';
import 'package:goblin_chief/widgets/level_up_popup_button.dart';
//import 'package:provider/provider.dart';

import '../models/worker.dart';
import './stats_popup_button.dart';
import './task_select_button.dart';

class WorkerTaskCard extends StatelessWidget {
  final Worker worker;
  const WorkerTaskCard({Key key, this.worker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 98,
            height: 24,
            child: Row(
              children: <Widget>[
                LevelUpPopupButton(worker: worker,),
                SizedBox(
                  width: 7,
                ),
                ConsolePopupButton(worker: worker,),
                SizedBox(
                  width: 7,
                ),
                StatsPopupButton(worker: worker),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TaskSelectButton(worker: worker),
          SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.transparent,
            width: 95,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(3.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () {},
              color: Colors.brown[700],
              child: Text(
                "Consume",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.transparent,
            width: 95,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(3.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () {},
              color: Colors.grey[300],
              child: Text(
                "Not used",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
