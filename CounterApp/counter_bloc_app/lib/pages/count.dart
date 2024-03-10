import 'package:counter_bloc_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterBlocPage'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(builder: (context, counter) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterIncreamented());
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterDecreamented());
                },
                child: const Icon(Icons.minimize),
              )
            ],
          );
        }),
      ),
    );
  }
}
