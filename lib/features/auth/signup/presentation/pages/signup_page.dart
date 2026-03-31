import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/login/presentation/pages/login_page.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/otp_verification_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/personal_details_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_social_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({required this.accountType, super.key});

  final AccountType accountType;

  static const String path = '/signup';
  static const String name = 'signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();
    context.read<SignupBloc>().add(SignupStarted(widget.accountType));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      24.vertSpacing,
                      Text(
                        l10n.signupTitle,
                        style: 32.bold.copyWith(color: colorScheme.onSurface),
                      ),
                      12.vertSpacing,
                      Text(
                        l10n.signupSubtitle,
                        style: 16.regular.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                      32.vertSpacing,
                      EventraGeneralTextfield(
                        label: l10n.emailLabel,
                        hint: l10n.emailHint,
                        autoFillHints: const [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) => context.read<SignupBloc>().add(
                          SignupEmailChanged(email),
                        ),
                      ),
                      32.vertSpacing,
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return EventraButton(
                            buttonText: l10n.signupButton,
                            onPressed: () {
                              context.read<SignupBloc>().add(
                                const SignupMethodChanged(SignupMethod.email),
                              );
                              unawaited(
                                context.pushNamed(OTPVerificationPage.name),
                              );
                            },
                          );
                        },
                      ),
                      42.vertSpacing,
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: colorScheme.outline.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Text(
                              l10n.orDivider,
                              style: 14.w500.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: colorScheme.outline.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      42.vertSpacing,
                      EventraSocialButton(
                        buttonText: l10n.socialSignupGoogle,
                        vectorAsset: EventraVectors.googleIcon,
                        onPressed: () {
                          context.read<SignupBloc>().add(
                            const SignupMethodChanged(SignupMethod.google),
                          );
                          unawaited(
                            context.pushNamed(PersonalDetailsPage.name),
                          );
                        },
                      ),
                      16.vertSpacing,
                      EventraSocialButton(
                        buttonText: l10n.socialSignupApple,
                        vectorAsset: EventraVectors.appleIcon,
                        onPressed: () {
                          context.read<SignupBloc>().add(
                            const SignupMethodChanged(SignupMethod.apple),
                          );
                          unawaited(
                            context.pushNamed(PersonalDetailsPage.name),
                          );
                        },
                      ),
                      const Spacer(),
                      Align(
                        child: RichText(
                          text: TextSpan(
                            text: l10n.alreadyHaveAccount,
                            style: 16.w500.copyWith(
                              color: colorScheme.onSurface,
                            ),
                            children: [
                              TextSpan(
                                text: l10n.signInLink,
                                style: 16.w500.copyWith(
                                  color: const Color(0xFF0078FF),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.goNamed(LoginPage.name);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      24.vertSpacing,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
