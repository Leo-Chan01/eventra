import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/add_service_media_placeholder_tile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AddServiceCatalogForm extends StatelessWidget {
  const AddServiceCatalogForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.addServiceCatalogDescription,
          style: 16.w500.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        24.vertSpacing,
        EventraGeneralTextfield(
          hint: l10n.addServiceServiceNameHint,
          label: l10n.addServiceServiceNameLabel,
          keyboardType: TextInputType.text,
        ),
        20.vertSpacing,
        Text(
          l10n.addServicePriceRangeLabel,
          style: 14.w400.copyWith(color: colorScheme.onSurface),
        ),
        8.vertSpacing,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: l10n.addServiceMinimumHint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 56,
                color: colorScheme.outline.withValues(alpha: 0.4),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: l10n.addServiceMaximumHint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        20.vertSpacing,
        EventraGeneralTextfield(
          hint: l10n.addServiceDescriptionHint,
          label: l10n.addServiceDescriptionLabel,
          keyboardType: TextInputType.multiline,
          minLines: 6,
          maxLines: 6,
        ),
        20.vertSpacing,
        Text(
          l10n.addServiceUploadImagesLabel,
          style: 14.w400.copyWith(color: colorScheme.onSurface),
        ),
        12.vertSpacing,
        const Row(
          children: [
            Expanded(
              child: AddServiceMediaPlaceholderTile(
                icon: HugeIcons.strokeRoundedImage01,
                iconSize: 36,
                height: 92,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: AddServiceMediaPlaceholderTile(
                icon: HugeIcons.strokeRoundedImage01,
                iconSize: 36,
                height: 92,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: AddServiceMediaPlaceholderTile(
                icon: HugeIcons.strokeRoundedImage01,
                iconSize: 36,
                height: 92,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
