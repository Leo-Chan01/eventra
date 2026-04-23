import 'package:eventra/features/account_type_tracker/data/repositories/account_type_tracker_repository_impl.dart';
import 'package:eventra/features/account_type_tracker/domain/repositories/account_type_tracker_repository.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AccountTypeTrackerStatus { initial, loading, ready, failure }

class AccountTypeTrackerState {
  const AccountTypeTrackerState({
    required this.status,
    this.selectedAccountType,
    required this.isGuestMode,
    this.errorMessage,
  });

  factory AccountTypeTrackerState.initial() => const AccountTypeTrackerState(
    status: AccountTypeTrackerStatus.initial,
    isGuestMode: false,
  );

  final AccountTypeTrackerStatus status;
  final AccountType? selectedAccountType;
  final bool isGuestMode;
  final String? errorMessage;

  AccountTypeTrackerState copyWith({
    AccountTypeTrackerStatus? status,
    AccountType? selectedAccountType,
    bool clearSelectedAccountType = false,
    bool? isGuestMode,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return AccountTypeTrackerState(
      status: status ?? this.status,
      selectedAccountType: clearSelectedAccountType
          ? null
          : selectedAccountType ?? this.selectedAccountType,
      isGuestMode: isGuestMode ?? this.isGuestMode,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}

abstract class AccountTypeTrackerEvent {
  const AccountTypeTrackerEvent();
}

class AccountTypeTrackerStarted extends AccountTypeTrackerEvent {
  const AccountTypeTrackerStarted();
}

class AccountTypeSelected extends AccountTypeTrackerEvent {
  const AccountTypeSelected(this.accountType);

  final AccountType accountType;
}

class GuestModeEnabled extends AccountTypeTrackerEvent {
  const GuestModeEnabled();
}

class AccountTypeTrackerCleared extends AccountTypeTrackerEvent {
  const AccountTypeTrackerCleared();
}

class AccountTypeTrackerBloc
    extends Bloc<AccountTypeTrackerEvent, AccountTypeTrackerState> {
  AccountTypeTrackerBloc({
    AccountTypeTrackerRepository? repository,
  }) : _repository = repository ?? AccountTypeTrackerRepositoryImpl(),
       super(AccountTypeTrackerState.initial()) {
    on<AccountTypeTrackerStarted>(_onStarted);
    on<AccountTypeSelected>(_onAccountTypeSelected);
    on<GuestModeEnabled>(_onGuestModeEnabled);
    on<AccountTypeTrackerCleared>(_onCleared);
  }

  final AccountTypeTrackerRepository _repository;

  Future<void> _onStarted(
    AccountTypeTrackerStarted event,
    Emitter<AccountTypeTrackerState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AccountTypeTrackerStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      final selectedAccountType = await _repository.getSelectedAccountType();
      final isGuestMode = await _repository.isGuestMode();

      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.ready,
          selectedAccountType: selectedAccountType,
          isGuestMode: isGuestMode,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.failure,
          clearSelectedAccountType: true,
          isGuestMode: false,
          errorMessage: 'account_type_tracker_failed_to_initialize',
        ),
      );
    }
  }

  Future<void> _onAccountTypeSelected(
    AccountTypeSelected event,
    Emitter<AccountTypeTrackerState> emit,
  ) async {
    try {
      await _repository.saveSelectedAccountType(event.accountType);
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.ready,
          selectedAccountType: event.accountType,
          isGuestMode: false,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.failure,
          errorMessage: 'account_type_tracker_failed_to_save',
        ),
      );
    }
  }

  Future<void> _onGuestModeEnabled(
    GuestModeEnabled event,
    Emitter<AccountTypeTrackerState> emit,
  ) async {
    try {
      await _repository.saveGuestMode();
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.ready,
          clearSelectedAccountType: true,
          isGuestMode: true,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.failure,
          errorMessage: 'account_type_tracker_failed_to_save_guest_mode',
        ),
      );
    }
  }

  Future<void> _onCleared(
    AccountTypeTrackerCleared event,
    Emitter<AccountTypeTrackerState> emit,
  ) async {
    try {
      await _repository.clear();
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.ready,
          clearSelectedAccountType: true,
          isGuestMode: false,
          clearErrorMessage: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AccountTypeTrackerStatus.failure,
          errorMessage: 'account_type_tracker_failed_to_clear',
        ),
      );
    }
  }
}
