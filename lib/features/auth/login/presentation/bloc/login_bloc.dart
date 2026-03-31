import 'dart:async';
import 'package:eventra/core/routing/app_router.dart';
import 'package:eventra/features/auth/login/presentation/bloc/login_event.dart';
import 'package:eventra/features/auth/login/presentation/bloc/login_state.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginRememberMeToggled>(_onRememberMeToggled);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginMethodChanged>(_onMethodChanged);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onPasswordVisibilityToggled(
    LoginPasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onRememberMeToggled(
    LoginRememberMeToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    // Simulated login logic
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: LoginStatus.success));
    AppRouter.router.goNamed(HomePage.name);
  }

  void _onMethodChanged(
    LoginMethodChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(method: event.method));
  }
}
