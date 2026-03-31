import 'package:equatable/equatable.dart';

abstract class SetupPinEvent extends Equatable {
  const SetupPinEvent();

  @override
  List<Object?> get props => [];
}

class SetupPinDigitPressed extends SetupPinEvent {
  const SetupPinDigitPressed(this.digit);
  final String digit;

  @override
  List<Object?> get props => [digit];
}

class SetupPinBackspacePressed extends SetupPinEvent {
  const SetupPinBackspacePressed();
}

class SetupPinSubmitted extends SetupPinEvent {
  const SetupPinSubmitted();
}
