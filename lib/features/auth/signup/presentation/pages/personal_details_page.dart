import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/terms_and_conditions_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/welcome_success_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_date_picker_textfield.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_phone_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  static const String path = '/personal-details';
  static const String name = 'personal-details';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  child: BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.vertSpacing,
                          Text(
                            l10n.personalDetailsTitle,
                            style: 32.bold.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          8.vertSpacing,
                          Text(
                            l10n.personalDetailsSubtitle,
                            style: 16.regular.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          32.vertSpacing,
                          EventraGeneralTextfield(
                            label: l10n.firstNameLabel,
                            hint: l10n.firstNameHint,
                            autoFillHints: const [AutofillHints.givenName],
                            keyboardType: TextInputType.name,
                            onChanged: (val) => context.read<SignupBloc>().add(
                              SignupFirstNameChanged(val),
                            ),
                          ),
                          24.vertSpacing,
                          EventraGeneralTextfield(
                            label: l10n.lastNameLabel,
                            hint: l10n.lastNameHint,
                            autoFillHints: const [AutofillHints.familyName],
                            keyboardType: TextInputType.name,
                            onChanged: (val) => context.read<SignupBloc>().add(
                              SignupLastNameChanged(val),
                            ),
                          ),
                          24.vertSpacing,
                          EventraDatePickerTextfield(
                            label: l10n.birthdayLabel,
                            hint: l10n.birthdayHint,
                            onChanged: (val) {
                              // Parsing logic for DD/MM/YYYY
                              try {
                                final parts = val.split('/');
                                if (parts.length == 3) {
                                  final day = int.parse(parts[0]);
                                  final month = int.parse(parts[1]);
                                  final year = int.parse(parts[2]);
                                  context.read<SignupBloc>().add(
                                    SignupBirthdayChanged(
                                      DateTime(year, month, day),
                                    ),
                                  );
                                }
                              } on Exception catch (_) {}
                            },
                          ),
                          24.vertSpacing,
                          EventraPhoneTextfield(
                            label: l10n.phoneLabel,
                            hint: l10n.phoneHint,
                            onChanged: (val) => context.read<SignupBloc>().add(
                              SignupPhoneChanged(val),
                            ),
                          ),
                          if (state.signupMethod == SignupMethod.email) ...[
                            24.vertSpacing,
                            EventraGeneralTextfield(
                              label: l10n.passwordLabel,
                              hint: l10n.passwordHint,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onChanged: (val) => context
                                  .read<SignupBloc>()
                                  .add(SignupPasswordChanged(val)),
                            ),
                            24.vertSpacing,
                            EventraGeneralTextfield(
                              label: l10n.confirmPasswordLabel,
                              hint: l10n.confirmPasswordHint,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onChanged: (val) => context
                                  .read<SignupBloc>()
                                  .add(SignupConfirmPasswordChanged(val)),
                            ),
                          ],
                          const Spacer(),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: 14.regular.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(text: l10n.termsAcceptancePrefix),
                                TextSpan(
                                  text: l10n.termsLink,
                                  style: 14.bold.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => context.pushNamed(
                                      TermsAndConditionsPage.name,
                                    ),
                                ),
                                TextSpan(text: l10n.termsAcceptanceAnd),
                                TextSpan(
                                  text: l10n.privacyPolicyLink,
                                  style: 14.bold.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          24.vertSpacing,
                          EventraButton(
                            buttonText: l10n.continueButton,
                            onPressed: () {
                              unawaited(
                                context.pushNamed(WelcomeSuccessPage.name),
                              );
                            },
                          ),
                          24.vertSpacing,
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
