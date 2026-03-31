import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              const Spacer(),
              // Placeholder for Lottie animation
              SizedBox(
                height: 250,
                child: Center(
                  child: Icon(
                    Icons.celebration,
                    size: 100,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              // Un-comment when confetti.json is available
              // Lottie.asset(
              //   'assets/anims/confetti.json',
              //   height: 250,
              //   repeat: true,
              // ),
              32.vertSpacing,
              Text(
                l10n.welcomeTitle,
                textAlign: TextAlign.center,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              16.vertSpacing,
              Text(
                l10n.welcomeDescription,
                textAlign: TextAlign.center,
                style: 16.regular.copyWith(
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
