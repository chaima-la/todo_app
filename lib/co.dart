import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class con extends StatelessWidget {
  String task;
  bool check;
  Function(bool?)? on;
  Function(BuildContext)? delet;
  con(
      {required this.task,
      required this.check,
      required this.on,
      required this.delet});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: delet,
            icon: Icons.abc,
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Checkbox(value: check, onChanged: on),
                  Text(
                    task,
                    style: TextStyle(
                        fontSize: 50,
                        decoration: check
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
