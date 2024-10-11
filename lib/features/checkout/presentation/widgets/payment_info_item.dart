import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall,
        ),
        Text(
          value,
          style:
              theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
