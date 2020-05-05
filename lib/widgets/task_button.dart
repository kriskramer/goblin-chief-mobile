import 'package:flutter/material.dart';
import 'package:goblin_chief/models/worker.dart';

class TaskButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Task task;
  final Worker worker;
  final bool canBuild;
  final BuildContext ctx;
  final double buttonWidth;

  const TaskButton(
      {Key key,
      this.buttonColor,
      this.ctx,
      this.buttonText,
      this.task,
      this.buttonWidth,
      this.canBuild = false,
      this.worker})
      : super(key: key);

  void setTask(Task task) {
    worker.setTask(task);
    Navigator.of(ctx).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: buttonWidth != null ? buttonWidth : 80,
      height: 24,
      child: canBuild ? FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          //side: BorderSide(color: Colors.black),
        ),
        onPressed: () => setTask(task),
        color: buttonColor,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ) : FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.black),
        ),
        color: Colors.grey,
        onPressed: () {},
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
