import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TodoListEvent extends Equatable {
  TodoListEvent([List props = const []]) : super(props);
}

class TodoPageLoaded extends TodoListEvent {
  @override
  String toString() {
    return "TodoPageLoaded";
  }
}

class TodoListCheck extends TodoListEvent {
  final int index;

  TodoListCheck({@required this.index});

  @override
  String toString() {
    return "TodoListCheck";
  }
}