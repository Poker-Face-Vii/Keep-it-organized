import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keep_it_organized/store/taskManage/task_manage.dart';


class InboxPage extends StatelessWidget {
  final TaskManage task = TaskManage();


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
              appBar: new AppBar(title: Text('KIO'),),
              body: ListView.builder(
                itemCount: task.count,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('ff'),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: task.increment,),
            ));
  }
}
