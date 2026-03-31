import 'package:eventra/features/auth/setup_pin/presentation/bloc/setup_pin_event.dart';
import 'package:eventra/features/auth/setup_pin/presentation/bloc/setup_pin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupPinBloc extends Bloc<SetupPinEvent, SetupPinState> {
  SetupPinBloc() : super(SetupPinState.initial()) {
    on<SetupPinDigitPressed>(_onDigitPressed);
    on<SetupPinBackspacePressed>(_onBackspacePressed);
    on<SetupPinSubmitted>(_onSubmitted);
  }

  void _onDigitPressed(
    SetupPinDigitPressed event,
    Emitter<SetupPinState> emit,
  ) {
    if (state.pin.length < 4) {
      final newPin = state.pin + event.digit;
      emit(state.copyWith(pin: newPin));
      
      if (newPin.length == 4) {
        add(const SetupPinSubmitted());
      }
    }
  }

  void _onBackspacePressed(
    SetupPinBackspacePressed event,
    Emitter<SetupPinState> emit,
  ) {
    if (state.pin.isNotEmpty) {
      emit(state.copyWith(pin: state.pin.substring(0, state.pin.length - 1)));
    }
  }

  void _onSubmitted(SetupPinSubmitted event, Emitter<SetupPinState> emit) {
    emit(state.copyWith(status: SetupPinStatus.loading));
    // In real app: await repository.setupPin(state.pin);
    emit(state.copyWith(status: SetupPinStatus.success));
  }
}
