part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final SignupResModel signupResModel;
  SignupSuccess(this.signupResModel);
}

final class SignupError extends SignupState {
  final String errMessage;
  SignupError(this.errMessage);
}
