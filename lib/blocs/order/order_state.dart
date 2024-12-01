import 'package:equatable/equatable.dart';
import 'package:flutter_nusacodes_2/models/order_model.dart';

enum CreateInvoiceStatus {
  initial,
  loading,
  success,
  failed
}

class OrderState extends Equatable {

  final OrderModel? order;
  final bool loading;
  final CreateInvoiceStatus? status;

  const OrderState({
    this.order,
    this.status = CreateInvoiceStatus.initial,
    this.loading = false,
  });

  OrderState copyWith({
    OrderModel? order,
    CreateInvoiceStatus? status,
    bool? loading,
  }) => OrderState(
    status: status ?? this.status,
    order: order ?? this.order,
    loading: loading ?? this.loading,
  );

  @override
  List<Object?> get props => [
    status, 
    order, 
    loading, 
  ];
}