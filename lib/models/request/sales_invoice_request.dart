class SalesInvoiceRequest {
    final List<Item>? items;
    final int? paymentAmount;
    final String? paymentMethod;

    SalesInvoiceRequest({
        this.items,
        this.paymentAmount,
        this.paymentMethod,
    });

    factory SalesInvoiceRequest.fromJson(Map<String, dynamic> json) => SalesInvoiceRequest(
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        paymentAmount: json["payment_amount"],
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "payment_amount": paymentAmount,
        "payment_method": paymentMethod,
    };
}

class Item {
    final int? productId;
    final int? qty;
    final int? pricePerItem;

    Item({
        this.productId,
        this.qty,
        this.pricePerItem,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        qty: json["qty"],
        pricePerItem: json["price_per_item"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "qty": qty,
        "price_per_item": pricePerItem,
    };
}