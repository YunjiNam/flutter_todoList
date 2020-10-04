import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoList/blocs/todoBloc/bloc.dart';
import 'package:flutter_todoList/todo_add.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TodoBloc _todoBloc;

  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.add(TodoPageLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _todoBloc,
      listener: (BuildContext context, TodoState state) {},
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Todo List'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         BlocProvider.value(
                //           value: _todoBloc, child: TodoAdd(),)));
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
            )
          ],
        ),
        body: Column(
          children: [
            Visibility(
              visible: _visible,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  child: Text(
                    'search',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            blocBody()
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('SideBar Header'),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ListTile(
                title: Text('Todo List'),
                leading: FlutterLogo(),
                selected: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ListTile(
                title: Text('one-line with trailing widget'),
                trailing: Icon(Icons.more_vert),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Card(
                child: ListTile(
                  title: Text('One-line ListTile'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('two-line ListTile'),
                  subtitle: Text('subTitle line'),
                  leading: Icon(Icons.thumbs_up_down),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Divider(
                color: Colors.blue,
              ),
              AboutListTile(
                applicationName: 'Drawer Demo',
                applicationIcon: FlutterLogo(),
                applicationVersion: '1.0',
                applicationLegalese: 'Free',
              ),
              Container(
                color: Colors.lightBlue[200],
                height: 50.0,
                  child: FlatButton(
                    child: Text('Close Drawer'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String title, String description) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: description?.isEmpty ?? true
            ? Text('부가적인 설명을 적지 않았습니다.')
            : Text(description),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            )
          ],
        );
      }
    );
  }

  Widget blocBody() {
    return BlocBuilder(
      bloc: _todoBloc,
      builder: (BuildContext context, TodoState state) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                  itemCount: state.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.todoList[index].todo),
                      onTap: () {
                        _showDialog(state.todoList[index].todo,
                            state.todoList[index].desc);
                      },
                      leading: Checkbox(
                        value: state.todoList[index].checked,
                        onChanged: (bool newValue) {
                          _todoBloc.add(TodoListCheck(index: index));
                        },
                      ),
                    );
                  }
              ),
            )
          ],
        );
      },
    );
  }

}
