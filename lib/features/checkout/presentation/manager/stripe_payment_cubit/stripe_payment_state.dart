part of 'stripe_payment_cubit.dart';

abstract class StripePaymentCubitState {}

final class StripePaymentCubitInitial extends StripePaymentCubitState {}

final class StripePaymentCubitLoading extends StripePaymentCubitState {}

final class StripePaymentCubitSuccess extends StripePaymentCubitState {}

final class StripePaymentCubitFailure extends StripePaymentCubitState {
  final String errMessage;

  StripePaymentCubitFailure({required this.errMessage});
}
