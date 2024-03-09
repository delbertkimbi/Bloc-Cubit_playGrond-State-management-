import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // Sets the initial value
  //The emit function is like notifyListeners() in Provider.
  //emit is a protectected function and cannot be used of the cubit class
  void increment() => emit(state + 2);
  void decrement() => emit(state - 1);
}
