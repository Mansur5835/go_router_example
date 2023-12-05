import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterInk>((event, emit) {
      _ink(emit, event.newValue);
    });
    on<CounterDec>((event, emit) {
      _dec(emit);
    });
  }

  void _ink(Emitter emit, int? newValue) {
    if (newValue == null)
      emit((state + 1));
    else
      emit(newValue);
  }

  void _dec(Emitter emit) {
    emit((state - 1));
  }
}
