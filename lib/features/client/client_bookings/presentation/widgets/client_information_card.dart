import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;

class ClientInformationCard extends StatelessWidget {
  const ClientInformationCard({
    required this.clientName,
    required this.clientAvatarPath,
    required this.eventType,
    required this.eventDate,
    super.key,
  });

  final String clientName;
  final String clientAvatarPath;
  final String eventType;
  final DateTime eventDate;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final formattedDate = intl.DateFormat(
      'd MMMM, y',
      localeTag,
    ).format(eventDate);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              clientAvatarPath,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  width: 56,
                  height: 56,
                  color: colorScheme.primary.withValues(alpha: 0.12),
                  alignment: Alignment.center,
                  child: Text(
                    _buildInitials(clientName),
                    style: 16.w700.copyWith(color: colorScheme.primary),
                  ),
                );
              },
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clientName,
                  style: 16.w600.copyWith(color: colorScheme.onSurface),
                  overflow: TextOverflow.ellipsis,
                ),
                6.vertSpacing,
                if (eventType.trim().isNotEmpty) ...[
                  Text(
                    'Event Type: $eventType',
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  6.vertSpacing,
                ],
                Text(
                  '${context.l10n.enquiryFlowDate}: $formattedDate',
                  style: 14.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          12.horizSpacing,
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.surface,
              border: Border.all(color: colorScheme.outline),
            ),
            child: SvgPicture.asset(EventraVectors.chatMessage),
          ),
        ],
      ),
    );
  }

  String _buildInitials(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) {
      return '?';
    }

    final first = parts.first.characters.first.toUpperCase();
    final second = parts.length > 1 && parts[1].isNotEmpty
        ? parts[1].characters.first.toUpperCase()
        : '';
    return '$first$second';
  }
}
