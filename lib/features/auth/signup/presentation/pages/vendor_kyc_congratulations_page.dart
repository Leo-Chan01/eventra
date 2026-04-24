import 'package:eventra/core/utils/lottie_decorder.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class VendorKycCongratulationsPage extends StatelessWidget {
  const VendorKycCongratulationsPage({super.key});

  static const String path = '/vendor-kyc-congratulations';
  static const String name = 'vendor-kyc-congratulations';

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
              24.vertSpacing,
              AspectRatio(
                aspectRatio: 16 / 10,
                child: Stack(
                  children: [
                    Align(
                      child: Lottie.asset(
                        EventraAnims.confettiEmoji,
                        repeat: true,
                        decoder: customDecoder,
                      ),
                    ),
                    Align(
                      child: Lottie.asset(
                        EventraAnims.success,
                        repeat: true,
                        decoder: customDecoder,
                      ),
                    ),
                  ],
                ),
              ),
              28.vertSpacing,
              Text(
                l10n.vendorKycCongratulationsTitle,
                textAlign: TextAlign.center,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              16.vertSpacing,
              Text(
                l10n.vendorKycCongratulationsSubtitle,
                textAlign: TextAlign.center,
                style: 14.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.homeButton,
                onPressed: () => context.goNamed(
                  HomePage.name,
                  queryParameters: const {'vendor': 'true'},
                ),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
