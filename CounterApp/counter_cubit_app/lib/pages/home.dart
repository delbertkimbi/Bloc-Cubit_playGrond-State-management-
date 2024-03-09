import 'package:counter_cubit_app/cubit/counter_cubit.dart';
import 'package:counter_cubit_app/pages/incre_decre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Incereamented the following times:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            BlocBuilder<CounterCubit, int>(
                bloc: counterCubit,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[400],
                      fontSize: 30,
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const IncreamentDecremetPage(),
            ),
          );
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
