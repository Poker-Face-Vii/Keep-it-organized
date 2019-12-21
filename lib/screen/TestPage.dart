import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:keep_it_organized/Components/_Drawer.dart';
import 'package:keep_it_organized/store/TestStore/test_st.dart';



class TestPage extends StatefulWidget {
  // DB name
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
            drawer: my_menu(context, 1),
            appBar: AppBar(
              title: Text('Add new task'),
            ),
            body: ListView.builder(itemCount: _dbt.length,
            itemBuilder: (BuildContext context,int index){
              return;
            },));
      },
    );
          }
        } else {
          return Scaffold(
            drawer: my_menu(context, 1),
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
