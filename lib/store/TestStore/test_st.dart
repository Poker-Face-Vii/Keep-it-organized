import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'test_st.g.dart';

// This is the class used by rest of your codebase
class TestSt = _TestSt with _$TestSt;

// The store-class
abstract class _TestSt with Store {
  
  @observable
  String title;
  final TextEditingController tCo = TextEditingController();
  int counter;
    

  @action
  void debug(context) {
    
    title = tCo.text;
    tCo.clear();
    print(title);
  }

  @action
  void addTasktoDB() {
    title = tCo.text;
    tCo.clear();
  
  
}

}
