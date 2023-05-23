import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/api_handling/logic/cubit/post_cubit.dart';

import 'presentation/api_handling.dart';

class ApiHandling extends StatelessWidget {
  const ApiHandling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) => PostCubit(),
      child: MaterialApp(
        title: "API Handling",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const MyApp(),
      ),
    );
  }
}
