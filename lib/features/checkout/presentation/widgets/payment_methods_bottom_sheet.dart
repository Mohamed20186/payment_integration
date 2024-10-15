import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/core/routes/page_route_name.dart';
import 'package:payment_integration/core/widgets/custom_elevated_button.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';

import 'payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          CustomElevatedButtonBlocConsumer(),
        ],
      ),
    );
  }
}

class CustomElevatedButtonBlocConsumer extends StatelessWidget {
  const CustomElevatedButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentCubitState>(
      listener: (context, state) {
        if (state is StripePaymentCubitSuccess) {
          Navigator.pushReplacementNamed(context, PageRouteName.thankYouView);
        }
        if (state is StripePaymentCubitFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text(state.errMessage),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          text: 'Continue',
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: 'cus_R1wp3E49e2MDnI');
            BlocProvider.of<StripePaymentCubit>(context)
                .execute(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is StripePaymentCubitLoading ? true : false,
        );
      },
    );
  }
}
