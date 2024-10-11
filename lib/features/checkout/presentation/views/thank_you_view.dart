
import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';
import '../widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(theme: theme, title: '' , onPressed: (){}),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}
