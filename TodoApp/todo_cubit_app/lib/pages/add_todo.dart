import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_app/cubit/todo_cubit.dart';

class TodoAdd extends StatelessWidget {
  const TodoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        centerTitle: true,
        backgroundColor: Colors.redAccent[200],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Todo',
              ),
              controller: todoController,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(context)
                    .addTodo(todoController.text.trim());
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
