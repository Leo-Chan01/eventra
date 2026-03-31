import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.rememberMe = false,
    this.status = LoginStatus.initial,
    this.errorMessage,
    this.method = 'email',
  });

  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool rememberMe;
  final LoginStatus status;
  final String? errorMessage;
  final String method;

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? rememberMe,
    LoginStatus? status,
    String? errorMessage,
    String? method,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      method: method ?? this.method,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isPasswordVisible,
        rememberMe,
        status,
        errorMessage,
        method,
      ];
}
