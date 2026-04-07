import 'package:equatable/equatable.dart';

class MessageThread extends Equatable {
  const MessageThread({
    required this.id,
    required this.vendorName,
    required this.vendorAvatar,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.isOnline,
  });

  final String id;
  final String vendorName;
  final String vendorAvatar;
  final String lastMessage;
  final String lastMessageTime;
  final int unreadCount;
  final bool isOnline;

  bool get hasUnread => unreadCount > 0;

  @override
  List<Object?> get props => [
    id,
    vendorName,
    vendorAvatar,
    lastMessage,
    lastMessageTime,
    unreadCount,
    isOnline,
  ];
}
