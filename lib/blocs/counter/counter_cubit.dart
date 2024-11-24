import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(const CounterState(counter: 0));

  void increment() {
    final lastCounter = state.counter;
    emit(state.copyWith(counter: lastCounter+1));
  }

  void decrement() {
    final lastCounter = state.counter;
    emit(state.copyWith(counter: lastCounter-1));
  }

}