import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncreamented>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecreamented>((event, emit) {
      emit(state - 1);
    });
  }
}
