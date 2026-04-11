import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSupportOptionCard extends StatelessWidget {
  const ProfileSupportOptionCard({
    required this.iconPath,
    required this.label,
    required this.onTap,
    super.key,
  });

  final String iconPath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: ProfileSurfaceCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Column(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              12.vertSpacing,
              Text(
                label,
                textAlign: TextAlign.center,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
