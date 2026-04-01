import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class HomeJoinAsVendorCTA extends StatelessWidget {
  const HomeJoinAsVendorCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(EventraImages.onboardingImage1), // Placeholder for background pattern
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Column(
        children: [
          Text(
            l10n.homeJoinAsVendor,
            style: 20.bold.copyWith(
              color: colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          16.vertSpacing,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.onPrimary,
              foregroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              l10n.homeJoinAsVendor,
              style: 14.bold,
            ),
          ),
        ],
      ),
    );
  }
}
