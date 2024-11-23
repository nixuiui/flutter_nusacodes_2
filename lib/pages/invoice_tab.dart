import 'package:flutter/material.dart';

class InvoiceTab extends StatefulWidget {
  const InvoiceTab({super.key});

  @override
  State<InvoiceTab> createState() => _InvoiceTabState();
}

class _InvoiceTabState extends State<InvoiceTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Invoice Tab"),
      ),
      body: ListView.separated(
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
      ),
    );
  }
}