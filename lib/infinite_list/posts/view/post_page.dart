import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/infinite_list/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc_demos/infinite_list/posts/bloc/post_event.dart';
import 'package:flutter_bloc_demos/infinite_list/posts/bloc/post_state.dart';

import 'post_list.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post list")),
      body: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(PostFetched()),
        child: const PostBody(),
      ),
    );
  }
}

class PostBody extends StatefulWidget {
  const PostBody({Key? key}) : super(key: key);

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  final ScrollController _scrollController = ScrollController();
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();

    _postBloc = context.read<PostBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      // if post is initial
      if (state is PostInitial) {
        return const Center(child: CircularProgressIndicator());
      }

      // if post is loaded
      if (state is PostLoaded) {
        if (state.posts.isEmpty) {
          return const Center(child: Text("No Post"));
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: PostList(
            scrollController: _scrollController,
            state: state,
          ),
        );
      }

      // if post is error
      return const Text("Failed to fetch post");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _onRefresh() async {
    _postBloc.add(PostRefresh());
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) _postBloc.add(PostFetched());
  }
}
