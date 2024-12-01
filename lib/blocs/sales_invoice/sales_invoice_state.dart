import 'package:equatable/equatable.dart';
import 'package:flutter_nusacodes_2/models/sales_model.dart';

class SalesInvoiceState extends Equatable {

  final List<SalesInvoice>? salesInvoices;
  final bool loading;

  const SalesInvoiceState({
    this.salesInvoices,
    this.loading = false,
  });

  SalesInvoiceState copyWith({
    List<SalesInvoice>? salesInvoices,
    bool? loading,
  }) => SalesInvoiceState(
    salesInvoices: salesInvoices ?? this.salesInvoices,
    loading: loading ?? this.loading,
  );

  @override
  List<Object?> get props => [
    salesInvoices, 
    loading, 
  ];
}