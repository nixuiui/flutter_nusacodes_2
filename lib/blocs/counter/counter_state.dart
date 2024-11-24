import 'package:equatable/equatable.dart';

class CounterState extends Equatable {

  final int counter;

  const CounterState({
    required this.counter
  });

  CounterState copyWith({
    int? counter
  }) => CounterState(
    counter: counter ?? this.counter
  );

  @override
  List<Object?> get props => [
    counter,
  ];

}