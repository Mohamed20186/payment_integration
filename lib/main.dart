import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/routes/page_route_name.dart';
import 'package:payment_integration/core/routes/route_generator.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'core/utils/theme/app_theme_manager.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PageRouteName.myCardView,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
    );
  }
}
