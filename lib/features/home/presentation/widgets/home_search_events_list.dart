import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_search_event_item.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_event_card.dart';
import 'package:flutter/material.dart';

class HomeSearchEventsList extends StatelessWidget {
  const HomeSearchEventsList({
    required this.events,
    required this.onEventTap,
    super.key,
  });

  final List<HomeSearchEventItem> events;
  final ValueChanged<HomeSearchEventItem> onEventTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const Key('home_search_events_list'),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      itemBuilder: (context, index) {
        return HomeSearchEventCard(
          event: events[index],
          onTap: () => onEventTap(events[index]),
        );
      },
      separatorBuilder: (_, _) => 18.vertSpacing,
      itemCount: events.length,
    );
  }
}
