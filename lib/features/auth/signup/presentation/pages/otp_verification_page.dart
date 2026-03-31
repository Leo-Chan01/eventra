import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/personal_details_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  static const String path = '/otp-verification';
  static const String name = 'otp-verification';

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late Timer _timer;
  int _secondsRemaining = 60;
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.otpTitle,
                    style: 32.bold.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  Text(
                    l10n.otpSubtitle(state.email),
                    style: 16.regular.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  32.vertSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5,
                      (index) => _OtpInputBox(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 4) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                          _onOtpChanged();
                        },
                      ),
                    ),
                  ),
                  32.vertSpacing,
                  Center(
                    child: Column(
                      children: [
                        Text(
                          l10n.otpResendText,
                          style: 14.regular.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        TextButton(
                          onPressed: _secondsRemaining == 0
                              ? () {
                                  setState(() {
                                    _secondsRemaining = 60;
                                  });
                                  _startTimer();
                                  // Add resend event if needed
                                }
                              : null,
                          child: Text(
                            l10n.otpResendLink(
                              _formatTime(_secondsRemaining),
                            ),
                            style: 14.bold.copyWith(
                              color: _secondsRemaining == 0
                                  ? colorScheme.primary
                                  : colorScheme.onSurfaceVariant.withValues(
                                      alpha: 0.5,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  EventraButton(
                    buttonText: l10n.otpVerifyButton,
                    onPressed: () {
                      unawaited(context.pushNamed(PersonalDetailsPage.name));
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
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  void _onOtpChanged() {
    final otp = _controllers.map((c) => c.text).join();
    context.read<SignupBloc>().add(SignupOtpChanged(otp));
  }
}

class _OtpInputBox extends StatelessWidget {
  const _OtpInputBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 60,
      height: 60,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: 24.bold.copyWith(color: colorScheme.onSurface),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
          ),
          fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
          filled: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
