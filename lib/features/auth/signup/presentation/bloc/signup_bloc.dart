import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<SignupStarted>(_onStarted);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupSubmitted>(_onSubmitted);
  }

  void _onStarted(SignupStarted event, Emitter<SignupState> emit) {
    emit(state.copyWith(accountType: event.accountType));
  }

  void _onEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onSubmitted(SignupSubmitted event, Emitter<SignupState> emit) {
    emit(state.copyWith(isLoading: true));
  }
}
