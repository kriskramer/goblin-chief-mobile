import 'package:flutter/material.dart';

import 'package:goblin_chief/models/worker.dart';

class ConsolePopupButton extends StatelessWidget {
  const ConsolePopupButton({
    Key key,
    @required this.worker,
  }) : super(key: key);

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Console popup button
      width: 25,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: () async {
          _showConsolePopup(context, worker);
        },
        child: Icon(
          Icons.list,
          color: Colors.black,
        ),
      ),
    );
  }

  Future<void> _showConsolePopup(BuildContext context, Worker worker) {
    int latestStatusMessageIndex = worker.workerStatusHistory.length;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Level up for ' + worker.name),
          content: Column(
            children: <Widget>[
              Text('Status history.',
                  style: TextStyle(
                    fontSize: 12,
                  )),
              SizedBox(
                height: 15,
              ),
              DefaultTextStyle(
                style: TextStyle(fontSize: 12, color: Colors.black),
                child: Column(
                  children: <Widget>[
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 8]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 7]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 6]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 5]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 4]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 3]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 2]),
                    Text(worker.workerStatusHistory[latestStatusMessageIndex - 1]),
                  ],
                ),
              )
              // ListView.builder(
              //     itemCount: worker.workerStatusHistory.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Text('Entry ${worker.workerStatusHistory[index]}');
              //     }),
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
}
