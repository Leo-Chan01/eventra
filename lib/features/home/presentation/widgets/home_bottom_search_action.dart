import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomSearchAction extends StatelessWidget {
  const HomeBottomSearchAction({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: SvgPicture.asset(
          EventraVectors.homeIconSearchNew,
          width: 55,
          height: 55,
        ),
      ),
    );
  }
}
