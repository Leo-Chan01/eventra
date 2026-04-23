import 'package:eventra/features/account_type_tracker/domain/repositories/account_type_tracker_repository.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SharedPreferencesProvider = Future<SharedPreferences> Function();

class AccountTypeTrackerRepositoryImpl implements AccountTypeTrackerRepository {
  AccountTypeTrackerRepositoryImpl({
    SharedPreferencesProvider preferencesProvider =
        SharedPreferences.getInstance,
  }) : _preferencesProvider = preferencesProvider;

  static const String _accountTypeKey = 'account_type';
  static const String _guestModeKey = 'is_guest_mode';

  final SharedPreferencesProvider _preferencesProvider;

  @override
  Future<void> clear() async {
    final preferences = await _preferencesProvider();
    await preferences.remove(_accountTypeKey);
    await preferences.remove(_guestModeKey);
  }

  @override
  Future<AccountType?> getSelectedAccountType() async {
    final preferences = await _preferencesProvider();
    final rawValue = preferences.getString(_accountTypeKey);
    if (rawValue == null) {
      return null;
    }

    return switch (rawValue) {
      'client' => AccountType.client,
      'vendor' => AccountType.vendor,
      _ => null,
    };
  }

  @override
  Future<bool> isGuestMode() async {
    final preferences = await _preferencesProvider();
    return preferences.getBool(_guestModeKey) ?? false;
  }

  @override
  Future<void> saveGuestMode() async {
    final preferences = await _preferencesProvider();
    await preferences.setBool(_guestModeKey, true);
    await preferences.remove(_accountTypeKey);
  }

  @override
  Future<void> saveSelectedAccountType(AccountType accountType) async {
    final preferences = await _preferencesProvider();
    final storageValue = switch (accountType) {
      AccountType.client => 'client',
      AccountType.vendor => 'vendor',
    };
    await preferences.setString(_accountTypeKey, storageValue);
    await preferences.setBool(_guestModeKey, false);
  }
}
