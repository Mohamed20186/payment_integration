import 'package:flutter/material.dart';

import '../utils/theme/colors_palette.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
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
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
    );
  }
}
