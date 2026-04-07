import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/login/presentation/pages/login_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordResetSuccessPage extends StatelessWidget {
  const PasswordResetSuccessPage({super.key});

  static const String path = '/password-reset-success';
  static const String name = 'password-reset-success';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary.withValues(alpha: 0.1),
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle,
                    color: colorScheme.primary,
                    size: 80,
                  ),
                ),
              ),
              32.vertSpacing,
              Text(
                l10n.passwordUpdatedTitle,
                textAlign: TextAlign.center,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              16.vertSpacing,
              Text(
                l10n.passwordUpdatedSubtitle,
                textAlign: TextAlign.center,
                style: 16.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.loginButton,
                onPressed: () {
                  context.goNamed(LoginPage.name);
                },
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
