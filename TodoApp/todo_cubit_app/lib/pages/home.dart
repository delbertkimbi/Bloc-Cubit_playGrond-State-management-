import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_app/cubit/todo_cubit.dart';
import 'package:todo_cubit_app/models/tod_info.dart';
import 'package:todo_cubit_app/pages/add_todo.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Todos"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[200],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<TodoCubit, List<Todo>>(
          builder: (context, todos) {
            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(todos[index].name),
                      subtitle: Text(todos[index].timeCreated.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<TodoCubit>(context)
                              .deleteTodo(int.parse(todos[index].toString()));
                        },
                      ),
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const TodoAdd();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
