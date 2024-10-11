import 'package:flutter/material.dart';
import 'package:payment_integration/core/widgets/build_app_bar.dart';

import '../widgets/my_card_view_body.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(
        theme: theme,
        title: ' My Cart',
        onPressed: () {},
      ),
      body: const MyCardViewBody(),
    );
  }
}
