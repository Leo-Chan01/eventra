import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: 14.bold.copyWith(color: const Color(0xFFFF5F21)),
          ),
          8.horizSpacing,
          Expanded(
            child: Text(
              text,
              style: 13.w500.copyWith(
                color: const Color(0xFFFF5F21),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
