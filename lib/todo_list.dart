import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoList/blocs/todoBloc/bloc.dart';
import 'package:flutter_todoList/todo_add.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  TextEditingController _searchTextController;
  FocusNode _searchFocusNode;

  TodoBloc _todoBloc;

  bool _visible = true;
  String _searchText;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void addSearchValue() {
    _searchTextController.addListener(() {
      setState(() {
        _searchText = _searchTextController.text;
      });
      print(_searchText);
    });
  }

  @override
  void initState() {
    _searchTextController = TextEditingController();
    _searchFocusNode = FocusNode();
    addSearchValue();

    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.add(TodoPageLoaded());

  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.add(TodoPageLoaded());
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
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
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BlocProvider.value(
                        value: _todoBloc,
                        child: TodoAdd(),
                      )));
            },
            backgroundColor: Color(0xFF266DAC),
            mini: false,
            child: Icon(Icons.edit),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Visibility(
                  visible: _visible,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xFF266DAC),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: TextField(
                      controller: _searchTextController,
                      decoration: InputDecoration(
                          hintText: 'search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              blocBody()
            ],
          ),
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
            content: description == null
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
        });
  }

  Widget blocBody() {
    return BlocBuilder(
      bloc: _todoBloc,
      builder: (BuildContext context, TodoState state) {
        if (state.todoList.length > 0) {
          return Expanded(
              child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: ClassicHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                          itemCount: state.todoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final todo = Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.todoList[index].todo,
                                        style: TextStyle(
                                          color: state.todoList[index].checked ? Colors.blueAccent : Colors.black,
                                        ),
                                      ),
                                      Text(
                                        state.todoList[index].date,
                                        style: TextStyle(
                                          color: state.todoList[index].checked ? Colors.blueAccent : Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                ),
                            );
                            return _searchText == null || _searchText == ''
                                ? todo
                                : '${state.todoList[index].todo}'
                                  .toLowerCase()
                                  .contains(_searchText.toLowerCase())
                                    ? todo
                                    : null;
                          }),
                    )
                  ],
                // ignore: missing_return
                ),
              )));
        } else {
          return new Center(

            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
