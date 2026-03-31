import 'package:equatable/equatable.dart';

enum SetupPinStatus { initial, loading, success, failure }

class SetupPinState extends Equatable {
  const SetupPinState({
    required this.pin,
    required this.status,
    this.errorMessage,
  });

  factory SetupPinState.initial() {
    return const SetupPinState(
      pin: '',
      status: SetupPinStatus.initial,
    );
  }

  final String pin;
  final SetupPinStatus status;
  final String? errorMessage;

  SetupPinState copyWith({
    String? pin,
    SetupPinStatus? status,
    String? errorMessage,
  }) {
    return SetupPinState(
      pin: pin ?? this.pin,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [pin, status, errorMessage];
}
