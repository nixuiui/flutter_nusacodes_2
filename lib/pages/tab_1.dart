import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (context, indext) => const Divider(), 
      itemBuilder: (context, index) => ListTile(
        title: Text("INV-${index+1}"),
        subtitle: const Text("Pembelian Motor RX King"),
        trailing: const Text(
          "Rp 20.000.000",
          style: TextStyle(
            color: Colors.green
          ),
        ),
      ), 
    );
  }
}