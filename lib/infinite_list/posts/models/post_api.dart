import 'dart:convert';

import 'package:flutter_bloc_demos/infinite_list/posts/models/post.dart';
import 'package:http/http.dart' as http;

class PostApi {
  static Future<List<Post>> fetchPost(int start, int limit) async {
    final response = await http.get(
      Uri.https(
        "https://jsonplaceholder.typicode.com/",
        "/Posts",
        {"_start": "$start", "_limit": "$limit"},
      ),
    );

    if (response.statusCode != 200) {
      throw Expando("Failed");
    }

    final json = jsonDecode(response.body) as List;
    return json.map<Post>((post) => Post.fromJson(post)).toList();
  }
}
