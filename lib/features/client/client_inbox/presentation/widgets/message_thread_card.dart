import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_inbox/domain/models/message_thread.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class MessageThreadCard extends StatelessWidget {
  const MessageThreadCard({
    required this.thread,
    required this.onTap,
    super.key,
  });

  final MessageThread thread;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final nameColor = thread.hasUnread
        ? colorScheme.onSurface
        : colorScheme.onSurfaceVariant;
    final messageColor = thread.hasUnread
        ? colorScheme.onSurface
        : colorScheme.onSurfaceVariant;
    final nameWeight = thread.hasUnread ? FontWeight.w700 : FontWeight.w500;
    final messageWeight = thread.hasUnread ? FontWeight.w500 : FontWeight.w400;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            _ThreadAvatar(
              imageUrl: thread.vendorAvatar,
              isOnline: thread.isOnline,
            ),
            16.horizSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          thread.vendorName,
                          style: 16.w600.copyWith(
                            color: nameColor,
                            fontWeight: nameWeight,
                          ),
                        ),
                      ),
                      Text(
                        thread.lastMessageTime,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  6.vertSpacing,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          thread.lastMessage,
                          style: 14.w400.copyWith(
                            color: messageColor,
                            fontWeight: messageWeight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (thread.hasUnread) ...[
                        // 10.horizSpacing,
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${thread.unreadCount}',
                              style: 10.w600.copyWith(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThreadAvatar extends StatelessWidget {
  const _ThreadAvatar({required this.imageUrl, required this.isOnline});

  final String imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        ClipOval(
          child: Image.asset(
            imageUrl,
            width: 54,
            height: 54,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 54,
              height: 54,
              color: colorScheme.primaryContainer,
              child: Icon(Icons.person, color: colorScheme.primary),
            ),
          ),
        ),
        if (isOnline)
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: AppColorSchemes.success,
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.surface, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
