import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/bloc_to_bloc/constants/enums.dart';
import 'package:flutter_bloc_demos/bloc_to_bloc/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_demos/bloc_to_bloc/logic/cubit/internet_state.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Screen")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
                    return Text(
                      "Wifi",
                      style: Theme.of(context).textTheme.displaySmall,
                    );
                  } else if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
                    return Text(
                      "Mobile",
                      style: Theme.of(context).textTheme.displaySmall,
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      "Disconnected",
                      style: Theme.of(context).textTheme.displaySmall,
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 20),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  String text = "";
                  if (state.wasIncremented == true) {
                    text = "Incremented!";
                  } else if (state.wasIncremented == false) {
                    text = "Decremented!";
                  }

                  final snackBar = SnackBar(content: Text(text));

                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                },
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 50),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
