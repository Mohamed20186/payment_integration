import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/repository/checkout_repo_imp.dart';
import 'package:payment_integration/features/checkout/domain/repository/checkout_repo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentCubitState> {
  StripePaymentCubit() : super(StripePaymentCubitInitial());

  final CheckoutRepo checkoutRepo = CheckoutRepoImp();

  Future<void> execute(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentCubitLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (l) => emit(StripePaymentCubitFailure(errMessage: l.errMessage)),
      (r) => emit(StripePaymentCubitSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentCubitState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
