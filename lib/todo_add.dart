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
  // 앞에서 생성된 todo bloc 계속 사용
  TodoBloc _todoBloc;

  // todo 의 제목을 위한 컨트롤러, 설명을 위한 컨트롤러 그리고 내가 지정한 날짜를 위한 컨트롤

  TextEditingController todo = TextEditingController();
  TextEditingController description = TextEditingController();
  String selectDate;

  // 받아온 DateTime 을 특정 형태로 바꾸는 방법
  String formattedDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // 앞에서 생성된 블럭 계속 사용
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
            body: SingleChildScrollView(
              child: Container(
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

                    // TextField 에 기본적으로 있는 border를 없애고 Container로 감싸주어
                    // richTextField 처럼 보이게 만들었다

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
                            Text(selectDate == null || selectDate == ''
                                ? formattedDate
                                : '${selectDate.split('.')[0]}년 ${selectDate.split('.')[1]}월 ${selectDate.split('.')[2]}일'),
                          ],
                        ),
                      ),
                      onPressed: () {
                        _selectDate(context, state);
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Expanded(
                    //   child: Container(),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('라벨',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: Center(
                        child: CupertinoButton(
                          color: Color(0xFF266DAC),
                          borderRadius: new BorderRadius.circular(30.0),
                          onPressed: () {
                            if (todo.text.isNotEmpty) {
                              _todoBloc.add(TodoAddPressed(
                                  id: 0,
                                  todo: todo.text,
                                  desc: description.text,
                                  date: selectDate));
                              Navigator.pop(context);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        '할 일 섹션을 반드시 채워 주세요!',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      //content: Text('Select button you want'),
                                      actions: [
                                        FlatButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            }
                          },
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Padding(padding: EdgeInsets.only(left: 5)),
                                Text(
                                  '새로운 일정 추가하기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 해당 메서드를 통하여 달력을 호출할 수가 있다.
  // 그리고 선택된 값으로 state 를 업데이트 해주는 작업이 필요하게 된다.

  Future<void> _selectDate(BuildContext context, TodoState state) async {
    DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    selectDate = DateFormat('yyyy.MM.dd').format(d);
    _todoBloc.add(AddDateChanged(date: selectDate));
  }
}
