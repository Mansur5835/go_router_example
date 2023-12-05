part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterInk extends CounterEvent {
  int? newValue;
  CounterInk(this.newValue);
}

class CounterDec extends CounterEvent {}
