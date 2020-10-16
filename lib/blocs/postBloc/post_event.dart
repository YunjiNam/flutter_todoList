import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PostEvent extends Equatable {
  PostEvent();

  @override
  List<Object> get props => throw UnimplementedError();
}

class PostInitialRequested extends PostEvent {
  final String start;
  final String limit;

  PostInitialRequested({
    @required this.start,
    @required this.limit,
  }) : assert(start != null, limit != null);

  @override
  List<Object> get props => [start, limit];
}