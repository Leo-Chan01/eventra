import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_business_description_field.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_edit_profile_photo_section.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_edit_profile_service_field.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class VendorEditProfileBody extends StatelessWidget {
  const VendorEditProfileBody({
    required this.vendor,
    super.key,
  });

  final VendorDetail vendor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final services = vendor.services.isEmpty
        ? [l10n.vendorBusinessServicesHint]
        : vendor.services;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VendorBusinessDescriptionField(
            label: l10n.vendorBusinessDescriptionLabel,
            hint: l10n.vendorBusinessDescriptionHint,
            initialValue: vendor.bio,
            onChanged: (_) {},
          ),
          24.vertSpacing,
          Text(
            l10n.vendorBusinessServicesLabel,
            style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          12.vertSpacing,
          ...services.map(
            (service) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: VendorEditProfileServiceField(initialValue: service),
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            borderRadius: BorderRadius.circular(8),
            child: Text(
              l10n.vendorBusinessServicesAddMore,
              style: 14.w500.copyWith(color: colorScheme.primary),
            ),
          ),
          24.vertSpacing,
          VendorEditProfilePhotoSection(
            label: l10n.vendorBusinessLogoLabel,
            imagePath: vendor.profileImage,
            buttonText: l10n.vendorEditProfileChangePhotoButton,
          ),
          24.vertSpacing,
          VendorEditProfilePhotoSection(
            label: l10n.vendorEditProfileCoverPhotoLabel,
            imagePath: vendor.coverImage,
            buttonText: l10n.vendorEditProfileChangePhotoButton,
          ),
          24.vertSpacing,
          EventraButton(
            buttonText: l10n.vendorEditProfileSaveButton,
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ],
      ),
    );
  }
}
