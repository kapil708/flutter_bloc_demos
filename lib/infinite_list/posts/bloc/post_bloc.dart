import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/infinite_list/posts/models/post_api.dart';

import '../models/post.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield await _mapPostToState(state);
    }

    if (event is PostRefresh) {
      yield PostInitial();

      yield await _mapPostToState(state);
    }
  }

  Future<PostState> _mapPostToState(PostState state) async {
    List<Post> posts;

    try {
      if (state is PostInitial) {
        posts = await PostApi.fetchPost(0, 10);
        return PostLoaded(posts: posts);
      }

      PostLoaded postLoaded = state as PostLoaded;
      posts = await PostApi.fetchPost(postLoaded.posts.length, 10);
      return posts.isEmpty ? state.copyWith(hasReachedMax: true) : state.copyWith(posts: postLoaded.posts + posts);
    } on Exception catch (_) {
      return PostError();
    }
  }
}
