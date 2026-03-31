import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/widgets/account_type_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountSelectionBottomSheet extends StatefulWidget {
  const AccountSelectionBottomSheet({super.key});

  @override
  State<AccountSelectionBottomSheet> createState() =>
      _AccountSelectionBottomSheetState();
}

class _AccountSelectionBottomSheetState
    extends State<AccountSelectionBottomSheet> {
  AccountType? _selectedType;

  void _onTypeSelected(AccountType type) {
    setState(() => _selectedType = type);

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        context
          ..pop()
          ..pushNamed(
            SignupPage.name,
            extra: type,
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          32.vertSpacing,
          // Title Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.accountTypeSelectionTitle,
                style: 28.bold.copyWith(color: colorScheme.onSurface),
              ),
              12.vertSpacing,
              Text(
                l10n.accountTypeSelectionSubtitle,
                style: 16.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
          32.vertSpacing,
          AccountTypeCard(
            title: l10n.accountTypeClientTitle,
            description: l10n.accountTypeClientDescription,
            vectorAsset: EventraVectors.clientVector,
            isSelected: _selectedType == AccountType.client,
            onTap: () => _onTypeSelected(AccountType.client),
          ),
          16.vertSpacing,
          AccountTypeCard(
            title: l10n.accountTypeVendorTitle,
            description: l10n.accountTypeVendorDescription,
            vectorAsset: EventraVectors.vendorVector,
            isSelected: _selectedType == AccountType.vendor,
            onTap: () => _onTypeSelected(AccountType.vendor),
          ),
          32.vertSpacing,
          TextButton(
            onPressed: () {},
            child: Text(
              l10n.continueWithoutSignup,
              style: 16.w600.copyWith(
                color: colorScheme.onSurface,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          (MediaQuery.paddingOf(context).bottom + 20).vertSpacing,
        ],
      ),
    );
  }
}
