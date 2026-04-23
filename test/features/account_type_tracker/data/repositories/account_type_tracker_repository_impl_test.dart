import 'package:eventra/features/account_type_tracker/data/repositories/account_type_tracker_repository_impl.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('AccountTypeTrackerRepositoryImpl', () {
    test('returns null when no account type has been saved', () async {
      SharedPreferences.setMockInitialValues(const {});
      final preferences = await SharedPreferences.getInstance();
      final repository = AccountTypeTrackerRepositoryImpl(
        preferencesProvider: () async => preferences,
      );

      final selectedAccountType = await repository.getSelectedAccountType();

      expect(selectedAccountType, isNull);
    });

    test('saves and restores selected account type', () async {
      SharedPreferences.setMockInitialValues(const {});
      final preferences = await SharedPreferences.getInstance();
      final repository = AccountTypeTrackerRepositoryImpl(
        preferencesProvider: () async => preferences,
      );

      await repository.saveSelectedAccountType(AccountType.vendor);
      final selectedAccountType = await repository.getSelectedAccountType();
      final isGuestMode = await repository.isGuestMode();

      expect(selectedAccountType, AccountType.vendor);
      expect(isGuestMode, isFalse);
    });

    test('enabling guest mode clears selected account type', () async {
      SharedPreferences.setMockInitialValues(const {'account_type': 'client'});
      final preferences = await SharedPreferences.getInstance();
      final repository = AccountTypeTrackerRepositoryImpl(
        preferencesProvider: () async => preferences,
      );

      await repository.saveGuestMode();

      expect(await repository.isGuestMode(), isTrue);
      expect(await repository.getSelectedAccountType(), isNull);
    });

    test('clear removes both account type and guest mode', () async {
      SharedPreferences.setMockInitialValues(const {
        'account_type': 'vendor',
        'is_guest_mode': true,
      });
      final preferences = await SharedPreferences.getInstance();
      final repository = AccountTypeTrackerRepositoryImpl(
        preferencesProvider: () async => preferences,
      );

      await repository.clear();

      expect(await repository.getSelectedAccountType(), isNull);
      expect(await repository.isGuestMode(), isFalse);
    });
  });
}
