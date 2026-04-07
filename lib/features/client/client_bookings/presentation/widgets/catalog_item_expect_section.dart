import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_expect_point.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CatalogItemExpectSection extends StatelessWidget {
  const CatalogItemExpectSection({
    required this.points,
    super.key,
  });

  final List<String> points;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.catalogItemWhatToExpect,
          style: 15.w700.copyWith(color: colorScheme.onSurface),
        ),
        12.vertSpacing,
        ...points.map((p) => CatalogItemExpectPoint(text: p)),
      ],
    );
  }
}
