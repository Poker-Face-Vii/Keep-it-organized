import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keep_it_organized/store/taskManage/task_manage.dart';

class InboxPage extends StatelessWidget {
  final TaskManage _task = TaskManage();

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
              appBar: new AppBar(
                title: Text('KIO'),
              ),
              body: ListView.builder(
                itemCount: _task.count,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('ff'),
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
                    decoration: InputDecoration(hintText: 'adddrss'),
                    autofocus: true,
                  ),
                  ListTile(
                      trailing: GestureDetector(
                    child: Icon(Icons.send),
                    onTap: () {
                      task.increment();
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
