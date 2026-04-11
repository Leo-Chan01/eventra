import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class HomeProfileSectionTitle extends StatelessWidget {
  const HomeProfileSectionTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: 15.w700.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
