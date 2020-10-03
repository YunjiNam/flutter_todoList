import 'package:flutter_todoList/models/todo_model.dart';
import 'package:meta/meta.dart';

class TodoState {
  final List<Todo> todoList;

  TodoState({
    @required this.todoList,
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
    );
  }

  TodoState update({List<Todo> todoList}) {
    return copyWith(
      todoList: todoList,
    );
  }

  TodoState copyWith({List<Todo> todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }
}
