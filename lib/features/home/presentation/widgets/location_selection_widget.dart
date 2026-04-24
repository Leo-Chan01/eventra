import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/home_location_lookup_sheet.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSelectionWidget extends StatelessWidget {
  const LocationSelectionWidget({
    required this.colorScheme,
    required this.l10n,
    this.locationLabel,
    this.onLocationSelected,
    super.key,
  });

  final ColorScheme colorScheme;
  final AppLocalizations l10n;
  final String? locationLabel;
  final ValueChanged<String>? onLocationSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => HomeLocationLookupSheet.show(
        context,
        onLocationSelected: onLocationSelected,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            EventraVectors.locationPin,
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(
              colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          4.horizSpacing,
          Text(
            locationLabel ?? l10n.vendorHomeLocation,
            style: 12.w400.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          4.horizSpacing,
          Icon(
            Icons.keyboard_arrow_down,
            color: colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
