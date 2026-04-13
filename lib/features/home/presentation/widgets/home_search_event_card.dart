import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_search_event_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSearchEventCard extends StatelessWidget {
  const HomeSearchEventCard({required this.event, super.key});

  final HomeSearchEventItem event;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              event.imagePath,
              width: double.infinity,
              height: 168,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColorSchemes.accent950.withValues(alpha: 0.1),
                      ),
                      child: Text(
                        event.category,
                        style: 14.w400.copyWith(
                          color: AppColorSchemes.accent950,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      EventraVectors.locationPin,
                      width: 12,
                      height: 12,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                    4.horizSpacing,
                    Text(
                      event.location,
                      style: 12.w500.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                12.vertSpacing,
                Text(
                  event.title,
                  style: 16.w700.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                8.vertSpacing,
                Text(
                  event.description,
                  style: 14.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                12.vertSpacing,
                Row(
                  children: [
                    Text(
                      event.price,
                      style: 16.w700.copyWith(color: colorScheme.primary),
                    ),
                    const Spacer(),
                    Text(
                      event.dateTime,
                      style: 12.w500.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
