import 'package:flutter/material.dart';
import 'package:payment_integration/core/routes/page_route_name.dart';
import 'package:payment_integration/features/checkout/data/repository/checkout_repo_imp.dart';
import 'package:payment_integration/features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:payment_integration/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'order_info_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Image.asset(
              'assets/images/basket_image.png',
              scale: 0.9,
            ),
          ),
          const SizedBox(height: 25),
          OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          OrderInfoItem(
            title: 'Discount',
            value: '0',
          ),
          OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1,
            color: Color(0xffC7C7C7),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: theme.textTheme.bodyMedium),
              Text(r'$50.97', style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 40),
          CustomElevatedButton(
            text: 'Complete Payment',
            onPressed: () => showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        StripePaymentCubit(checkoutRepo: CheckoutRepoImp()),
                    child: const PaymentMethodsBottomSheet(),
                  );
                }),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
