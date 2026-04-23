import 'package:eventra/core/utils/lottie_decorder.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/pages/terms_and_conditions_page.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final isVendor = context.select(
      (SignupBloc bloc) => bloc.state.accountType == AccountType.vendor,
    );

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
              if (isVendor) ...[
                12.vertSpacing,
                EventraButton.outlined(
                  buttonText: l10n.continueKycButton,
                  textColor: colorScheme.primary,
                  borderColor: colorScheme.outline.withValues(alpha: 0.2),
                  onPressed: () => context.pushNamed(TermsAndConditionsPage.name),
                ),
              ],
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
