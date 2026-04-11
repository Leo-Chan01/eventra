import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/notification_tab_button.dart';
import 'package:flutter/material.dart';

class NotificationTabSwitcher extends StatelessWidget {
  const NotificationTabSwitcher({
    required this.selectedTab,
    required this.allCountLabel,
    required this.unreadCountLabel,
    required this.onChanged,
    super.key,
  });

  final NotificationTab selectedTab;
  final String allCountLabel;
  final String unreadCountLabel;
  final ValueChanged<NotificationTab> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: NotificationTabButton(
                label: allCountLabel,
                isSelected: selectedTab == NotificationTab.all,
                onTap: () => onChanged(NotificationTab.all),
              ),
            ),
            8.horizSpacing,
            Expanded(
              child: NotificationTabButton(
                label: unreadCountLabel,
                isSelected: selectedTab == NotificationTab.unread,
                onTap: () => onChanged(NotificationTab.unread),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
