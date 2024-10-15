import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/services/api_services.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

import '../../../features/checkout/data/models/ephemeral/ephemeral _key.dart';
import '../../../features/checkout/data/models/init_payment_sheet_input_model.dart';

class StripeService {
  ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiServices.post(
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiServices.post(
        body: {'customer': customerId},
        token: ApiKeys.secretKey,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2024-09-30.acacia',
        });

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
          merchantDisplayName: 'Mohamed ahmed',
          customerId: initPaymentSheetInputModel.customerId,
          paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);

    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }
}
