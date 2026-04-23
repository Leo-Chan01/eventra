import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/account_type_tracker/domain/repositories/account_type_tracker_repository.dart';
import 'package:eventra/features/account_type_tracker/presentation/bloc/account_type_tracker_bloc.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountTypeTrackerBloc', () {
    test('has initial state with status initial', () {
      final bloc = AccountTypeTrackerBloc(repository: _FakeRepository());
      addTearDown(bloc.close);

      expect(bloc.state.status, AccountTypeTrackerStatus.initial);
      expect(bloc.state.selectedAccountType, isNull);
      expect(bloc.state.isGuestMode, isFalse);
    });

    blocTest<AccountTypeTrackerBloc, AccountTypeTrackerState>(
      'hydrates persisted account type on start',
      build: () => AccountTypeTrackerBloc(
        repository: _FakeRepository(selectedAccountType: AccountType.vendor),
      ),
      act: (bloc) => bloc.add(const AccountTypeTrackerStarted()),
      expect: () => [
        isA<AccountTypeTrackerState>().having(
          (state) => state.status,
          'status',
          AccountTypeTrackerStatus.loading,
        ),
        isA<AccountTypeTrackerState>()
            .having(
              (state) => state.status,
              'status',
              AccountTypeTrackerStatus.ready,
            )
            .having(
              (state) => state.selectedAccountType,
              'selectedAccountType',
              AccountType.vendor,
            )
            .having((state) => state.isGuestMode, 'isGuestMode', false),
      ],
    );

    blocTest<AccountTypeTrackerBloc, AccountTypeTrackerState>(
      'stores selected account type and exits guest mode',
      build: () => AccountTypeTrackerBloc(
        repository: _FakeRepository(isGuestMode: true),
      ),
      seed: () => const AccountTypeTrackerState(
        status: AccountTypeTrackerStatus.ready,
        isGuestMode: true,
      ),
      act: (bloc) => bloc.add(const AccountTypeSelected(AccountType.client)),
      expect: () => [
        isA<AccountTypeTrackerState>()
            .having(
              (state) => state.status,
              'status',
              AccountTypeTrackerStatus.ready,
            )
            .having(
              (state) => state.selectedAccountType,
              'selectedAccountType',
              AccountType.client,
            )
            .having((state) => state.isGuestMode, 'isGuestMode', false),
      ],
    );

    blocTest<AccountTypeTrackerBloc, AccountTypeTrackerState>(
      'enables guest mode and clears account type',
      build: () => AccountTypeTrackerBloc(
        repository: _FakeRepository(selectedAccountType: AccountType.client),
      ),
      seed: () => const AccountTypeTrackerState(
        status: AccountTypeTrackerStatus.ready,
        selectedAccountType: AccountType.client,
        isGuestMode: false,
      ),
      act: (bloc) => bloc.add(const GuestModeEnabled()),
      expect: () => [
        isA<AccountTypeTrackerState>()
            .having(
              (state) => state.status,
              'status',
              AccountTypeTrackerStatus.ready,
            )
            .having(
              (state) => state.selectedAccountType,
              'selectedAccountType',
              isNull,
            )
            .having((state) => state.isGuestMode, 'isGuestMode', true),
      ],
    );

    blocTest<AccountTypeTrackerBloc, AccountTypeTrackerState>(
      'clears tracker state and persistence',
      build: () => AccountTypeTrackerBloc(
        repository: _FakeRepository(
          selectedAccountType: AccountType.vendor,
          isGuestMode: true,
        ),
      ),
      seed: () => const AccountTypeTrackerState(
        status: AccountTypeTrackerStatus.ready,
        selectedAccountType: AccountType.vendor,
        isGuestMode: true,
      ),
      act: (bloc) => bloc.add(const AccountTypeTrackerCleared()),
      expect: () => [
        isA<AccountTypeTrackerState>()
            .having(
              (state) => state.status,
              'status',
              AccountTypeTrackerStatus.ready,
            )
            .having(
              (state) => state.selectedAccountType,
              'selectedAccountType',
              isNull,
            )
            .having((state) => state.isGuestMode, 'isGuestMode', false),
      ],
    );
  });
}

class _FakeRepository implements AccountTypeTrackerRepository {
  _FakeRepository({
    this.selectedAccountType,
    bool isGuestMode = false,
  }) : _isGuestMode = isGuestMode;

  AccountType? selectedAccountType;
  bool _isGuestMode;

  @override
  Future<void> clear() async {
    selectedAccountType = null;
    _isGuestMode = false;
  }

  @override
  Future<AccountType?> getSelectedAccountType() async => selectedAccountType;

  @override
  Future<bool> isGuestMode() async => _isGuestMode;

  @override
  Future<void> saveGuestMode() async {
    selectedAccountType = null;
    _isGuestMode = true;
  }

  @override
  Future<void> saveSelectedAccountType(AccountType accountType) async {
    selectedAccountType = accountType;
    _isGuestMode = false;
  }
}
