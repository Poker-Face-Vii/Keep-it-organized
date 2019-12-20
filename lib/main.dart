// ?   Dependemcy
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
// ?   S C R E E N
import 'package:keep_it_organized/screen/inbox.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(KeepItSimple());
  
}

class KeepItSimple extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIO',
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Color(0xffF1F3F4)),
      initialRoute: '/',
      routes: {
        
        '/': (context) => InboxPage(),
        // '/': (context) => Testpage(),
      },
    );
  }
}
class Testpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('ddd'),
        ),
        );
  }
}