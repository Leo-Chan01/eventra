import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState.initial()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordOtpChanged>(_onOtpChanged);
    on<ForgotPasswordNewPasswordChanged>(_onNewPasswordChanged);
    on<ForgotPasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ForgotPasswordEmailSubmitted>(_onEmailSubmitted);
    on<ForgotPasswordOtpSubmitted>(_onOtpSubmitted);
    on<ForgotPasswordResetSubmitted>(_onResetSubmitted);
    on<ForgotPasswordResendOtpRequested>(_onResendOtpRequested);
  }

  void _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onOtpChanged(
    ForgotPasswordOtpChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(otp: event.otp));
  }

  void _onNewPasswordChanged(
    ForgotPasswordNewPasswordChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(newPassword: event.password));
  }

  void _onConfirmPasswordChanged(
    ForgotPasswordConfirmPasswordChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onEmailSubmitted(
    ForgotPasswordEmailSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    // In real app: await repository.requestOtp(state.email);
    emit(state.copyWith(status: ForgotPasswordStatus.success));
  }

  void _onOtpSubmitted(
    ForgotPasswordOtpSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    // In real app: await repository.verifyOtp(state.email, state.otp);
    emit(state.copyWith(status: ForgotPasswordStatus.success));
  }

  void _onResetSubmitted(
    ForgotPasswordResetSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    // In real app: await repository.resetPassword(
    //   state.email,
    //   state.otp,
    //   state.newPassword,
    // );
    emit(state.copyWith(status: ForgotPasswordStatus.success));
  }

  void _onResendOtpRequested(
    ForgotPasswordResendOtpRequested event,
    Emitter<ForgotPasswordState> emit,
  ) {
    // Logic for resending OTP
  }
}
