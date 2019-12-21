import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:keep_it_organized/Components/_Drawer.dart';

class AddPage extends StatelessWidget {
  // DB name
  final String _dbname = 'Todo_task';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('Todo_task'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // my local varibales
        // '******************************************
        final _dbt = Hive.box(_dbname);
        // '******************************************
        // End varibles part
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return _Myscreen(_dbt);
          }
        } else {
          return Scaffold(
            drawer: my_menu(context, 2),
            appBar: AppBar(
              title: Text('Add new task'),
            ),
            body: Center(
              child: Text("loading..."),
            ),
          );
        }
      },
    );
  }
}

class _Myscreen extends StatelessWidget {
  final _dbt;
  _Myscreen(this._dbt);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
            drawer: my_menu(context, 2),
            appBar: AppBar(
              title: Text('Add new task'),
            ),
            body: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextField(),
                  SizedBox(height: 25.0,),
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      
                    },
                  )
                ],
              ),
            ));
      },
    );
  }
}
