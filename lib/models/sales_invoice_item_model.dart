class SalesInvoiceItem {
    final int? id;
    final int? saleId;
    final int? productId;
    final int? quantity;
    final double? price;
    final double? totalPrice;

    SalesInvoiceItem({
        this.id,
        this.saleId,
        this.productId,
        this.quantity,
        this.price,
        this.totalPrice,
    });

    factory SalesInvoiceItem.fromJson(Map<String, dynamic> json) => SalesInvoiceItem(
        id: json["id"],
        saleId: int.tryParse(json["sale_id"]),
        productId: int.tryParse(json["product_id"]),
        quantity: int.tryParse(json["quantity"]),
        price: double.tryParse(json["price"]),
        totalPrice: double.tryParse(json["total_price"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sale_id": saleId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total_price": totalPrice,
    };
}