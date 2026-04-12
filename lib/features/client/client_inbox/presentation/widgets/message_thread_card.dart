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

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            _ThreadAvatar(
              imageUrl: thread.vendorAvatar,
              isOnline: thread.isOnline,
            ),
            14.horizSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          thread.vendorName,
                          style: 14.w600.copyWith(color: colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        thread.lastMessageTime,
                        style: 11.w400.copyWith(
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
                          style: 12.w400.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (thread.hasUnread) ...[
                        8.horizSpacing,
                        Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: AppColorSchemes.goldStar,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${thread.unreadCount}',
                              style: 9.w700.copyWith(
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
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 48,
              height: 48,
              color: colorScheme.primaryContainer,
              child: Icon(Icons.person, color: colorScheme.primary),
            ),
          ),
        ),
        if (isOnline)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFF39C07A),
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.surface, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}
