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
    double appBarHeight = 50.0;
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: AppBar(
            title: Text('Swipe Demo'),
            backgroundColor: Colors.cyan,
          ),
        ),
        body: BookSwipe([Red(), Blue(), Green()]),
      ),
    );
  }
}

class BookSwipe extends StatelessWidget {
  List<Widget> widgetList = List<Widget>();

  BookSwipe([this.widgetList]);

  @override
  Widget build(BuildContext context) {
    if (widgetList == null) {
      widgetList = [Red(), Green(), Blue()];
    }
    return Container(
      color: Colors.white,
      child: new LayoutBuilder(builder: (context, constraint) {
        return new Swiper(
          loop: true,
          pagination: new SwiperPagination(),
          itemCount: widgetList.length,
          itemBuilder: (BuildContext context, int index) {
            return widgetList[index];
          },
          viewportFraction: 0.8,
          scale: 0.9,
          layout: SwiperLayout.STACK,
          itemWidth: constraint.biggest.width * 0.8,
          itemHeight: constraint.biggest.height * 0.8,
          index: 1,
        );
      }),
    );
  }
}

class Red extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
    );
  }
}

class Green extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, constraint) {
      double min = (constraint.biggest.width < constraint.biggest.height)
          ? constraint.biggest.width
          : constraint.biggest.height;
      return Container(
        width: constraint.biggest.width,
        height: constraint.biggest.height,
        color: Colors.green,
        child: Center(
          child: Text(
            'GREEN',
            style: TextStyle(
                fontSize: min / 4,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal),
          ),
        ),
      );
    });
  }
}

class Blue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, constraint) {
      double min = (constraint.biggest.width < constraint.biggest.height)
          ? constraint.biggest.width : constraint.biggest.height;
      return Container(
        width: constraint.biggest.width,
        height: constraint.biggest.height,
        color: Colors.blue,
        child: Icon(Icons.access_alarms, size: min / 2, color: Colors.white,),
      );
    });
  }
}
