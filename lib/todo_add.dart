import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'blocs/todoBloc/bloc.dart';

class TodoAdd extends StatefulWidget {
  @override
  _TodoAddState createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  TodoBloc _todoBloc;

  TextEditingController todo = TextEditingController();
  TextEditingController description = TextEditingController();
  String selectDate;

  String formattedDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (BuildContext context, TodoState state) {},
      bloc: _todoBloc,
      child: BlocBuilder(
        bloc: _todoBloc,
        builder: (BuildContext context, TodoState state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Todo Add'),
            ),
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Text('할 일',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '무엇을 하실 건가요?'),
                    controller: todo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Text('메모',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.7,
                      ),
                    ),
                    child: TextField(
                      cursorColor: Theme.of(context).primaryColor,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: description,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('날짜',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  OutlineButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.calendar_today),
                          Text(formattedDate),
                        ],
                      ),
                    ),
                    onPressed: () {
                      // _selectDate(context, state);
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(color: Color(0xFF266DAC)),
                        ),
                        color: Color(0xFF266DAC),
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
