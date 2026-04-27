import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/widgets/eventra_dotted_border.dart';
import 'package:flutter/material.dart';

class VendorEditProfilePhotoSection extends StatelessWidget {
  const VendorEditProfilePhotoSection({
    required this.label,
    required this.imagePath,
    required this.buttonText,
    super.key,
  });

  final String label;
  final String imagePath;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        12.vertSpacing,
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: EventraDottedBorder(
            color: colorScheme.primary,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => ColoredBox(
                      color: colorScheme.primaryContainer,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ColoredBox(
                    color: colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: colorScheme.surface,
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      buttonText,
                      style: 14.w400.copyWith(color: colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
