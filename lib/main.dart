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
// https://cdl-dev.tistory.com/m/11

// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   SwipeSample createState() => SwipeSample();
// }
//
// class SwipeSample extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     double appBarHeight = 50.0;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(appBarHeight),
//           child: AppBar(
//             title: Text('Swipe Demo'),
//             backgroundColor: Colors.cyan,
//           ),
//         ),
//         body: BookSwipe([Red(), Blue(), Green()]),
//       ),
//     );
//   }
// }
//
// class BookSwipe extends StatelessWidget {
//   List<Widget> widgetList = List<Widget>();
//
//   BookSwipe([this.widgetList]);
//
//   @override
//   Widget build(BuildContext context) {
//     if (widgetList == null) {
//       widgetList = [Red(), Green(), Blue()];
//     }
//     return Container(
//       color: Colors.white,
//       child: new LayoutBuilder(builder: (context, constraint) {
//         return new Swiper(
//           loop: true,
//           pagination: new SwiperPagination(),
//           itemCount: widgetList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return widgetList[index];
//           },
//           viewportFraction: 0.8,
//           scale: 0.9,
//           layout: SwiperLayout.STACK,
//           itemWidth: constraint.biggest.width * 0.8,
//           itemHeight: constraint.biggest.height * 0.8,
//           index: 1,
//         );
//       }),
//     );
//   }
// }
//
// class Red extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.red,
//     );
//   }
// }
//
// class Green extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new LayoutBuilder(builder: (context, constraint) {
//       double min = (constraint.biggest.width < constraint.biggest.height)
//           ? constraint.biggest.width
//           : constraint.biggest.height;
//       return Container(
//         width: constraint.biggest.width,
//         height: constraint.biggest.height,
//         color: Colors.green,
//         child: Center(
//           child: Text(
//             'GREEN',
//             style: TextStyle(
//                 fontSize: min / 4,
//                 color: Colors.white,
//                 decoration: TextDecoration.none,
//                 fontWeight: FontWeight.normal),
//           ),
//         ),
//       );
//     });
//   }
// }
//
// class Blue extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new LayoutBuilder(builder: (context, constraint) {
//       double min = (constraint.biggest.width < constraint.biggest.height)
//           ? constraint.biggest.width : constraint.biggest.height;
//       return Container(
//         width: constraint.biggest.width,
//         height: constraint.biggest.height,
//         color: Colors.blue,
//         child: Icon(Icons.access_alarms, size: min / 2, color: Colors.white,),
//       );
//     });
//   }
// }


// FutureBuilder 예제
// https://eory96study.tistory.com/21

// FutureBuilder : Future 을 사용하는 이유처럼 데이터를 다 받기 전에 데이터가 없이 그릴수 없는
// 부분을 먼저 그려주기 위해 사용된다. 만약 FutureBuilder 가 없다면 데이터가 다 받아지기를 기다린 후
// 화면을 그리거나 데이터가 변함을 setState() 를 통해 바꾸어 주어야 한다

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Future Builder Example'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   Future<String> _fetch1() async {
//     await Future.delayed(Duration(seconds: 2));
//     return 'Call Data';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '이곳은 데이터 상관없이 불려져 오는 곳입니다.',
//                 style: TextStyle(fontSize: 20),
//             ),
//             FutureBuilder(
//               future: _fetch1(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasData == false) {
//                   return CircularProgressIndicator();
//                 }
//                 else if (snapshot.hasError) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Error: ${snapshot.error}',
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   );
//                 }
//                 else {
//                   return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       snapshot.data.toString(),
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}


// FutureBuilder api 사용 예제
// https://eory96study.tistory.com/33?category=821706

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'models/weather_model.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Weather Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: MyHomePage(title: 'Weather Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   Future<Weather> getWeather() async {
//     String apiAddr =
//         "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=apikey를입력해주세요&units=metric";
//     http.Response response;
//     var data1;
//     Weather weather;
//     try {
//       response = await http.get(apiAddr);
//       data1 = json.decode(response.body);
//       weather = Weather(
//         temp: data1['main']['temp'],
//         tempMax: data1['main']['temp_max'],
//         tempMin: data1['main']['temp_min'],
//         weatherMain: data1['weather'][0]['main'],
//         code: data1['weather'][0]['id'],);
//       print(weather.tempMin);
//     } catch (e) {
//       print(e);
//     }
//
//     return weather;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: getWeather(),
//           builder: (context, AsyncSnapshot<Weather> snapshot) {
//             if (snapshot.hasData == false) {
//               return CircularProgressIndicator();
//             }
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('현재 온도 : ${snapshot.data.temp.toString()}'),
//                 Text('최저 온도 : ${snapshot.data.tempMin.toString()}'),
//                 Text('최고 온도 : ${snapshot.data.tempMax.toString()}'),
//                 snapshot.data.code == 800
//                     ? Icon(Icons.wb_sunny)
//                     : snapshot.data.code / 100 == 8 ||
//                         snapshot.data.code / 100 == 2
//                       ? Icon(Icons.wb_cloudy)
//                       : snapshot.data.code / 100 == 3 ||
//                           snapshot.data.code / 100 == 5
//                         ? Icon(Icons.beach_access)
//                         : snapshot.data.code / 100 == 6
//                           ? Icon(Icons.ac_unit)
//                           : Icon(Icons.cloud_circle)
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// change focus scope 사용 예제
// https://eory96study.tistory.com/4?category=821706

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change focus position'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('input'),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                        )
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}




















