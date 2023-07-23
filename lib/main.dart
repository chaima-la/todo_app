import 'package:todos/co.dart';
import 'package:flutter/material.dart';
import 'package:todos/dialog.dart';

void main() {
  runApp(MaterialApp(home: myapp()));
}

class myapp extends StatefulWidget {
  myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  List todos = [
    ["task1", false],
    ["task2", false],
    ["task3", false],
    ["task4", false],
  ];
  var a = 0;
  void ch(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  final c = TextEditingController();
  void create() {
    showDialog(
        context: context,
        builder: ((context) {
          return dialog(
            controller: c,
            saved: () {
              setState(() {
                todos.add([c.text, false]);
                c.clear();
              });
              Navigator.of(context).pop();
            },
            cancelled: () {
              Navigator.of(context).pop();
            },
          );
        }));
  }

  void t(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  int _calcTotalCompletions() {
    var totalCompletions = 0;

    todos.forEach((todo) {
      if (todo[1]) {
        totalCompletions++;
      }
    });

    return totalCompletions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "MY TODO LIST",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.deepPurple,
        ),
        // backgroundColor: Colors.deepPurple[100],
        floatingActionButton: FloatingActionButton(
          onPressed: create,
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "${_calcTotalCompletions()}/${todos.length}",
                  style: TextStyle(fontSize: 80),
                ),
                SizedBox(
                  height: 25,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return con(
                        check: todos[index][1],
                        task: todos[index][0],
                        on: (value) => ch(value, index),
                        delet: (context) {
                          t(index);
                        },
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
