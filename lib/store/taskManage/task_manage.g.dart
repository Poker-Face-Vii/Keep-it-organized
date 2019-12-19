// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_manage.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskManage on _TaskManage, Store {
  final _$taskCounterAtom = Atom(name: '_TaskManage.taskCounter');

  @override
  int get taskCounter {
    _$taskCounterAtom.context.enforceReadPolicy(_$taskCounterAtom);
    _$taskCounterAtom.reportObserved();
    return super.taskCounter;
  }

  @override
  set taskCounter(int value) {
    _$taskCounterAtom.context.conditionallyRunInAction(() {
      super.taskCounter = value;
      _$taskCounterAtom.reportChanged();
    }, _$taskCounterAtom, name: '${_$taskCounterAtom.name}_set');
  }

  final _$_TaskManageActionController = ActionController(name: '_TaskManage');

  @override
  void increment() {
    final _$actionInfo = _$_TaskManageActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_TaskManageActionController.endAction(_$actionInfo);
    }
  }
}
