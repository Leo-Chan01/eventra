import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_app_bar.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_business_details_body.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorBusinessDetailsPage extends StatelessWidget {
  const VendorBusinessDetailsPage({super.key});

  static const String path = '/vendor-business-details';
  static const String name = 'vendor-business-details';

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
        currentStep: 4,
        totalSteps: 4,
      ),
      body: const SafeArea(child: VendorBusinessDetailsBody()),
    );
  }
}