import 'package:flutter/material.dart';

import 'posts/view/post_page.dart';

class InfiniteList extends StatelessWidget {
  const InfiniteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Infinite List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PostPage(),
    );
  }
}
