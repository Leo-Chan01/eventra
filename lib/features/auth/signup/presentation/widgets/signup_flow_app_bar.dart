import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_progress_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupFlowAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignupFlowAppBar({
    required this.showProgress,
    required this.currentStep,
    required this.totalSteps,
    super.key,
  });

  final bool showProgress;
  final int currentStep;
  final int totalSteps;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => context.pop(),
      ),
      titleSpacing: 0,
      title: showProgress
          ? Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SignupFlowProgressHeader(
                currentStep: currentStep,
                totalSteps: totalSteps,
              ),
            )
          : null,
    );
  }
}
