import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:eventra/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:eventra/features/auth/login/presentation/bloc/login_event.dart';
import 'package:eventra/features/auth/login/presentation/bloc/login_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_social_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String path = '/login';
  static const String name = 'login';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          40.vertSpacing,
                          Align(
                            child: Image.asset(
                              EventraImages.appIcon,
                              height: 60,
                            ),
                          ),
                          32.vertSpacing,
                          Align(
                            child: Text(
                              l10n.loginWelcomeBackTitle,
                              style: 28.bold.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          12.vertSpacing,
                          Align(
                            child: Text(
                              l10n.loginWelcomeBackSubtitle,
                              textAlign: TextAlign.center,
                              style: 16.regular.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          40.vertSpacing,
                          EventraGeneralTextfield(
                            label: l10n.emailLabel,
                            hint: l10n.emailHint,
                            keyboardType: TextInputType.emailAddress,
                            autoFillHints: const [AutofillHints.email],
                            onChanged: (val) => context.read<LoginBloc>().add(
                              LoginEmailChanged(val),
                            ),
                          ),
                          24.vertSpacing,
                          EventraGeneralTextfield(
                            label: l10n.passwordLabel,
                            hint: l10n.passwordHint,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !state.isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off_outlined,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              onPressed: () => context.read<LoginBloc>().add(
                                const LoginPasswordVisibilityToggled(),
                              ),
                            ),
                            onChanged: (val) => context.read<LoginBloc>().add(
                              LoginPasswordChanged(val),
                            ),
                          ),
                          8.vertSpacing,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () =>
                                    context.pushNamed(ForgotPasswordPage.name),
                                child: Text(
                                  l10n.forgotPasswordLink,
                                  style: 14.bold.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          32.vertSpacing,
                          EventraButton(
                            buttonText: l10n.loginButton,
                            isLoading: state.status == LoginStatus.loading,
                            onPressed: () => context.read<LoginBloc>().add(
                              const LoginSubmitted(),
                            ),
                          ),
                          32.vertSpacing,
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
                          32.vertSpacing,
                          EventraSocialButton(
                            buttonText: l10n.socialSignupGoogle,
                            vectorAsset: EventraVectors.googleIcon,
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                const LoginMethodChanged('google'),
                              );
                            },
                          ),
                          16.vertSpacing,
                          EventraSocialButton(
                            buttonText: l10n.socialSignupApple,
                            vectorAsset: EventraVectors.appleIcon,
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                const LoginMethodChanged('apple'),
                              );
                            },
                          ),
                          const Spacer(),
                          Align(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: RichText(
                                text: TextSpan(
                                  text: l10n.dontHaveAccount,
                                  style: 16.w500.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: l10n.signUpLink,
                                      style: 16.w500.copyWith(
                                        color: const Color(0xFF0078FF),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            context.pushNamed(SignupPage.name),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
