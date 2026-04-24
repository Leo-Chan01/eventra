import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class VendorKycUnderReviewPage extends StatelessWidget {
  const VendorKycUnderReviewPage({super.key});

  static const String path = '/vendor-kyc-under-review';
  static const String name = 'vendor-kyc-under-review';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              52.vertSpacing,
              SvgPicture.asset(
                EventraVectors.detailsUnderReviewIllustration,
                width: 320,
              ),
              42.vertSpacing,
              Text(
                l10n.vendorKycUnderReviewTitle,
                textAlign: TextAlign.center,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              18.vertSpacing,
              Text(
                l10n.vendorKycUnderReviewSubtitle,
                textAlign: TextAlign.center,
                style: 14.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.homeButton,
                onPressed: () => context.go(HomePage.path),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
