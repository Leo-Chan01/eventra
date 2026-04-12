import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class ProfileExpandableActionTile extends StatefulWidget {
  const ProfileExpandableActionTile({
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
    super.key,
  });

  final String title;
  final String content;
  final bool initiallyExpanded;

  @override
  State<ProfileExpandableActionTile> createState() =>
      _ProfileExpandableActionTileState();
}

class _ProfileExpandableActionTileState
    extends State<ProfileExpandableActionTile>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _toggleExpanded,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: 16.w600.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  12.horizSpacing,
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: _isExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12, right: 28),
                        child: Text(
                          widget.content,
                          style: 14.w400.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.45,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
