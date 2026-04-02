import 'package:eventra/core/utils/lottie_decorder.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class WelcomeSuccessPage extends StatelessWidget {
  const WelcomeSuccessPage({super.key});

  static const String path = '/welcome-success';
  static const String name = 'welcome-success';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    Align(
                      child: Lottie.asset(
                        EventraAnims.confettiEmoji,
                        height: 145,
                        repeat: true,
                        decoder: customDecoder,
                      ),
                    ),
                    Positioned.fill(
                      child: Lottie.asset(
                        EventraAnims.success,
                        repeat: true,
                        decoder: customDecoder,
                      ),
                    ),
                  ],
                ),
              ),

              32.vertSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      l10n.welcomeTitle,
                      textAlign: TextAlign.center,
                      style: 32.bold.copyWith(color: colorScheme.onSurface),
                    ),
                    16.vertSpacing,
                    Text(
                      l10n.welcomeDescription,
                      textAlign: TextAlign.center,
                      style: 14.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
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
