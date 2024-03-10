part of 'counter_bloc.dart';

sealed class CounterEvent {}

class CounterIncreamented extends CounterEvent {}

class CounterDecreamented extends CounterEvent {}
