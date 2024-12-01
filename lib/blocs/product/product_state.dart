import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';

class ProductState extends Equatable {

  final List<Product>? products;
  final bool loading;

  const ProductState({
    this.products,
    this.loading = false,
  });

  ProductState copyWith({
    List<Product>? products,
    bool? loading,
  }) => ProductState(
    products: products ?? this.products,
    loading: loading ?? this.loading,
  );

  @override
  List<Object?> get props => [
    products, 
    loading, 
  ];
}