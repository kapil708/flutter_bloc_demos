import 'package:dio/dio.dart';
import 'package:flutter_bloc_demos/api_handling/data/model/post_model.dart';
import 'package:flutter_bloc_demos/api_handling/data/repositories/api/api.dart';

class PostRepositories {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get('/posts');
      List<dynamic> postMaps = response.data;
      return postMaps.map((e) => PostModel.fromJson(e)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
