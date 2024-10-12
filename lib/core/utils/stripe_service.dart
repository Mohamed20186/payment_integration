import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/api_services.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_integration/features/checkout/presentation/widgets/payment_info_item.dart';

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
}
