import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/infinite_list/posts/models/post_api.dart';

import '../models/post.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRefresh>((event, emit) {
      emit(PostInitial());
      add(PostFetched());
    });
    on<PostFetched>((event, emit) async {
      try {
        List<Post> posts;

        if (state is PostInitial) {
          posts = await PostApi.fetchPost(0, 10);
          emit(PostLoaded(posts: posts));
        }

        if (state is PostLoaded) {
          PostLoaded postLoadedState = state as PostLoaded;
          posts = await PostApi.fetchPost(postLoadedState.posts.length, 10);
          emit(posts.isEmpty ? PostLoaded(posts: postLoadedState.posts, hasReachedMax: true) : PostLoaded(posts: postLoadedState.posts + posts));
        }
      } on Exception catch (e) {
        print(e);
        emit(PostError());
      }
    });
  }
}
