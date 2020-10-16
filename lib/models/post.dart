import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int id;
  String title;
  String body;

  Post({this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'Post { id: $id, title: $title, body: $body }';
  }
}