import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus { initial, loading, success, failure }

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
    required this.status,
    this.errorMessage,
  });

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState(
      email: '',
      otp: '',
      newPassword: '',
      confirmPassword: '',
      status: ForgotPasswordStatus.initial,
    );
  }

  final String email;
  final String otp;
  final String newPassword;
  final String confirmPassword;
  final ForgotPasswordStatus status;
  final String? errorMessage;

  ForgotPasswordState copyWith({
    String? email,
    String? otp,
    String? newPassword,
    String? confirmPassword,
    ForgotPasswordStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        otp,
        newPassword,
        confirmPassword,
        status,
        errorMessage,
      ];
}
