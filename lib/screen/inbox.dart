import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_it_organized/database/myTask_db.dart';
import 'package:keep_it_organized/store/taskManage/task_manage.dart';

class InboxPage extends StatelessWidget {
  final TaskManage _task = TaskManage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('customtaskk'),
      builder: (BuildContext contex, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Observer(
                builder: (_) => Scaffold(
                      appBar: new AppBar(
                        title: Text('KIO'),
                      ),
                      body: _boxWatcher(),
                      floatingActionButton: FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            Bmodule(_task).mainBoottomSheet(context);
                          }),
                    ));
          }
        } else {
          return Scaffold();
        }
      },
    );
  }
}

class Bmodule {
  final TaskManage task;
  Bmodule(this.task);

  mainBoottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: task.newTaskField,
                    decoration: InputDecoration(hintText: 'Task'),
                    autofocus: true,
                  ),
                  ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                      trailing: GestureDetector(
                        child: Icon(Icons.send, color: Colors.blueAccent),
                        onTap: () {
                          task.addTask();
                          Hive.box('customtaskk').add(task.title);
                          Navigator.pop(context);
                        },
                      ))
                ],
              ),
            ),
          );
        });
  }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++
// !this is Box Watch Builder Widget
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++

Widget _boxWatcher() {
  return WatchBoxBuilder(
    box: Hive.box('customtaskk'),
    builder: (context, contactsBox) {
      return ListView.builder(
        itemCount: contactsBox.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contactsBox.getAt(index) ;

          return ListTile(
            title: Text(contact),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => contactsBox.deleteAt(index),
            ),
          );
        },
      );
    },
  );
}

void addTasktoDB(value) {
  print(value);
  Hive.box('mytasks').add(value);
}
