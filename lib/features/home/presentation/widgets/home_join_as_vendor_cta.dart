import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeJoinAsVendorCTA extends StatelessWidget {
  const HomeJoinAsVendorCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              EventraVectors.shopIcon,
              height: 22.5,
            ),
            4.vertSpacing,
            Text(
              context.l10n.homeJoinAsVendor,
              style: 14.w600.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
