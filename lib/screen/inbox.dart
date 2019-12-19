import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {


  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('KIO'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('hello ${1 + index}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){},)
    );
  }
}
