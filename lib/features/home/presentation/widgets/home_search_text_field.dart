import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({
    required this.focusNode,
    required this.onChanged,
    super.key,
  });

  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: TextField(
            key: const Key('home_search_input'),
            focusNode: focusNode,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                ),
              ),
              hintText: l10n.homeSearchPlaceholder,
              hintStyle: 14.w400.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              fillColor: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.35,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  EventraVectors.searchNormal,
                  height: 20,
                  width: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  EventraVectors.filterIcon,
                  // width: 24,
                  // height: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
