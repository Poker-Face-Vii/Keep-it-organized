import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keep_it_organized/store/taskManage/task_manage.dart';

class InboxPage extends StatelessWidget {
  final TaskManage _task = TaskManage();
  B_module modal = new B_module();


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
                onPressed: () => modal.mainBoottomSheet(context),
              ),
            ));
  }
}

class B_module {
  mainBoottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(height: 300.0,padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[Row(
                children: <Widget>[
                  Container( child: TextField(autofocus: true,cursorColor: Colors.black,)),
                  Container(child: Icon(Icons.send),)
                ],
              )],
            ),
          );
        });
  }
}
