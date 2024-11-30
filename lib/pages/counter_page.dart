import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_event.dart';
import 'package:flutter_nusacodes_2/blocs/counter/counter_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  final counterCubit = CounterCubit();
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              bloc: counterCubit,
              builder: (context, state) {
                return Text("Counter: ${state.counter}");
              }
            ),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: counterBloc,
              builder: (context, state) {
                return Text("Counter: ${state.counter}");
              }
            ),
            FilledButton(
              onPressed: () async {
                counterCubit.increment(2);
                counterBloc.add(CounterEventIncrement(2));
              }, 
              child: const Text("Increment++")
            )
          ],
        ),
      ),
    );
  }
}