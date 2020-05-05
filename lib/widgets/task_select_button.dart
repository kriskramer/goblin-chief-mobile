import 'package:flutter/material.dart';
import 'package:goblin_chief/models/build_order.dart';
import 'package:goblin_chief/models/worker.dart';
import 'package:goblin_chief/widgets/task_button.dart';


class TaskSelectButton extends StatelessWidget {
  const TaskSelectButton({
    Key key,
    @required this.worker,
  }) : super(key: key);

  final Worker worker;

  // This is the actual button. The popup layout/functionality is included in the _showTaskSelectPopup method later in the file.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 95,
      height: 24,
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(3.0),
          side: BorderSide(color: Colors.black),
        ),
        onPressed: () async {
          _showTaskSelectPopup(context, worker);
        },
        color: Colors.green[700],
        child: Text(
          "Set Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}


Future<void> _showTaskSelectPopup(BuildContext context, Worker worker) {
  double deviceWidth = MediaQuery.of(context).size.width;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select task for ' + worker.name),
        content: DefaultTextStyle(
          style: TextStyle(fontSize: 12, color: Colors.black),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    border: Border.all(
                      width: 2,
                      color: Colors.green[700],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: deviceWidth,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Grunt work:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TaskButton(
                            buttonText: 'Hunt',
                            buttonColor: Colors.green[500],
                            worker: worker,
                            canBuild: true,
                            task: Task.Hunt,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Gather',
                            buttonColor: Colors.green[500],
                            worker: worker,
                            canBuild: true,
                            task: Task.Gather,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Dig',
                            buttonColor: Colors.green[500],
                            worker: worker,
                            canBuild: true,
                            task: Task.Dig,
                            ctx: context,
                          ),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(
                      width: 2,
                      color: Colors.blue[700],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: deviceWidth,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Build/Craft:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TaskButton(
                            buttonText: 'Tool1',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.Tool1, worker.inventory),
                            task: Task.Tool1,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Tool2',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.Tool2, worker.inventory),
                            task: Task.Tool2,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Tool3',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.Tool3, worker.inventory),
                            task: Task.Tool3,
                            ctx: context,
                          ),
                        ]),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TaskButton(
                            buttonText: 'Weapon1',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.Weapon1, worker.inventory),
                            task: Task.Weapon1,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Weapon2',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.Weapon2, worker.inventory),
                            task: Task.Weapon2,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Weapon3',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.Weapon3, worker.inventory),
                            task: Task.Weapon3,
                            ctx: context,
                          ),
                        ]),
                        SizedBox(
                      height: 5,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TaskButton(
                            buttonText: 'Tool Workbench',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.WorkbenchT1, worker.inventory),
                            task: Task.WorkbenchT1,
                            buttonWidth: 120,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Weapon Workbench',
                            buttonColor: Colors.blue[500],
                            worker: worker,
                            canBuild: BuildOrderUtil.doMaterialsCheck(Task.WorkbenchW1, worker.inventory),
                            task: Task.WorkbenchW1,
                            buttonWidth: 120,
                            ctx: context,
                          ),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    border: Border.all(
                      width: 2,
                      color: Colors.purple[700],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: deviceWidth,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Magic/Arcane:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TaskButton(
                            buttonText: 'Potion',
                            buttonColor: Colors.purple[500],
                            worker: worker,
                            task: Task.Potion1,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Powder',
                            buttonColor: Colors.purple[500],
                            worker: worker,
                            task: Task.Powder1,
                            ctx: context,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TaskButton(
                            buttonText: 'Rune',
                            buttonColor: Colors.purple[500],
                            worker: worker,
                            task: Task.Talisman,
                            ctx: context,
                          ),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[],
      );
    },
  );
}
