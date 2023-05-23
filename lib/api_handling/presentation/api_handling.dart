import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/api_handling/data/model/post_model.dart';
import 'package:flutter_bloc_demos/api_handling/logic/cubit/post_cubit.dart';
import 'package:flutter_bloc_demos/api_handling/logic/cubit/post_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api Handling")),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) return const Center(child: CircularProgressIndicator());

          if (state is PostErrorState) return Text(state.error);

          if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                PostModel post = state.posts[index];
                return ListTile(
                  title: Text("${post.title}"),
                  subtitle: Text("${post.body}"),
                );
              },
            );
          }

          return Text(
            "No Data Found!",
            style: Theme.of(context).textTheme.headlineSmall,
          );
        },
      ),
    );
  }
}
