import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/domain/models/client_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationListCard extends StatelessWidget {
  const NotificationListCard({
    required this.notification,
    required this.onPressed,
    super.key,
  });

  final ClientNotificationItem notification;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    spacing: 10,
                    children: [
                      Text(
                        notification.title,
                        style: 13.w700.copyWith(color: colorScheme.onSurface),
                      ),
                      if (notification.isUnread)
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),

                8.horizSpacing,
                Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            8.vertSpacing,
            Text(
              notification.message,
              style: 12.w400.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.35,
              ),
            ),
            10.vertSpacing,
            Row(
              children: [
                Text(
                  notification.timeLabel,
                  style: 10.w500.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                Text(
                  notification.actionText,
                  style: 11.w700.copyWith(color: colorScheme.onSurface),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
