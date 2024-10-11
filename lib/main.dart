import 'package:flutter/material.dart';
import 'package:payment_integration/core/routes/page_route_name.dart';
import 'package:payment_integration/core/routes/route_generator.dart';
import 'core/utils/app_theme_manager.dart';

void main() {
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
