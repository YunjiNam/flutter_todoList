import 'package:flutter/material.dart';
import 'package:flutter_todoList/todo_add.dart';
import 'package:flutter_todoList/todo_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/todoBloc/bloc.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(
            primaryColor: Color(0xFFF8F8F8),
            backgroundColor: Color(0xFFF8F8F8),
            scaffoldBackgroundColor: Color(0xFFF8F8F8),
            accentColor: Color(0xFF3A5EFF)),
        home: TodoList(),

        routes: {
          "/todoList": (BuildContext context) => TodoList(),
          "/todoAdd": (BuildContext context) => TodoAdd(),
        },
      ),
    );
  }
}
