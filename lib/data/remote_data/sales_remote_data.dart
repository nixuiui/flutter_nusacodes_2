import 'package:flutter_nusacodes_2/data/remote_data/network_service/network_service.dart';
import 'package:flutter_nusacodes_2/models/sales_model.dart';

import '../../models/order_model.dart';

class SalesRemoteData {

  late final NetworkService networkService;

  SalesRemoteData(this.networkService);

  Future<List<SalesInvoice>> getSalesInvoices({
    int? page,
    int? size,
  }) async {
    final response = await networkService.get(
      url: "/api/sales/list",
      queryParameters: {
        "page": page,
        "size": size,
      }
    );
    return List<SalesInvoice>.from(
      (response.data['data']['data'] ?? []).map((x) => SalesInvoice.fromJson(x))
    );
  }

  Future<void> postCreateSales(OrderModel data) async {
    await networkService.post(
      url: "/api/sales/create",
      data: data.toJson()
    );
  }

}