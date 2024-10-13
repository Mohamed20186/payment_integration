import 'package:dartz/dartz.dart';
import 'package:payment_integration/core/errors/failure.dart';
import 'package:payment_integration/core/errors/server_failure.dart';
import 'package:payment_integration/core/utils/services/stripe_service.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/domain/repository/checkout_repo.dart';

class CheckoutRepoImp implements CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
