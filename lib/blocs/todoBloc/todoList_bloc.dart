import 'package:bloc/bloc.dart';
import 'package:flutter_todoList/models/todo_model.dart';
import 'package:flutter_todoList/blocs/todoBloc/bloc.dart';

class TodoBloc extends Bloc<TodoListEvent, TodoState> {
  @override
  TodoState get initialState => TodoState.empty();

  @override
  Stream<TodoState> mapEventToState(TodoListEvent event) async* {
    if (event is TodoPageLoaded) {
      yield* _mapTodoPageLoadedToState();
    } else if (event is TodoListCheck) {
      yield* _mapTodoListCheckToState(event.index);
    } else if (event is AddDateChanged) {
      yield* _mapAddDateChangedToState(event.date);
    } else if (event is TodoAddPressed) {
      yield* _mapTodoAddPressedToState(
        event.id, event.todo, event.date, event.desc);
    }
  }

  Stream<TodoState> _mapTodoPageLoadedToState() async* {
    yield state.update(todoList: state.todoList);
  }

  Stream<TodoState> _mapTodoListCheckToState(int index) async* {
    Todo currentTodo = Todo(
      id: state.todoList[index].id,
      todo: state.todoList[index].todo,
      date: state.todoList[index].date,
      desc: state.todoList[index].desc,
      checked: state.todoList[index].checked == true ? false : true);

    List<Todo> cTodoList = state.todoList;
    cTodoList[index] = currentTodo;
    yield state.update(todoList: cTodoList);
  }

  Stream<TodoState> _mapAddDateChangedToState(String date) async* {
    yield state.update(date: date);
  }

  Stream<TodoState> _mapTodoAddPressedToState(
      int id, String todo, String date, String desc) async* {
    Todo newTodo =
        Todo(id: id, todo: todo, date: date, desc: desc, checked: false);
    List<Todo> currentTodo = state.todoList;
    currentTodo.add(newTodo);

    yield state.update(todoList: currentTodo);
  }
}