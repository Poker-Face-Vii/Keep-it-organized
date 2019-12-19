// ?   Dependemcy 
import 'package:flutter/material.dart';
// ?   S C R E E N
import 'package:keep_it_organized/screen/inbox.dart';

void main() => runApp(KeepItSimple());

class KeepItSimple extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIO',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xffF1F3F4)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InboxPage(),
      },
    );
  }
}



