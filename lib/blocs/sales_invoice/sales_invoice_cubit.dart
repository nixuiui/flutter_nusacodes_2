import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/sales_invoice/sales_invoice_state.dart';
import 'package:flutter_nusacodes_2/data/remote_data/sales_remote_data.dart';

class SalesInvoiceCubit extends Cubit<SalesInvoiceState> {

  late final SalesRemoteData salesRemoteData;

  SalesInvoiceCubit(
    this.salesRemoteData
  ) : super(const SalesInvoiceState());

  Future<void> loadData() async {
    emit(state.copyWith(loading: true));
    
    try {
      final response = await salesRemoteData.getSalesInvoices(
        page: 1,
        size: 20
      );
      emit(state.copyWith(
        loading: false,
        salesInvoices: response
      ));
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        loading: false
      ));
    }
  }

}