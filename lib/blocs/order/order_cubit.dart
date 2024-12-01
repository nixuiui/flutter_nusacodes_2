import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/order/order_state.dart';
import 'package:flutter_nusacodes_2/data/remote_data/sales_remote_data.dart';
import 'package:flutter_nusacodes_2/models/order_model.dart';
import 'package:flutter_nusacodes_2/models/product_model.dart';

class OrderCubit extends Cubit<OrderState> {

  late final SalesRemoteData salesRemoteData;

  OrderCubit(this.salesRemoteData) : super(const OrderState());

  void addProduct(Product product) {
    final orderItem = OrderItem(
      productId: product.id,
      quantity: 1,
      pricePerItem: product.price,
      product: product
    );

    if(state.order == null) {
      final newOrder = OrderModel(
        items: [orderItem]
      );
      emit(state.copyWith(order: newOrder));
    } else {
      final updatedItems = List<OrderItem>.from(state.order?.items ?? [])..add(orderItem);
      final updatedOrder = state.order!.copyWith(items: updatedItems);
      emit(state.copyWith(order: updatedOrder));
    }
  }

  void updateQtyProduct({
    required int productId,
    required int qty,
  }) {

  }

  Future<void> createInvoice({
    required int paymentAmount,
    required String paymentMethod,
  }) async {
    emit(state.copyWith(status: CreateInvoiceStatus.loading));
    try {
      final order = OrderModel(
        items: state.order?.items,
        paymentAmount: paymentAmount,
        paymentMethod: paymentMethod,
      );

      await salesRemoteData.postCreateSales(order);
      emit(state.copyWith(status: CreateInvoiceStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: CreateInvoiceStatus.failed,
      ));
    }
  }

}