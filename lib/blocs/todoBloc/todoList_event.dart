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

class AddDateChanged extends TodoListEvent {
  final String date;

  AddDateChanged({@required this.date});

  @override
  String toString() {
    // TODO: implement toString
    return 'AddDateChanged {date : $date}';
  }
}

class TodoAddPressed extends TodoListEvent {
  final int id;
  final String todo;
  final String date;
  final String desc;

  TodoAddPressed({
    @required this.id,
    @required this.todo,
    @required this.date,
    @required this.desc,
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'TodoListCheck {id: $id, todo: $todo, date: $date, desc: $desc}';
  }
}