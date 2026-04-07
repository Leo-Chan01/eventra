import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: 14.bold.copyWith(color: colorScheme.primary),
          ),
          8.horizSpacing,
          Expanded(
            child: Text(
              text,
              style: 13.w500.copyWith(
                color: colorScheme.primary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
