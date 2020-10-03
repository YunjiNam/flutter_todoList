import 'package:meta/meta.dart';

class Todo {
  final int id;
  final String todo;
  final String desc;
  final String date;
  final bool checked;

  Todo({
    @required this.id,
    @required this.todo,
    @required this.desc,
    @required this.date,
    @required this.checked,
  });
}