import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class EventTypeDropdown extends StatefulWidget {
  const EventTypeDropdown({
    required this.onChanged,
    this.initialValue,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final String? initialValue;

  @override
  State<EventTypeDropdown> createState() => _EventTypeDropdownState();
}

class _EventTypeDropdownState extends State<EventTypeDropdown> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? '';
  }

  List<EventType> get _eventTypes => [
    EventType(
      key: 'weddings',
      label: context.l10n.eventTypeWeddings,
    ),
    EventType(
      key: 'birthday',
      label: context.l10n.eventTypeBirthday,
    ),
    EventType(
      key: 'anniversary',
      label: context.l10n.eventTypeAnniversary,
    ),
    EventType(
      key: 'engagement',
      label: context.l10n.eventTypeEngagement,
    ),
    EventType(
      key: 'corporate',
      label: context.l10n.eventTypeCorporate,
    ),
    EventType(
      key: 'conference',
      label: context.l10n.eventTypeConference,
    ),
    EventType(
      key: 'walkathon',
      label: context.l10n.eventTypeWalkathon,
    ),
    EventType(
      key: 'other',
      label: context.l10n.eventTypeOther,
    ),
  ];

  Future<void> _showEventTypeBottomSheet() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return EventTypeBottomSheet(
          eventTypes: _eventTypes,
          selectedValue: _selectedValue,
        );
      },
    );

    if (selected != null) {
      setState(() {
        _selectedValue = selected;
      });
      widget.onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    const directColorScheme = AppColorSchemes.subtitleTextColor;
    final colorScheme = Theme.of(context).colorScheme;

    final selectedLabel = _eventTypes
        .firstWhere(
          (e) => e.key == _selectedValue,
          orElse: () => EventType(key: '', label: ''),
        )
        .label;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.enquiryFormEventType,
          style: 14.w500.copyWith(color: directColorScheme),
        ),
        GestureDetector(
          onTap: _showEventTypeBottomSheet,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLabel.isEmpty
                      ? context.l10n.enquiryFormEventTypeHint
                      : selectedLabel,
                  style: 14.w400.copyWith(
                    color: selectedLabel.isEmpty
                        ? colorScheme.onSurfaceVariant
                        : colorScheme.onSurface,
                  ),
                ),
                Icon(
                  Icons.expand_more,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EventType {
  EventType({
    required this.key,
    required this.label,
  });

  final String key;
  final String label;
}

class EventTypeBottomSheet extends StatelessWidget {
  const EventTypeBottomSheet({
    required this.eventTypes,
    required this.selectedValue,
    super.key,
  });

  final List<EventType> eventTypes;
  final String selectedValue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            context.l10n.enquiryFormEventType,
            style: 16.w600.copyWith(color: colorScheme.onSurface),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: eventTypes.length,
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                height: 1,
                color: colorScheme.outlineVariant,
              ),
            ),
            itemBuilder: (context, index) {
              final eventType = eventTypes[index];
              final isSelected = eventType.key == selectedValue;

              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, eventType.key);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventType.label,
                        style: 14.w500.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check,
                          color: colorScheme.primary,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.l10n.commonCancel),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
