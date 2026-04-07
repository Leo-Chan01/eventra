import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({
    required this.controller,
    required this.onChanged,
    required this.onSend,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      color: colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: 14.w400.copyWith(color: colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: l10n.chatInputHint,
                prefixIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSmile,
                  size: 22,
                  color: colorScheme.onSurfaceVariant,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          10.horizSpacing,
          GestureDetector(
            onTap: () {},
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedAttachment01,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          10.horizSpacing,
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSent,
                size: 18,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
