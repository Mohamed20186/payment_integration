import 'package:flutter/material.dart';
import 'package:payment_integration/core/routes/page_route_name.dart';
import 'package:payment_integration/features/checkout/presentation/views/my_card_view.dart';
import 'package:payment_integration/features/checkout/presentation/views/thank_you_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.myCardView:
        return MaterialPageRoute(
          builder: (context) => const MyCardView(),
          settings: settings,
        );
      case PageRouteName.thankYouView:
        return MaterialPageRoute(
          builder: (context) => const ThankYouView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MyCardView(),
          settings: settings,
        );
    }
  }
}
