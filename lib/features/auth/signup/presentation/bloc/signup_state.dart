import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';

enum SignupMethod { email, google, apple }

class SignupState {
  const SignupState({
    required this.accountType,
    this.email = '',
    this.isLoading = false,
    this.firstName = '',
    this.lastName = '',
    this.birthday,
    this.phoneNumber = '',
    this.signupMethod = SignupMethod.email,
    this.otp = '',
    this.password = '',
    this.confirmPassword = '',
    this.referralCode = '',
    this.selectedVendorCategory,
    this.businessName = '',
    this.businessAddress = '',
    this.businessPhoneNumber = '',
    this.businessServices = '',
    this.businessDescription = '',
  });

  factory SignupState.initial() => const SignupState(
    accountType: AccountType.client,
  );

  final AccountType accountType;
  final String email;
  final bool isLoading;
  final String firstName;
  final String lastName;
  final DateTime? birthday;
  final String phoneNumber;
  final SignupMethod signupMethod;
  final String otp;
  final String password;
  final String confirmPassword;
  final String referralCode;
  final String? selectedVendorCategory;
  final String businessName;
  final String businessAddress;
  final String businessPhoneNumber;
  final String businessServices;
  final String businessDescription;

  SignupState copyWith({
    AccountType? accountType,
    String? email,
    bool? isLoading,
    String? firstName,
    String? lastName,
    DateTime? birthday,
    String? phoneNumber,
    SignupMethod? signupMethod,
    String? otp,
    String? password,
    String? confirmPassword,
    String? referralCode,
    String? selectedVendorCategory,
    bool clearSelectedVendorCategory = false,
    String? businessName,
    String? businessAddress,
    String? businessPhoneNumber,
    String? businessServices,
    String? businessDescription,
  }) {
    return SignupState(
      accountType: accountType ?? this.accountType,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      signupMethod: signupMethod ?? this.signupMethod,
      otp: otp ?? this.otp,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      referralCode: referralCode ?? this.referralCode,
      selectedVendorCategory: clearSelectedVendorCategory
          ? null
          : selectedVendorCategory ?? this.selectedVendorCategory,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      businessPhoneNumber: businessPhoneNumber ?? this.businessPhoneNumber,
      businessServices: businessServices ?? this.businessServices,
      businessDescription: businessDescription ?? this.businessDescription,
    );
  }
}
