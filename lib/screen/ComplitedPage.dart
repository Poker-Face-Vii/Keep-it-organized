// ?     Dependemcy
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ?     C O M P O N E N T S
import 'package:keep_it_organized/Components/_Drawer.dart';

// ?     DATA  _  BASE   Modul
import 'package:keep_it_organized/database/myTask_db.dart';

// ?     S T A T E S
import 'package:keep_it_organized/store/taskManage/task_manage.dart';

class ComplitedPage extends StatelessWidget {
  //
  // CLASS variables +++++++++++++++++++++++++++++++++++++++++
  final TaskManage _task = TaskManage();
  //
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<Mytask>('Complited'),
      builder: (BuildContext contex, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            // !! this the body Scafold CODE__________________________________________
            // !
            return Observer(
                builder: (_) => Scaffold(
                      drawer: my_menu(context, 2),
                      appBar: new AppBar(
                        title: Text('KIO'),
                      ),
                      body: _BoxWatch(),
                    ));
            // ! _____________________________________________________________________
          }
        } else {
          return Scaffold();
        }
      },
    );
  }
}

//
//
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++
// !    Hive Box WATCH BUILDER Class
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++
class _BoxWatch extends StatefulWidget {
  _BoxWatch({Key key}) : super(key: key);

  @override
  __BoxWatchState createState() => __BoxWatchState();
}

class __BoxWatchState extends State<_BoxWatch> {
  final TaskManage _task = TaskManage();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => WatchBoxBuilder(
        box: Hive.box<Mytask>('Complited'),
        builder: (context, contactsBox) {
          return ListView.builder(
            itemCount: contactsBox.length,
            itemBuilder: (BuildContext context, int index) {
              final contact = contactsBox.getAt(index);

              return ListTile(
                leading: Checkbox(
                  value: contact.status,
                  onChanged: (bool value) {
                    setState(() {
                      contactsBox.putAt(
                          index, Mytask(contact.title, !contact.status));
                      // print(contact.status);
                    });
                    setState(() {
                      if (contact.status == false) {
                        contactsBox.deleteAt(index);
                      }
                    });
                  },
                ),
                title: Text(contact.title),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => contactsBox.deleteAt(index),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
