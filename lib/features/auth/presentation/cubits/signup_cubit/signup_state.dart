part of 'signup_cubit.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends SignupState {
  final String errorMessage;

  SignupFailure({required this.errorMessage});
}
