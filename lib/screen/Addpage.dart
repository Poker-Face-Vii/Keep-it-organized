import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:keep_it_organized/Components/_Drawer.dart';
import 'package:keep_it_organized/store/TestStore/test_st.dart';

class AddPage extends StatefulWidget {
  // DB name
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final String _dbname = 'Todo_task';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('Todo_task'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
        // my local varibales
        // '******************************************
        final _dbt = Hive.box(_dbname);
        final _formKey = GlobalKey<FormState>();
        final TestSt _state = TestSt();
        // '******************************************
        // End varibles part
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
                  TextField( controller: _state.tCo,
                  ),
                  SizedBox(height: 25.0,),
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // _state.debug(context);
                      
                      _state.addTasktoDB();
                      _dbt.add(_state.title);
                      debugPrint('the lenght : ${_dbt.length}');
                    },
                  )
                ],
              ),
            ));
      },
    );
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

  @override
  void dispose() {
    Hive.box('Todo_task').close();
    super.dispose();
  }
}

