import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({
    required this.onChanged,
    super.key,
  });

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
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: l10n.homeSearchPlaceholder,
              hintStyle: 14.w400.copyWith(
                color: colorScheme.onSurfaceVariant,
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
                padding: const EdgeInsets.all(12),
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
