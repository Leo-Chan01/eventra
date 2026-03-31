import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);
  final String email;

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginPasswordVisibilityToggled extends LoginEvent {
  const LoginPasswordVisibilityToggled();
}

class LoginRememberMeToggled extends LoginEvent {
  const LoginRememberMeToggled();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginMethodChanged extends LoginEvent {
  const LoginMethodChanged(this.method);
  final String method;

  @override
  List<Object?> get props => [method];
}
