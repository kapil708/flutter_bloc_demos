import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<MultiCounterCubit, MultiCounterState>(
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
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "Screen 1 add",
                  onPressed: () {
                    BlocProvider.of<MultiCounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "Screen 1 remove",
                  onPressed: () {
                    context.read<MultiCounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: const Text("Screen 2"),
            ),
          ],
        ),
      ),
    );
  }
}
