import 'package:flutter/material.dart';
import 'package:flutter_bloc_demos/infinite_list/posts/bloc/post_state.dart';

import '../widgets/bottom_loader.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
    required this.scrollController,
    required this.state,
  }) : super(key: key);

  final ScrollController scrollController;
  final PostLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      separatorBuilder: (context, index) => const Divider(thickness: 1),
      itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
      itemBuilder: (context, index) {
        if (index >= state.posts.length) return const BottomLoader();

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
          leading: Text(state.posts[index].id.toString()),
          title: Text(
            state.posts[index].title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            state.posts[index].body,
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
