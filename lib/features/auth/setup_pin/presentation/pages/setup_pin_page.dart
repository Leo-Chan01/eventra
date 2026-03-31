import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/setup_pin/presentation/bloc/setup_pin_bloc.dart';
import 'package:eventra/features/auth/setup_pin/presentation/bloc/setup_pin_event.dart';
import 'package:eventra/features/auth/setup_pin/presentation/bloc/setup_pin_state.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/keypads/numeric_keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SetupPinPage extends StatelessWidget {
  const SetupPinPage({super.key});

  static const String path = '/setup-pin';
  static const String name = 'setup-pin';

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
            children: [
              Text(
                l10n.createPinTitle,
                style: 32.bold.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Text(
                l10n.createPinSubtitle,
                textAlign: TextAlign.center,
                style: 16.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              48.vertSpacing,
              BlocBuilder<SetupPinBloc, SetupPinState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      final isActive = index < state.pin.length;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? colorScheme.primary
                              : colorScheme.outline.withValues(alpha: 0.2),
                        ),
                      );
                    }),
                  );
                },
              ),
              const Spacer(),
              NumericKeypad(
                onDigitPressed: (digit) => context.read<SetupPinBloc>().add(
                      SetupPinDigitPressed(digit),
                    ),
                onBackspacePressed: () => context.read<SetupPinBloc>().add(
                      const SetupPinBackspacePressed(),
                    ),
                leftActionIcon: Icons.fingerprint, // Placeholder icon for FaceID/Biometrics
                onLeftActionPressed: () {
                  // Design placeholder action
                },
              ),
              24.vertSpacing,
              BlocListener<SetupPinBloc, SetupPinState>(
                listener: (context, state) {
                  if (state.status == SetupPinStatus.success) {
                    // Navigate to success or home
                    context.go('/home'); // Placeholder
                  }
                },
                child: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
