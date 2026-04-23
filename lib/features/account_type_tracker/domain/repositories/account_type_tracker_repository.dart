import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';

abstract class AccountTypeTrackerRepository {
  Future<AccountType?> getSelectedAccountType();

  Future<bool> isGuestMode();

  Future<void> saveSelectedAccountType(AccountType accountType);

  Future<void> saveGuestMode();

  Future<void> clear();
}
