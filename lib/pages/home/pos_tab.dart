import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/order/order_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/order/order_state.dart';
import 'package:flutter_nusacodes_2/blocs/product/product_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/product/product_state.dart';
import 'package:flutter_nusacodes_2/components/product_item_widget.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';
import 'package:flutter_nusacodes_2/helpers/helper.dart';

class PosTab extends StatefulWidget {
  const PosTab({super.key});

  @override
  State<PosTab> createState() => _PosTabState();
}

class _PosTabState extends State<PosTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pos'),
      ),
      body: Stack(
        children: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if(state.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return RefreshIndicator(
                onRefresh: context.read<ProductCubit>().loadData,
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 200
                  ),
                  itemCount: state.products?.length ?? 0,
                  separatorBuilder: (context, index) => const SizedBox(height: 12), 
                  itemBuilder: (context, index) => ProductItemWidget(
                    product: state.products![index],
                    onAddProduct: context.read<OrderCubit>().addProduct,
                  ), 
                ),
              );
            }
          ),
          _buildOrderSummary(context),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return Positioned(
      left: 16,
      bottom: 16,
      right: 16,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.orderSummaryScreen);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16)
          ),
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.order?.items?.length ?? 0} Produk dipilih',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer
                        ),
                      ),
                      Text(
                        formatRupiah(state.order?.totalPrice),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}