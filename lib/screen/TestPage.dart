import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_it_organized/Components/_Drawer.dart';
import 'package:keep_it_organized/database/myTask_db.dart';
import 'package:keep_it_organized/store/TestStore/test_st.dart';

class TestPage extends StatefulWidget {
  // DB name
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final String _dbname = 'oowwoo';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<Mytask>('oowwoo'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            // my local varibales
            // '******************************************
            final _dbt = Hive.box<Mytask>(_dbname);
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
                  body: _buildListView()
                );
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

  
}


Widget _buildListView() {
return WatchBoxBuilder(
  box: Hive.box<Mytask>('oowwoo'),
  builder: (context, contactsBox) {
    return ListView.builder(
      itemCount: contactsBox.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contactsBox.getAt(index) as Mytask;

        return ListTile(
          title: Text(contact.title),
          trailing: IconButton(icon: Icon(Icons.delete),onPressed: ()=> contactsBox.deleteAt(index),),
        
        );
      },
    );
  },
);}