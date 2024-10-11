import 'package:flutter/material.dart';

import '../utils/colors_palette.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    required this.onPressed,
    required this.text,
    super.key,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsPalette.primaryColor,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
