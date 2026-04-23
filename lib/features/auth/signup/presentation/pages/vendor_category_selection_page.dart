import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_app_bar.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_category_selection_body.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorCategorySelectionPage extends StatelessWidget {
  const VendorCategorySelectionPage({super.key});

  static const String path = '/vendor-category-selection';
  static const String name = 'vendor-category-selection';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isVendorFlow = context.select(
      (SignupBloc bloc) => bloc.state.accountType == AccountType.vendor,
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: SignupFlowAppBar(
        showProgress: isVendorFlow,
        currentStep: 3,
        totalSteps: 4,
      ),
      body: const SafeArea(child: VendorCategorySelectionBody()),
    );
  }
}
