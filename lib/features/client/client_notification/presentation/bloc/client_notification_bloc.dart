import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/client_notification/domain/models/client_notification_item.dart';
import 'package:eventra/features/client/client_notification/domain/models/transaction_record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NotificationTab { all, unread }

enum TransactionFilter { all, completed, pending, failed }

abstract class ClientNotificationEvent extends Equatable {
  const ClientNotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationTabChanged extends ClientNotificationEvent {
  const NotificationTabChanged(this.tab);

  final NotificationTab tab;

  @override
  List<Object?> get props => [tab];
}

class TransactionFilterChanged extends ClientNotificationEvent {
  const TransactionFilterChanged(this.filter);

  final TransactionFilter filter;

  @override
  List<Object?> get props => [filter];
}

class TransactionSearchChanged extends ClientNotificationEvent {
  const TransactionSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class TransactionSelected extends ClientNotificationEvent {
  const TransactionSelected(this.transactionId);

  final String transactionId;

  @override
  List<Object?> get props => [transactionId];
}

class ClientNotificationState extends Equatable {
  const ClientNotificationState({
    this.notificationTab = NotificationTab.all,
    this.transactionFilter = TransactionFilter.all,
    this.searchQuery = '',
    this.notifications = const [],
    this.transactions = const [],
    this.selectedTransactionId = '',
    this.totalSpent = 0,
    this.totalRefunds = 0,
  });

  final NotificationTab notificationTab;
  final TransactionFilter transactionFilter;
  final String searchQuery;
  final List<ClientNotificationItem> notifications;
  final List<TransactionRecord> transactions;
  final String selectedTransactionId;
  final double totalSpent;
  final double totalRefunds;

  int get unreadCount => notifications.where((item) => item.isUnread).length;

  List<ClientNotificationItem> get visibleNotifications {
    if (notificationTab == NotificationTab.unread) {
      return notifications.where((item) => item.isUnread).toList();
    }
    return notifications;
  }

  List<TransactionRecord> get visibleTransactions {
    final query = searchQuery.trim().toLowerCase();

    return transactions.where((transaction) {
      final matchesFilter = switch (transactionFilter) {
        TransactionFilter.all => true,
        TransactionFilter.completed =>
          transaction.status == TransactionStatus.completed,
        TransactionFilter.pending =>
          transaction.status == TransactionStatus.pending,
        TransactionFilter.failed =>
          transaction.status == TransactionStatus.failed,
      };

      final matchesQuery =
          query.isEmpty ||
          transaction.vendorName.toLowerCase().contains(query) ||
          transaction.category.toLowerCase().contains(query) ||
          transaction.reference.toLowerCase().contains(query);

      return matchesFilter && matchesQuery;
    }).toList();
  }

  TransactionRecord get selectedTransaction {
    return transactions.firstWhere(
      (transaction) => transaction.id == selectedTransactionId,
      orElse: () => transactions.first,
    );
  }

  ClientNotificationState copyWith({
    NotificationTab? notificationTab,
    TransactionFilter? transactionFilter,
    String? searchQuery,
    List<ClientNotificationItem>? notifications,
    List<TransactionRecord>? transactions,
    String? selectedTransactionId,
    double? totalSpent,
    double? totalRefunds,
  }) {
    return ClientNotificationState(
      notificationTab: notificationTab ?? this.notificationTab,
      transactionFilter: transactionFilter ?? this.transactionFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      notifications: notifications ?? this.notifications,
      transactions: transactions ?? this.transactions,
      selectedTransactionId:
          selectedTransactionId ?? this.selectedTransactionId,
      totalSpent: totalSpent ?? this.totalSpent,
      totalRefunds: totalRefunds ?? this.totalRefunds,
    );
  }

  @override
  List<Object?> get props => [
    notificationTab,
    transactionFilter,
    searchQuery,
    notifications,
    transactions,
    selectedTransactionId,
    totalSpent,
    totalRefunds,
  ];
}

class ClientNotificationBloc
    extends Bloc<ClientNotificationEvent, ClientNotificationState> {
  ClientNotificationBloc() : super(_buildInitialState()) {
    on<NotificationTabChanged>(_onNotificationTabChanged);
    on<TransactionFilterChanged>(_onTransactionFilterChanged);
    on<TransactionSearchChanged>(_onTransactionSearchChanged);
    on<TransactionSelected>(_onTransactionSelected);
  }

  void _onNotificationTabChanged(
    NotificationTabChanged event,
    Emitter<ClientNotificationState> emit,
  ) {
    emit(state.copyWith(notificationTab: event.tab));
  }

  void _onTransactionFilterChanged(
    TransactionFilterChanged event,
    Emitter<ClientNotificationState> emit,
  ) {
    emit(state.copyWith(transactionFilter: event.filter));
  }

  void _onTransactionSearchChanged(
    TransactionSearchChanged event,
    Emitter<ClientNotificationState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _onTransactionSelected(
    TransactionSelected event,
    Emitter<ClientNotificationState> emit,
  ) {
    emit(state.copyWith(selectedTransactionId: event.transactionId));
  }

  static ClientNotificationState _buildInitialState() {
    const notifications = [
      ClientNotificationItem(
        id: 'notif-1',
        title: 'Enquiry !',
        message: 'Bayo Adeyemo just sent you an enquiry for a wedding.',
        timeLabel: '5 min ago',
        actionText: 'View Details',
        isUnread: true,
        transactionId: 'txn-evt-2026-001892',
      ),
      ClientNotificationItem(
        id: 'notif-2',
        title: 'New Invoice Received',
        message: 'Moses just credited your account with the sum of ₦890,000.',
        timeLabel: '5 min ago',
        actionText: 'View invoice',
        isUnread: true,
        transactionId: 'txn-evt-2026-001892',
      ),
      ClientNotificationItem(
        id: 'notif-3',
        title: 'Enquiry !',
        message: 'Bayo Adeyemo just sent you an enquiry for a wedding.',
        timeLabel: '5 min ago',
        actionText: 'View Details',
        isUnread: true,
        transactionId: 'txn-evt-2026-001892',
      ),
      ClientNotificationItem(
        id: 'notif-4',
        title: "New Message from Ayo's Photography",
        message:
            'Elegant Decor Lagos sent you an invoice for ₦890,000. Review and'
            ' accept the contract to proceed.',
        timeLabel: '5 min ago',
        actionText: 'Reply',
      ),
      ClientNotificationItem(
        id: 'notif-5',
        title: 'Booking Confirmed',
        message:
            "Your booking with Ayo's Photography for March 15, 2026 "
            'has been confirmed.',
        timeLabel: '2 hours ago',
        actionText: 'View Details',
        transactionId: 'txn-evt-2026-001875',
      ),
      ClientNotificationItem(
        id: 'notif-6',
        title: 'Payment Successful',
        message:
            'Your payment of ₦180,250 has been processed successfully. '
            'Receipt sent to your email.',
        timeLabel: '3 hours ago',
        actionText: 'View Details',
        transactionId: 'txn-evt-2026-001875',
      ),
      ClientNotificationItem(
        id: 'notif-7',
        title: 'Weekend Special Offer!',
        message:
            'Get 15% off on all DJ bookings this weekend. '
            'Book now and save!',
        timeLabel: '5 hours ago',
        actionText: 'Browse DJs',
      ),
      ClientNotificationItem(
        id: 'notif-8',
        title: 'Leave a Review',
        message:
            'How was your experience with Afrobeat DJs? '
            'Share your feedback to help others.',
        timeLabel: '1 day ago',
        actionText: 'Write Review',
      ),
    ];

    const transactions = [
      TransactionRecord(
        id: 'txn-evt-2026-001892',
        vendorName: 'Elegant Decor Lagos',
        category: 'Decoration',
        amount: 890000,
        status: TransactionStatus.completed,
        dateLabel: 'Feb 18, 2026 at 2:30 PM',
        reference: 'TXN-EVT-2026-001892',
        paymentSource: 'Card •••• 4532',
        vendorEmail: 'info@elegantdecorlagos.com',
        vendorPhone: '+234 803 456 7890',
        vendorAddress: 'Lagos, Nigeria',
        eventType: 'Wedding',
        eventDate: 'March 15, 2026',
        description: 'Decoration service for your event',
        subtotal: 845500,
        serviceFee: 26700,
        tax: 17800,
        statusNote: 'Your payment has been processed successfully',
        paymentBadge: 'Payment Sent',
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001875',
        vendorName: "Ayo's Photography",
        category: 'Photography',
        amount: 180250,
        status: TransactionStatus.completed,
        dateLabel: 'Feb 17, 2026',
        reference: 'TXN-EVT-2026-001875',
        paymentSource: 'Bank Transfer',
        vendorEmail: 'hello@ayosphotography.com',
        vendorPhone: '+234 802 100 0033',
        vendorAddress: 'Lekki, Lagos',
        eventType: 'Wedding',
        eventDate: 'March 15, 2026',
        description: 'Photography coverage package',
        subtotal: 171000,
        serviceFee: 5400,
        tax: 3850,
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001864',
        vendorName: 'Afrobeat DJs',
        category: 'DJ',
        amount: 125000,
        status: TransactionStatus.pending,
        dateLabel: 'Feb 16, 2026',
        reference: 'TXN-EVT-2026-001864',
        paymentSource: 'Card •••• 4532',
        vendorEmail: 'bookings@afrobeatdjs.com',
        vendorPhone: '+234 806 555 0012',
        vendorAddress: 'Yaba, Lagos',
        eventType: 'Birthday',
        eventDate: 'April 4, 2026',
        description: 'DJ entertainment package',
        subtotal: 118000,
        serviceFee: 4200,
        tax: 2800,
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001842',
        vendorName: 'Lagos Event Planners',
        category: 'Event Planning',
        amount: 50000,
        status: TransactionStatus.completed,
        dateLabel: 'Feb 15, 2026',
        reference: 'TXN-EVT-2026-001842',
        paymentSource: 'Original Payment Method',
        vendorEmail: 'info@lagoseventplanners.com',
        vendorPhone: '+234 809 450 2200',
        vendorAddress: 'Victoria Island, Lagos',
        eventType: 'Corporate Event',
        eventDate: 'April 20, 2026',
        description: 'Refund processed for revised brief',
        subtotal: 50000,
        serviceFee: 0,
        tax: 0,
        isCredit: true,
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001823',
        vendorName: 'Naija Caterers Premium',
        category: 'Catering',
        amount: 450000,
        status: TransactionStatus.completed,
        dateLabel: 'Feb 14, 2026',
        reference: 'TXN-EVT-2026-001823',
        paymentSource: 'Bank Transfer',
        vendorEmail: 'bookings@naijacaterers.com',
        vendorPhone: '+234 704 220 3000',
        vendorAddress: 'Ikeja, Lagos',
        eventType: 'Wedding',
        eventDate: 'May 3, 2026',
        description: 'Full catering service package',
        subtotal: 427000,
        serviceFee: 14100,
        tax: 8900,
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001801',
        vendorName: 'Luxury Tents & Canopies',
        category: 'Rentals',
        amount: 85000,
        status: TransactionStatus.failed,
        dateLabel: 'Feb 13, 2026',
        reference: 'TXN-EVT-2026-001801',
        paymentSource: 'Card •••• 4532',
        vendorEmail: 'hi@luxurytents.com',
        vendorPhone: '+234 805 000 7788',
        vendorAddress: 'Lekki, Lagos',
        eventType: 'Outdoor Event',
        eventDate: 'April 8, 2026',
        description: 'Tent rental deposit',
        subtotal: 80000,
        serviceFee: 3000,
        tax: 2000,
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001793',
        vendorName: 'Sound & Lights Pro',
        category: 'Equipment',
        amount: 50000,
        status: TransactionStatus.completed,
        dateLabel: 'Feb 12, 2026',
        reference: 'TXN-EVT-2026-001793',
        paymentSource: 'Bank Transfer',
        vendorEmail: 'sales@soundandlightspro.com',
        vendorPhone: '+234 814 777 0112',
        vendorAddress: 'Surulere, Lagos',
        eventType: 'Concert',
        eventDate: 'June 12, 2026',
        description: 'Sound check deposit',
        subtotal: 47200,
        serviceFee: 1800,
        tax: 1000,
      ),
      TransactionRecord(
        id: 'txn-evt-2026-001756',
        vendorName: 'Royal Ushers Nigeria',
        category: 'Ushering',
        amount: 35000,
        status: TransactionStatus.completed,
        dateLabel: 'Feb 10, 2026',
        reference: 'TXN-EVT-2026-001756',
        paymentSource: 'Card •••• 4532',
        vendorEmail: 'hello@royalushers.ng',
        vendorPhone: '+234 811 340 0060',
        vendorAddress: 'Ajah, Lagos',
        eventType: 'Wedding',
        eventDate: 'March 15, 2026',
        description: 'Ushering service deposit',
        subtotal: 33000,
        serviceFee: 1200,
        tax: 800,
      ),
    ];

    return const ClientNotificationState(
      notifications: notifications,
      transactions: transactions,
      selectedTransactionId: 'txn-evt-2026-001892',
      totalSpent: 1650250,
      totalRefunds: 50000,
    );
  }
}
