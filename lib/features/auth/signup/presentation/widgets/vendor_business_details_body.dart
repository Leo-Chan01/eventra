import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:eventra/features/auth/signup/presentation/pages/welcome_success_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_business_address_field.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_business_description_field.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_business_upload_field.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_phone_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VendorBusinessDetailsBody extends StatelessWidget {
  const VendorBusinessDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        24.vertSpacing,
                        Text(
                          l10n.vendorBusinessDetailsTitle,
                          style: 32.bold.copyWith(color: colorScheme.onSurface),
                        ),
                        8.vertSpacing,
                        Text(
                          l10n.personalDetailsSubtitle,
                          style: 16.regular.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        28.vertSpacing,
                        EventraGeneralTextfield(
                          label: l10n.vendorBusinessNameLabel,
                          hint: l10n.vendorBusinessNameHint,
                          initialValue: state.businessName,
                          keyboardType: TextInputType.name,
                          onChanged: (value) => context.read<SignupBloc>().add(
                            SignupBusinessNameChanged(value),
                          ),
                        ),
                        20.vertSpacing,
                        const VendorBusinessAddressField(),
                        20.vertSpacing,
                        EventraPhoneTextfield(
                          label: l10n.phoneLabel,
                          hint: l10n.phoneHint,
                          onChanged: (value) => context.read<SignupBloc>().add(
                            SignupBusinessPhoneChanged(value),
                          ),
                        ),
                        20.vertSpacing,
                        EventraGeneralTextfield(
                          label: l10n.vendorBusinessServicesLabel,
                          hint: l10n.vendorBusinessServicesHint,
                          initialValue: state.businessServices,
                          keyboardType: TextInputType.text,
                          onChanged: (value) => context.read<SignupBloc>().add(
                            SignupBusinessServicesChanged(value),
                          ),
                        ),
                        8.vertSpacing,
                        Text(
                          l10n.vendorBusinessServicesAddMore,
                          style: 14.w500.copyWith(color: colorScheme.primary),
                        ),
                        20.vertSpacing,
                        VendorBusinessDescriptionField(
                          label: l10n.vendorBusinessDescriptionLabel,
                          hint: l10n.vendorBusinessDescriptionHint,
                          initialValue: state.businessDescription,
                          onChanged: (value) => context.read<SignupBloc>().add(
                            SignupBusinessDescriptionChanged(value),
                          ),
                        ),
                        20.vertSpacing,
                        VendorBusinessUploadField(
                          label: l10n.vendorBusinessLogoLabel,
                          hint: EventraVectors.uploadBusinessLogo,
                        ),
                        20.vertSpacing,
                        VendorBusinessUploadField(
                          label: l10n.vendorBusinessCoverPhotoLabel,
                          hint: EventraVectors.uploadCoverPhoto,
                        ),
                        const Spacer(),
                        28.vertSpacing,
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
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
