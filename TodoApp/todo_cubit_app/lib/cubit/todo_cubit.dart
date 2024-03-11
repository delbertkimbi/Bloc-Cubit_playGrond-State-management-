import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_app/models/tod_info.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = Todo(
      name: title,
      timeCreated: DateTime.now().toLocal(),
    );
    emit([...state, todo]);
  }

  void deleteTodo(int index) {
    emit([...state.sublist(0, index), ...state.sublist(index + 1)]);
  }
}
