import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
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

class SignupFirstNameChanged extends SignupEvent {
  const SignupFirstNameChanged(this.firstName);
  final String firstName;
}

class SignupLastNameChanged extends SignupEvent {
  const SignupLastNameChanged(this.lastName);
  final String lastName;
}

class SignupBirthdayChanged extends SignupEvent {
  const SignupBirthdayChanged(this.birthday);
  final DateTime birthday;
}

class SignupPhoneChanged extends SignupEvent {
  const SignupPhoneChanged(this.phone);
  final String phone;
}

class SignupMethodChanged extends SignupEvent {
  const SignupMethodChanged(this.method);
  final SignupMethod method;
}

class SignupOtpChanged extends SignupEvent {
  const SignupOtpChanged(this.otp);
  final String otp;
}

class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);
  final String password;
}

class SignupConfirmPasswordChanged extends SignupEvent {
  const SignupConfirmPasswordChanged(this.confirmPassword);
  final String confirmPassword;
}

class SignupReferralCodeChanged extends SignupEvent {
  const SignupReferralCodeChanged(this.referralCode);
  final String referralCode;
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
