import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_state.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/password_reset_success_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static const String path = '/reset-password';
  static const String name = 'reset-password';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.resetPasswordTitle,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Text(
                l10n.resetPasswordSubtitle,
                style: 16.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              32.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.newPasswordLabel,
                hint: l10n.newPasswordHint,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) => context.read<ForgotPasswordBloc>().add(
                      ForgotPasswordNewPasswordChanged(value),
                    ),
              ),
              24.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.confirmPasswordLabel,
                hint: l10n.confirmPasswordHint,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) => context.read<ForgotPasswordBloc>().add(
                      ForgotPasswordConfirmPasswordChanged(value),
                    ),
              ),
              const Spacer(),
              BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state.status == ForgotPasswordStatus.success) {
                    context.goNamed(PasswordResetSuccessPage.name);
                  }
                },
                builder: (context, state) {
                  final isValid = state.newPassword.isNotEmpty &&
                      state.confirmPassword.isNotEmpty &&
                      state.newPassword == state.confirmPassword;

                  return EventraButton(
                    buttonText: l10n.createPasswordButton,
                    onPressed: !isValid
                        ? null
                        : () => context.read<ForgotPasswordBloc>().add(
                              const ForgotPasswordResetSubmitted(),
                            ),
                  );
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
