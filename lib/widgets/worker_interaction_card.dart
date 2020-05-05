import 'package:flutter/material.dart';

import '../models/worker.dart';

class WorkerInteractionCard extends StatelessWidget {
  final Worker worker;
  const WorkerInteractionCard({Key key, this.worker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            width: 90,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: worker.warn,
              color: Colors.yellow[300],
              child: Text(
                "Warn",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.transparent,
            width: 90,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: worker.threaten,
              color: Colors.red[300],
              child: Text(
                "Threaten",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.transparent,
            width: 95,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: worker.giveFood,
              color: Colors.green[900],
              child: Text(
                "Give Food",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.transparent,
            width: 95,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: worker.giveShiny,
              color: Colors.blue[300],
              child: Text(
                "Give Shiny",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.transparent,
            width: 95,
            height: 24,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () {},
              color: Colors.brown[700],
              child: Text(
                "Give Badge",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
