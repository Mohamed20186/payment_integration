import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title, value;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge,
        )
      ],
    );
  }
}
