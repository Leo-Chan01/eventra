import 'package:flutter/material.dart';

List<BoxShadow> boxShadowLight = [
  BoxShadow(
    color: const Color(0xFF3B4D81).withValues(alpha: 0.08),
    blurRadius: 40,
    // offset: Offset.zero,
  ),
];

List<BoxShadow> boxShadowDark = [
  BoxShadow(
    color: const Color(0xFF3B4D81).withValues(alpha: 0.5),
    blurRadius: 10,
    // offset: Offset.zero,
  ),
];

Widget standardDividerUtil(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return Divider(
    color: colorScheme.outlineVariant.withValues(alpha: 0.06),
    height: 1,
  );
}
