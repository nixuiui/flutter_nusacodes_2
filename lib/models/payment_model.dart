class Payment {
    final int? id;
    final int? userId;
    final int? saleId;
    final double? amount;
    final String? paymentMethod;

    Payment({
        this.id,
        this.userId,
        this.saleId,
        this.amount,
        this.paymentMethod,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        userId: int.tryParse(json["user_id"]),
        saleId: int.tryParse(json["sale_id"]),
        amount: double.tryParse(json["amount"]),
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sale_id": saleId,
        "amount": amount,
        "payment_method": paymentMethod,
    };
}