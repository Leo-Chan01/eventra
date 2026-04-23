import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<SignupStarted>(_onStarted);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupFirstNameChanged>(_onFirstNameChanged);
    on<SignupLastNameChanged>(_onLastNameChanged);
    on<SignupBirthdayChanged>(_onBirthdayChanged);
    on<SignupPhoneChanged>(_onPhoneChanged);
    on<SignupMethodChanged>(_onMethodChanged);
    on<SignupOtpChanged>(_onOtpChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignupReferralCodeChanged>(_onReferralCodeChanged);
    on<SignupVendorCategoryChanged>(_onVendorCategoryChanged);
    on<SignupBusinessNameChanged>(_onBusinessNameChanged);
    on<SignupBusinessAddressChanged>(_onBusinessAddressChanged);
    on<SignupBusinessPhoneChanged>(_onBusinessPhoneChanged);
    on<SignupBusinessServicesChanged>(_onBusinessServicesChanged);
    on<SignupBusinessDescriptionChanged>(_onBusinessDescriptionChanged);
    on<SignupSubmitted>(_onSubmitted);
  }

  void _onStarted(SignupStarted event, Emitter<SignupState> emit) {
    emit(state.copyWith(accountType: event.accountType));
  }

  void _onEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onFirstNameChanged(
    SignupFirstNameChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _onLastNameChanged(
    SignupLastNameChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _onBirthdayChanged(
    SignupBirthdayChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(birthday: event.birthday));
  }

  void _onPhoneChanged(
    SignupPhoneChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.phone));
  }

  void _onMethodChanged(
    SignupMethodChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(signupMethod: event.method));
  }

  void _onOtpChanged(
    SignupOtpChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(otp: event.otp));
  }

  void _onPasswordChanged(
    SignupPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onConfirmPasswordChanged(
    SignupConfirmPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onReferralCodeChanged(
    SignupReferralCodeChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(referralCode: event.referralCode));
  }

  void _onVendorCategoryChanged(
    SignupVendorCategoryChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(selectedVendorCategory: event.category));
  }

  void _onBusinessNameChanged(
    SignupBusinessNameChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(businessName: event.businessName));
  }

  void _onBusinessAddressChanged(
    SignupBusinessAddressChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(businessAddress: event.businessAddress));
  }

  void _onBusinessPhoneChanged(
    SignupBusinessPhoneChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(businessPhoneNumber: event.businessPhoneNumber));
  }

  void _onBusinessServicesChanged(
    SignupBusinessServicesChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(businessServices: event.businessServices));
  }

  void _onBusinessDescriptionChanged(
    SignupBusinessDescriptionChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(businessDescription: event.businessDescription));
  }

  void _onSubmitted(SignupSubmitted event, Emitter<SignupState> emit) {
    emit(state.copyWith(isLoading: true));
  }
}
