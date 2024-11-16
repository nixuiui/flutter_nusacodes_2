import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {

  final int counter;
  final String? description;
  final Function()? onPressed;
  
  const CounterWidget({
    super.key,
    required this.counter,
    this.description,
    this.onPressed
  });

  String hello(String name) {
    return "Hello, $name";
  }

  Widget buildNumber() {
    return Text('$counter');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed?.call,
      child: Container(
        color: Colors.green,
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hello('Niki')),
            Text(
              description ?? 'Counter number:',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.lineThrough
              ),
            ),
            buildNumber(),
          ],
        ),
      ),
    );
  }
}