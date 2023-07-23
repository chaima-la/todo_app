import 'package:flutter/material.dart';

class dialog extends StatelessWidget {
  VoidCallback saved;
  VoidCallback cancelled;
  final controller;
  dialog(
      {required this.controller, required this.saved, required this.cancelled});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Colors.white,
        height: 150,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "new task",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    color: Colors.deepPurple,
                    child: Text("save"),
                    onPressed: saved),
                MaterialButton(
                    color: Colors.grey,
                    child: Text("cancel"),
                    onPressed: cancelled)
              ],
            )
          ],
        ),
      ),
    );
  }
}
