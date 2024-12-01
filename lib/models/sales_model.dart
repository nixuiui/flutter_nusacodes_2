import 'payment_model.dart';
import 'sales_invoice_item_model.dart';

class SalesInvoice {
    final int? id;
    final int? userId;
    final double? totalPrice;
    final DateTime? saleDate;
    final List<SalesInvoiceItem>? items;
    final List<Payment>? payments;

    SalesInvoice({
        this.id,
        this.userId,
        this.totalPrice,
        this.saleDate,
        this.items,
        this.payments,
    });

    factory SalesInvoice.fromJson(Map<String, dynamic> json) => SalesInvoice(
        id: json["id"],
        userId: int.tryParse(json["user_id"]),
        totalPrice: double.tryParse(json["total_price"]),
        saleDate: json["sale_date"] == null ? null : DateTime.parse(json["sale_date"]),
        items: json["items"] == null ? [] : List<SalesInvoiceItem>.from(json["items"]!.map((x) => SalesInvoiceItem.fromJson(x))),
        payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "total_price": totalPrice,
        "sale_date": saleDate?.toIso8601String(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x.toJson())),
    };
}
