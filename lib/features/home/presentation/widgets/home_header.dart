import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/header_icon.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.userName,
    super.key,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  l10n.homeHello,
                  style: 20.regular.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                4.horizSpacing,
                Text(
                  userName,
                  style: 20.bold.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Text(
              l10n.homeExplore,
              style: 14.regular.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        Row(
          children: [
            HeaderIcon(
              icon: SvgPicture.asset(EventraVectors.chatMessage),
              onPressed: () {},
            ),
            12.horizSpacing,
            HeaderIcon(
              icon: SvgPicture.asset(EventraVectors.notificationBell),
              hasNotification: true,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
