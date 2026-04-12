import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/client_inbox/domain/models/chat_message.dart';
import 'package:eventra/features/client/client_inbox/domain/models/message_thread.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ClientInboxEvent extends Equatable {
  const ClientInboxEvent();

  @override
  List<Object?> get props => [];
}

class InboxSearchChanged extends ClientInboxEvent {
  const InboxSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class InboxThreadSelected extends ClientInboxEvent {
  const InboxThreadSelected(this.threadId);

  final String threadId;

  @override
  List<Object?> get props => [threadId];
}

class InboxVendorStarted extends ClientInboxEvent {
  const InboxVendorStarted({
    required this.vendorId,
    required this.vendorName,
    required this.catalogItem,
  });

  final String vendorId;
  final String vendorName;
  final CatalogItem catalogItem;

  @override
  List<Object?> get props => [vendorId, vendorName, catalogItem];
}

class InboxMessageSent extends ClientInboxEvent {
  const InboxMessageSent(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

class InboxInputChanged extends ClientInboxEvent {
  const InboxInputChanged(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

class ClientInboxState extends Equatable {
  const ClientInboxState({
    this.threads = const [],
    this.selectedThreadId = '',
    this.allMessages = const {},
    this.searchQuery = '',
    this.currentInput = '',
  });

  final List<MessageThread> threads;
  final String selectedThreadId;
  final Map<String, List<ChatMessage>> allMessages;
  final String searchQuery;
  final String currentInput;

  MessageThread get selectedThread => threads.firstWhere(
    (t) => t.id == selectedThreadId,
    orElse: () => threads.isNotEmpty ? threads.first : _emptyThread,
  );

  List<ChatMessage> get currentMessages =>
      allMessages[selectedThreadId] ?? const [];

  List<MessageThread> get visibleThreads {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return threads;
    return threads
        .where((t) => t.vendorName.toLowerCase().contains(query))
        .toList();
  }

  ClientInboxState copyWith({
    List<MessageThread>? threads,
    String? selectedThreadId,
    Map<String, List<ChatMessage>>? allMessages,
    String? searchQuery,
    String? currentInput,
  }) {
    return ClientInboxState(
      threads: threads ?? this.threads,
      selectedThreadId: selectedThreadId ?? this.selectedThreadId,
      allMessages: allMessages ?? this.allMessages,
      searchQuery: searchQuery ?? this.searchQuery,
      currentInput: currentInput ?? this.currentInput,
    );
  }

  @override
  List<Object?> get props => [
    threads,
    selectedThreadId,
    allMessages,
    searchQuery,
    currentInput,
  ];
}

class ClientInboxBloc extends Bloc<ClientInboxEvent, ClientInboxState> {
  ClientInboxBloc() : super(_buildInitialState()) {
    on<InboxSearchChanged>(_onSearchChanged);
    on<InboxThreadSelected>(_onThreadSelected);
    on<InboxVendorStarted>(_onVendorStarted);
    on<InboxMessageSent>(_onMessageSent);
    on<InboxInputChanged>(_onInputChanged);
  }

  void _onSearchChanged(
    InboxSearchChanged event,
    Emitter<ClientInboxState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _onThreadSelected(
    InboxThreadSelected event,
    Emitter<ClientInboxState> emit,
  ) {
    emit(state.copyWith(selectedThreadId: event.threadId));
  }

  void _onVendorStarted(
    InboxVendorStarted event,
    Emitter<ClientInboxState> emit,
  ) {
    final threadId = event.vendorId;
    final existingThread = state.threads
        .where((t) => t.id == threadId)
        .toList();

    if (existingThread.isEmpty) {
      final newThread = MessageThread(
        id: threadId,
        vendorName: event.vendorName,
        vendorAvatar: EventraImages.onboardingImage1,
        lastMessage: event.catalogItem.title,
        lastMessageTime: 'Now',
        unreadCount: 0,
        isOnline: true,
      );

      final initialMessages = [
        ChatMessage(
          id: 'msg-init-1',
          text: event.catalogItem.title,
          isFromClient: true,
          time: '1:20 PM',
          enquiryAttachment: event.catalogItem,
        ),
      ];

      final updatedThreads = [newThread, ...state.threads];
      final updatedMessages = Map<String, List<ChatMessage>>.from(
        state.allMessages,
      )..[threadId] = initialMessages;

      emit(
        state.copyWith(
          threads: updatedThreads,
          selectedThreadId: threadId,
          allMessages: updatedMessages,
        ),
      );
    } else {
      emit(state.copyWith(selectedThreadId: threadId));
    }
  }

  void _onMessageSent(
    InboxMessageSent event,
    Emitter<ClientInboxState> emit,
  ) {
    if (event.text.trim().isEmpty) return;

    final newMessage = ChatMessage(
      id: 'msg-${DateTime.now().millisecondsSinceEpoch}',
      text: event.text.trim(),
      isFromClient: true,
      time: _currentTimeLabel(),
    );

    final currentMessages = List<ChatMessage>.from(state.currentMessages)
      ..add(newMessage);

    final updatedMessages = Map<String, List<ChatMessage>>.from(
      state.allMessages,
    )..[state.selectedThreadId] = currentMessages;

    final updatedThreads = state.threads.map((t) {
      if (t.id == state.selectedThreadId) {
        return MessageThread(
          id: t.id,
          vendorName: t.vendorName,
          vendorAvatar: t.vendorAvatar,
          lastMessage: event.text.trim(),
          lastMessageTime: 'Now',
          unreadCount: t.unreadCount,
          isOnline: t.isOnline,
        );
      }
      return t;
    }).toList();

    emit(
      state.copyWith(
        allMessages: updatedMessages,
        threads: updatedThreads,
        currentInput: '',
      ),
    );
  }

  void _onInputChanged(
    InboxInputChanged event,
    Emitter<ClientInboxState> emit,
  ) {
    emit(state.copyWith(currentInput: event.text));
  }

  String _currentTimeLabel() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  static ClientInboxState _buildInitialState() {
    const threads = [
      MessageThread(
        id: 'vendor-001',
        vendorName: 'Pozera Events',
        vendorAvatar: EventraImages.onboardingImage1,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'Today',
        unreadCount: 1,
        isOnline: true,
      ),
      MessageThread(
        id: 'thread-002',
        vendorName: 'Moses',
        vendorAvatar: EventraImages.onboardingImage2,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'Today',
        unreadCount: 1,
        isOnline: false,
      ),
      MessageThread(
        id: 'thread-003',
        vendorName: 'David',
        vendorAvatar: EventraImages.onboardingImage1,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'Yesterday',
        unreadCount: 0,
        isOnline: false,
      ),
      MessageThread(
        id: 'thread-004',
        vendorName: 'Chris',
        vendorAvatar: EventraImages.onboardingImage2,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'May 31',
        unreadCount: 0,
        isOnline: false,
      ),
      MessageThread(
        id: 'thread-005',
        vendorName: 'Mark',
        vendorAvatar: EventraImages.onboardingImage1,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'May 23',
        unreadCount: 0,
        isOnline: false,
      ),
      MessageThread(
        id: 'thread-006',
        vendorName: 'Melo',
        vendorAvatar: EventraImages.onboardingImage2,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'May 24',
        unreadCount: 0,
        isOnline: false,
      ),
      MessageThread(
        id: 'thread-007',
        vendorName: 'Mirabel',
        vendorAvatar: EventraImages.onboardingImage1,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'May 24',
        unreadCount: 0,
        isOnline: false,
      ),
      MessageThread(
        id: 'thread-008',
        vendorName: 'Thinothy',
        vendorAvatar: EventraImages.onboardingImage2,
        lastMessage: 'Hello, How are you doing?',
        lastMessageTime: 'May 29',
        unreadCount: 0,
        isOnline: false,
      ),
    ];

    const pozeraMessages = [
      ChatMessage(
        id: 'msg-001',
        text: 'Hello, I want to make an enquiry',
        isFromClient: true,
        time: '1:20 PM',
      ),
      ChatMessage(
        id: 'msg-002',
        text:
            'You will get a notification once Pozera Event review your'
            ' enquiry.',
        isFromClient: false,
        time: '1:22 PM',
        isEnquiryConfirmation: true,
        // hasInvoice: false,
      ),
      ChatMessage(
        id: 'msg-003',
        text:
            'Pozera Events has confirmed your enquiry, you can now chat with'
            ' pozera for more details on booking',
        isFromClient: false,
        time: '1:23 PM',
        isEnquiryConfirmation: true,
      ),
      ChatMessage(
        id: 'msg-004',
        text: 'Hello, Can i get more information on what you want to achieve',
        isFromClient: false,
        time: '1:27 PM',
      ),
      ChatMessage(
        id: 'msg-005',
        text: 'Can i get an invoice',
        isFromClient: true,
        time: '1:30 PM',
      ),
      ChatMessage(
        id: 'msg-006',
        text: 'Booking Invoice',
        isFromClient: false,
        time: '1:32 PM',
        hasInvoice: true,
      ),
    ];

    return const ClientInboxState(
      threads: threads,
      selectedThreadId: 'vendor-001',
      allMessages: {'vendor-001': pozeraMessages},
    );
  }
}

const _emptyThread = MessageThread(
  id: '',
  vendorName: '',
  vendorAvatar: '',
  lastMessage: '',
  lastMessageTime: '',
  unreadCount: 0,
  isOnline: false,
);
