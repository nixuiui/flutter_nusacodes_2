import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_event.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState(counter: 0)) {
    on<CounterEventIncrement>((event, emit) {
      final lastCounter = state.counter;
      emit(state.copyWith(counter: lastCounter + event.countNumber));
    });

    on<CounterEventDecrement>((event, emit) {
      final lastCounter = state.counter;
      emit(state.copyWith(counter: lastCounter-1));
    });
  }

}