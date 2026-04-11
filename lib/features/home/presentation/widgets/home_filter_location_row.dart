import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeFilterLocationRow extends StatelessWidget {
  const HomeFilterLocationRow({
    required this.location,
    required this.onOpenLocationLookup,
    super.key,
  });

  final String location;
  final VoidCallback onOpenLocationLookup;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            context.l10n.homeFilterLocation(location),
            style: 16.w700.copyWith(color: colorScheme.onSurface),
          ),
        ),
        InkWell(
          key: const Key('home_filter_location_button'),
          onTap: onOpenLocationLookup,
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedLocation01,
              color: colorScheme.onSurface,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
