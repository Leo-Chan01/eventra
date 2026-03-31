import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';

sealed class SignupEvent {
  const SignupEvent();
}

class SignupStarted extends SignupEvent {
  const SignupStarted(this.accountType);
  final AccountType accountType;
}

class SignupEmailChanged extends SignupEvent {
  const SignupEmailChanged(this.email);
  final String email;
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
