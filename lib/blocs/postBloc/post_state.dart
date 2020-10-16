import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoList/models/post.dart';

abstract class PostState extends Equatable {
  PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoadInProgress extends PostState {}

class PostLoadSuccess extends PostState {
  final List<Post> post;

  PostLoadSuccess({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostLoadFailure extends PostState {}