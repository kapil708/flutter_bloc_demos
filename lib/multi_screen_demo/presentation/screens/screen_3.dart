import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/multi_screen_demo/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<MultiCounterCubit, MultiCounterState>(
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
                  heroTag: "Screen 3 add",
                  backgroundColor: Colors.green,
                  onPressed: () {
                    BlocProvider.of<MultiCounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "Screen 3 remove",
                  backgroundColor: Colors.green,
                  onPressed: () {
                    context.read<MultiCounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
