import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:keep_it_organized/store/taskManage/task_manage.dart';

class InboxPage extends StatelessWidget {
  final TaskManage _task = TaskManage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('mytasks'),
      builder: (BuildContext contex, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Observer(
                builder: (_) => Scaffold(
                      appBar: new AppBar(
                        leading: GestureDetector(child: Icon(Icons.refresh),onTap: (){
                          
                        },),
                        title: Text('KIO'),
                      ),
                      body: ListView.builder(
                        itemCount: _task.count == 0
                            ? Hive.box('mytasks').length
                            : _task.count,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () {
                                Hive.box('mytasks').delete(index);
                              },
                            ),
                            title:
                                // Text(_task.listTitle[index]),
                                Text(Hive.box('mytasks').get(index) == null
                                    ? "null"
                                    : Hive.box('mytasks').get(index)),
                          );
                        },
                      ),
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
                      trailing: GestureDetector(
                    child: Icon(Icons.send, color: Colors.blueAccent),
                    onTap: () {
                      if (task.newTaskField.text != '') {
                        task.increment();
                        task.addTask();
                        addTasktoDB(task.title);
                        Navigator.pop(context);
                      }
                    },
                  ))
                ],
              ),
            ),
          );
        });
  }
}

void addTasktoDB(value) {
  print(value);
  Hive.box('mytasks').add(value);
}
