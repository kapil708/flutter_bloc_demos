import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/api_handling/data/model/post_model.dart';
import 'package:flutter_bloc_demos/api_handling/data/repositories/post_repositories.dart';
import 'package:flutter_bloc_demos/api_handling/logic/cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepositories postRepositories = PostRepositories();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepositories.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
