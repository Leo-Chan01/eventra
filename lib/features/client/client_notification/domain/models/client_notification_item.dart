import 'package:equatable/equatable.dart';

class ClientNotificationItem extends Equatable {
  const ClientNotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.timeLabel,
    required this.actionText,
    this.isUnread = false,
    this.transactionId,
  });

  final String id;
  final String title;
  final String message;
  final String timeLabel;
  final String actionText;
  final bool isUnread;
  final String? transactionId;

  bool get opensTransaction => transactionId != null;

  @override
  List<Object?> get props => [
    id,
    title,
    message,
    timeLabel,
    actionText,
    isUnread,
    transactionId,
  ];
}
