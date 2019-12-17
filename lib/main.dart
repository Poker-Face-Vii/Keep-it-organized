import 'package:flutter/material.dart';

void main() => runApp(KeepItSimple());

class KeepItSimple extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold()
    );
  }
}
