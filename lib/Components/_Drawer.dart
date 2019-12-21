import 'package:flutter/material.dart';

Drawer my_menu(context, selected) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        FlatButton(
          child: Text(
            'Home',
            style: TextStyle(
                color: selected == 1 ? Colors.blueAccent : Colors.black),
          ),
          onPressed: () =>
              selected == 1 ? selected : Navigator.pushNamed(context, '/'),
        ),
        FlatButton(
          child: Text(
            'Add',
            style: TextStyle(
                color: selected == 2 ? Colors.blueAccent : Colors.black),
          ),
          onPressed: () =>
              selected == 2 ? selected : Navigator.pushNamed(context, '/add'),
        ),
        FlatButton(
          child: Text(
            'other',
            style: TextStyle(
                color: selected == 3 ? Colors.blueAccent : Colors.black),
          ),
          onPressed: () =>selected == 3 ? selected : Navigator.pushNamed(context, '/other'),
        ),
        FlatButton(
          child: Text(
            'Setting',
            style: TextStyle(
                color: selected == 4 ? Colors.blueAccent : Colors.black),
          ),
          onPressed: () {},
        )
      ],
    ),
  );
}
