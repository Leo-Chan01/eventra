import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  const ForgotPasswordEmailChanged(this.email);
  final String email;

  @override
  List<Object?> get props => [email];
}

class ForgotPasswordOtpChanged extends ForgotPasswordEvent {
  const ForgotPasswordOtpChanged(this.otp);
  final String otp;

  @override
  List<Object?> get props => [otp];
}

class ForgotPasswordNewPasswordChanged extends ForgotPasswordEvent {
  const ForgotPasswordNewPasswordChanged(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}

class ForgotPasswordConfirmPasswordChanged extends ForgotPasswordEvent {
  const ForgotPasswordConfirmPasswordChanged(this.confirmPassword);
  final String confirmPassword;

  @override
  List<Object?> get props => [confirmPassword];
}

class ForgotPasswordEmailSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordEmailSubmitted();
}

class ForgotPasswordOtpSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordOtpSubmitted();
}

class ForgotPasswordResetSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordResetSubmitted();
}

class ForgotPasswordResendOtpRequested extends ForgotPasswordEvent {
  const ForgotPasswordResendOtpRequested();
}
