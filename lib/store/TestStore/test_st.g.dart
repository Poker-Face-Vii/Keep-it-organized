// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_st.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestSt on _TestSt, Store {
  final _$titleAtom = Atom(name: '_TestSt.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$_TestStActionController = ActionController(name: '_TestSt');

  @override
  void increment() {
    final _$actionInfo = _$_TestStActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_TestStActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask() {
    final _$actionInfo = _$_TestStActionController.startAction();
    try {
      return super.addTask();
    } finally {
      _$_TestStActionController.endAction(_$actionInfo);
    }
  }
}
