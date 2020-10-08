import 'package:flutter_todoList/models/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class TodoState {
  final List<Todo> todoList;
  final String date;

  TodoState({
    @required this.todoList,
    @required this.date,
  });

  factory TodoState.empty() {
    return TodoState(
      todoList: [
        Todo(
            id: 0,
            todo: "공부하기",
            date: "2020.10.02",
            checked: false,
            desc: "코딩 공부 열심히 하기"),
        Todo(
            id: 1,
            todo: "공부하기2",
            date: "2020.10.01",
            checked: false,
            desc: null),
        Todo(
            id: 2,
            todo: "은행가기",
            date: "2020.10.03",
            checked: false,
            desc: "아침에 은행가기"),
      ],
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
    );
  }

  TodoState update({
    List<Todo> todoList,
    String date,
  }) {
    return copyWith(
      todoList: todoList,
      date: date,
    );
  }

  TodoState copyWith({
    List<Todo> todoList,
    String date,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      date: date ?? this.date,
    );
  }
}
