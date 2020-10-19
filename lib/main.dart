// import 'package:flutter/material.dart';
// import 'package:flutter_todoList/todo_add.dart';
// import 'package:flutter_todoList/todo_list.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'blocs/todoBloc/bloc.dart';
//
// void main() => runApp(TodoApp());
//
// class TodoApp extends StatefulWidget {
//   @override
//   _TodoAppState createState() => _TodoAppState();
// }
//
// class _TodoAppState extends State<TodoApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<TodoBloc>(
//           create: (BuildContext context) => TodoBloc(),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Todo',
//         theme: ThemeData(
//             primaryColor: Color(0xFFF8F8F8),
//             backgroundColor: Color(0xFFF8F8F8),
//             scaffoldBackgroundColor: Color(0xFFF8F8F8),
//             accentColor: Color(0xFF3A5EFF)),
//         home: Swiper(),
//
//         routes: {
//           "/todoList": (BuildContext context) => TodoList(),
//           "/todoAdd": (BuildContext context) => TodoAdd(),
//           "/swiper": (BuildContext context) => Swiper(),
//         },
//       ),
//     );
//   }
// }


// swipe 예제

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SwipeSample createState() => SwipeSample();
}

class SwipeSample extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



