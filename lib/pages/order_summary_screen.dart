import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/order/order_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/order/order_state.dart';
import 'package:flutter_nusacodes_2/components/product_item_summary_widget.dart';
import 'package:flutter_nusacodes_2/helpers/helper.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {

  final paymentAmountController = TextEditingController();
  var paymentMethod = 'cash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if(state.status == CreateInvoiceStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Berhasil Membuat Invoice")
          ));
          Navigator.pop(context);
        } else if(state.status == CreateInvoiceStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Gagal Membuat Invoice")
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pesanan'),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.order?.items?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 12), 
              itemBuilder: (context, index) => ProductItemSummaryWidget(
                orderItem: state.order!.items![index],
              ), 
            );
          }
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Text(
                    'Total ${formatRupiah(state.order?.totalPrice)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: paymentAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Jumlah Pembayaran'
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                items: const [
                  DropdownMenuItem(
                    value: 'transfer',
                    child: Text('Transfer'),
                  ),
                  DropdownMenuItem(
                    value: 'cash',
                    child: Text('Cash'),
                  ),
                ], 
                onChanged: (value) {
                  if(value != null) {
                    paymentMethod = value;
                  }
                }
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    final isLoading = state.status == CreateInvoiceStatus.loading;
                    return FilledButton(
                      onPressed: !isLoading ? () {
                        context.read<OrderCubit>().createInvoice(
                          paymentAmount: int.parse(paymentAmountController.text), 
                          paymentMethod: paymentMethod
                        );
                      } : null, 
                      child: Text(isLoading ? 'Loading' : 'Bayar'),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}