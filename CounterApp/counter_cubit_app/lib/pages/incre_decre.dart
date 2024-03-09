import 'package:counter_cubit_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncreamentDecremetPage extends StatelessWidget {
  const IncreamentDecremetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter Operations"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder(
                bloc: counterCubit,
                builder: (context, counter) {
                  return Text(
                    "$counter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[400],
                      fontSize: 30,
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => counterCubit.increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Decreaments only when the state is greater than zero
                    counterCubit.state == 0 ? Null : counterCubit.decrement();
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.minimize),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
