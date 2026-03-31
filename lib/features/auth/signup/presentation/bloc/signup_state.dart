import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';

class SignupState {
  const SignupState({
    required this.accountType,
    this.email = '',
    this.isLoading = false,
  });

  factory SignupState.initial() => const SignupState(
        accountType: AccountType.client,
      );

  final AccountType accountType;
  final String email;
  final bool isLoading;

  SignupState copyWith({
    AccountType? accountType,
    String? email,
    bool? isLoading,
  }) {
    return SignupState(
      accountType: accountType ?? this.accountType,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
