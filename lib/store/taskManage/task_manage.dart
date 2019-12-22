import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'task_manage.g.dart';

// This is the class used by rest of your codebase
class TaskManage = _TaskManage with _$TaskManage;

// The store-class
abstract class _TaskManage with Store {
  
  @observable
  int count = 0;
  String title;
  List listTitle =[];
  bool booli =true;
  final TextEditingController newTaskField = TextEditingController();
  

  @action
  void increment() {
    
    count = Hive.box('opentask').length;
    
  }

  @action
  
  void addTask() {
    title = newTaskField.text;
    listTitle.add(title);
    newTaskField.text ='';
    
    
  }
  
}
