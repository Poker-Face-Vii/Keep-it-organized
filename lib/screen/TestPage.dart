import 'package:flutter/material.dart';
import 'package:keep_it_organized/Components/_Drawer.dart';



class Testpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: my_menu(context,1),
      appBar: AppBar(
        title: Text('ddd'),
      ),
    );
  }
}
