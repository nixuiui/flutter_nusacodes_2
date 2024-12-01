import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/sales_invoice/sales_invoice_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/sales_invoice/sales_invoice_state.dart';
import 'package:flutter_nusacodes_2/helpers/helper.dart';
import 'package:intl/intl.dart';

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
        title: const Text("Sales Invoice Tab"),
      ),
      body: BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: context.read<SalesInvoiceCubit>().loadData,
            child: ListView.separated(
              itemCount: state.salesInvoices?.length ?? 0,
              separatorBuilder: (context, indext) => const Divider(), 
              itemBuilder: (context, index) => ListTile(
                title: Text("INV-${state.salesInvoices![index].id}"),
                subtitle: Text(
                  DateFormat('EEE, dd MMMM y').format(state.salesInvoices![index].saleDate!)
                ),
                trailing: Text(
                  formatRupiah(state.salesInvoices![index].totalPrice),
                  style: const TextStyle(
                    color: Colors.green
                  ),
                ),
              ), 
            ),
          );
        }
      ),
    );
  }
}