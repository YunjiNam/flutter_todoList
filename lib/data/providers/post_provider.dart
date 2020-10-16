import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

PostProvider postProvider = PostProvider();

class PostProvider {
  Future<http.Response> getPostData({
    @required String start,
    @required String limit,
  }) async {
    try {
      final http.Response response = await http.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit',
      );

      if (response.statusCode == 200) {
        return response;
      }
    } catch (e, stacktrace) {
      print('---- Error: $e ----');
      print('---- Error: $stacktrace ----');
      return null;
    }
  }
}