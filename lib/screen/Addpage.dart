import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:keep_it_organized/Components/_Drawer.dart';
import 'package:keep_it_organized/database/myTask_db.dart';
import 'package:keep_it_organized/store/TestStore/test_st.dart';

class AddPage extends StatefulWidget {
  // DB name
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
                          TextField(
                            controller: _state.tCo,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              // _state.debug(context);

                              _state.addTasktoDB();
                              // _dbt.add(Mytask(_state.title));
                              debugPrint('the lenght : ${_dbt.length}');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.star),
                            onPressed: () {
                              // _state.debug(context);
                              debugPrint('the lenght is ${_dbt.length}');
                              debugPrint('1: ${_dbt.getAt(4).title}');
                              // debugPrint('2: ${_dbt.getAt(1).title}');
                              // debugPrint('3: ${_dbt.getAt(2).title}');
                              // debugPrint('4: ${_dbt.getAt(3).title}');
                              // debugPrint('5: ${_dbt.getAt(4).title}');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _dbt.deleteAt(0);
                              // _state.debug(context);
                              debugPrint('the lenght is ${_dbt.length}');
                            },
                          ),
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
}
