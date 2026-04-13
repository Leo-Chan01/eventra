import 'package:equatable/equatable.dart';
import 'package:eventra/features/home/domain/models/home_search_event_item.dart';

class TicketEventDetailArgs extends Equatable {
  const TicketEventDetailArgs({required this.event});

  final HomeSearchEventItem event;

  @override
  List<Object?> get props => [event];
}
