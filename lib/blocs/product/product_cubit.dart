import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/product/product_state.dart';
import 'package:flutter_nusacodes_2/data/remote_data/product_remote_data.dart';

class ProductCubit extends Cubit<ProductState> {

  late final ProductRemoteData productRemoteData;

  ProductCubit(
    this.productRemoteData
  ) : super(const ProductState());

  Future<void> loadData() async {
    emit(state.copyWith(loading: true));
    
    try {
      final response = await productRemoteData.getProduct(
        page: 1,
        size: 20
      );
      emit(state.copyWith(
        loading: false,
        products: response
      ));
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        loading: false
      ));
    }
  }

}