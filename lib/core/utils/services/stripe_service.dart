import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/services/api_services.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiServices.post(
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretKey,
        url: 'https://api.stripe.com/v1/payment_intents');

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Mohamed ahmed',
          paymentIntentClientSecret: paymentIntentClientSecret),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}




