class CounterEvent {}

class CounterEventIncrement extends CounterEvent {

  final int countNumber;

  CounterEventIncrement(this.countNumber);

}

class CounterEventDecrement extends CounterEvent {}