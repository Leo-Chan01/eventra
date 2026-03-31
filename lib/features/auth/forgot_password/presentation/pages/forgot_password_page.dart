import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_state.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/forgot_password_otp_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String path = '/forgot-password';
  static const String name = 'forgot-password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                l10n.forgotPasswordTitle,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Text(
                l10n.forgotPasswordSubtitle,
                style: 16.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              32.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.forgotPasswordEmailLabel,
                hint: l10n.forgotPasswordEmailHint,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => context.read<ForgotPasswordBloc>().add(
                      ForgotPasswordEmailChanged(value),
                    ),
              ),
              const Spacer(),
              BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state.status == ForgotPasswordStatus.success) {
                    unawaited(context.pushNamed(ForgotPasswordOtpPage.name));
                  }
                },
                builder: (context, state) {
                  return EventraButton(
                    buttonText: l10n.forgotPasswordContinueButton,
                    onPressed: state.email.isEmpty
                        ? null
                        : () => context.read<ForgotPasswordBloc>().add(
                              const ForgotPasswordEmailSubmitted(),
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
