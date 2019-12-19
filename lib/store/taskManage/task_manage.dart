import 'package:mobx/mobx.dart';

// Include generated file
part 'task_manage.g.dart';

// This is the class used by rest of your codebase
class TaskManage = _TaskManage with _$TaskManage;

// The store-class
abstract class _TaskManage with Store {
  @observable
  int taskCounter = 0;

  @action
  void increment() {
    taskCounter++;
  }
}