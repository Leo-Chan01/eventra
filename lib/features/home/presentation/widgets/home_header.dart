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
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.homeHello,
                    style: 22.w500.copyWith(color: colorScheme.onSurface),
                  ),
                  4.horizSpacing,
                  Text(
                    userName,
                    style: 22.w700.copyWith(color: colorScheme.onSurface),
                  ),
                ],
              ),
              4.vertSpacing,
              Text(
                l10n.homeExplore,
                style: 13.w400.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        HeaderIcon(
          icon: SvgPicture.asset(EventraVectors.chatMessage),
          onPressed: () {},
        ),
        10.horizSpacing,
        HeaderIcon(
          icon: SvgPicture.asset(EventraVectors.notificationBell),
          hasNotification: true,
          onPressed: () {},
        ),
      ],
    );
  }
}
