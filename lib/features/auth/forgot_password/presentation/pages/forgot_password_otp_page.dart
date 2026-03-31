import 'dart:async';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:eventra/features/auth/forgot_password/presentation/bloc/forgot_password_state.dart';
import 'package:eventra/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordOtpPage extends StatefulWidget {
  const ForgotPasswordOtpPage({super.key});

  static const String path = '/forgot-password-otp';
  static const String name = 'forgot-password-otp';

  @override
  State<ForgotPasswordOtpPage> createState() => _ForgotPasswordOtpPageState();
}

class _ForgotPasswordOtpPageState extends State<ForgotPasswordOtpPage> {
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

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            _timer.cancel();
          }
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';
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
                l10n.forgotPasswordOtpTitle,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                builder: (context, state) {
                  return Text(
                    '${l10n.forgotPasswordOtpSubtitle} ${state.email}',
                    style: 16.regular.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
              32.vertSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => _OtpInputBoxManual(
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
                      l10n.forgotPasswordResendText,
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
                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(
                                    const ForgotPasswordResendOtpRequested(),
                                  );
                            }
                          : null,
                      child: Text(
                        '${l10n.forgotPasswordResendLink} '
                        '${_formatTime(_secondsRemaining)}',
                        style: 14.bold.copyWith(
                          color: _secondsRemaining == 0
                              ? colorScheme.primary
                              : colorScheme.surfaceContainerHighest.withValues(
                                  alpha: 0.5,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state.status == ForgotPasswordStatus.success) {
                    unawaited(context.pushNamed(ResetPasswordPage.name));
                  }
                },
                builder: (context, state) {
                  return EventraButton(
                    buttonText: l10n.forgotPasswordVerifyButton,
                    onPressed: state.otp.length < 5
                        ? null
                        : () => context.read<ForgotPasswordBloc>().add(
                              const ForgotPasswordOtpSubmitted(),
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

  void _onOtpChanged() {
    final otp = _controllers.map((c) => c.text).join();
    context.read<ForgotPasswordBloc>().add(ForgotPasswordOtpChanged(otp));
  }
}

class _OtpInputBoxManual extends StatelessWidget {
  const _OtpInputBoxManual({
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
