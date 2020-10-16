import 'dart:convert';

import 'package:flutter_todoList/blocs/blocs.dart';
import 'package:flutter_todoList/data/providers/provider.dart';
import 'package:flutter_todoList/models/post.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(PostState initialState) : super(initialState);

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostInitialRequested) {
      yield* _mapPostInitialToState(event);
    }
  }

  Stream<PostState> _mapPostInitialToState(PostInitialRequested event) async* {
    yield PostLoadInProgress();
    final http.Response response = await postProvider.getPostData(
        start: event.start.toString(),
        limit: event.limit.toString());

    List<Post> post = json
      .decode(utf8.decode(response.bodyBytes))
      .map<Post>((json) => Post.fromJson(json))
      .toList();

    if(post != null) {
      print('---- Success Requested Post Data ----');

      yield PostLoadSuccess(post: post);
    } else {
      print('---- Failure Requested Post Data ----');

      yield PostLoadFailure();
    }
  }

}