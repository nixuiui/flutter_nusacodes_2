import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/helpers/helper.dart';
import 'package:flutter_nusacodes_2/models/order_model.dart';

class ProductItemSummaryWidget extends StatelessWidget {

  final OrderItem orderItem;

  const ProductItemSummaryWidget({
    super.key,
    required this.orderItem
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              child: Text('P'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.product?.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${orderItem.quantity}x Rp ${formatRupiah(orderItem.pricePerItem)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}