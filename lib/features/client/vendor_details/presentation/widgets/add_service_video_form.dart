import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/add_service_media_placeholder_tile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AddServiceVideoForm extends StatelessWidget {
  const AddServiceVideoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.addServiceVideoDescription,
          style: 16.w500.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        24.vertSpacing,
        AddServiceMediaPlaceholderTile(
          height: 280,
          icon: HugeIcons.strokeRoundedPlayCircle,
          iconSize: 72,
          title: l10n.addServiceTapToUploadVideo,
          subtitle: l10n.addServiceVideoMaxDuration,
        ),
        24.vertSpacing,
        EventraGeneralTextfield(
          hint: l10n.addServiceVideoTitleHint,
          label: l10n.addServiceTitleLabel,
          keyboardType: TextInputType.text,
        ),
        20.vertSpacing,
        EventraGeneralTextfield(
          hint: l10n.addServiceTagServicesHint,
          label: l10n.addServiceTagServicesLabel,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
