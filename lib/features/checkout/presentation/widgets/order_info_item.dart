import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  OrderInfoItem({super.key, required this.title, required this.value});
  String title, value;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: theme.textTheme.bodySmall),
          Text(value, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
