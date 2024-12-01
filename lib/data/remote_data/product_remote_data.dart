import 'package:flutter_nusacodes_2/data/remote_data/network_service/network_service.dart';
import 'package:flutter_nusacodes_2/models/product_model.dart';

class ProductRemoteData {

  late final NetworkService networkService;

  ProductRemoteData(this.networkService);

  Future<List<Product>> getProduct({
    int? page,
    int? size,
  }) async {
    final response = await networkService.get(
      url: "/api/product/list",
      queryParameters: {
        "page": page,
        "size": size,
      }
    );
    return List<Product>.from(
      (response.data['data']['data'] ?? []).map((x) => Product.fromJson(x))
    );
  }

}