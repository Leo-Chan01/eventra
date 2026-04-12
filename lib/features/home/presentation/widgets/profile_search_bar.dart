import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSearchBar extends StatelessWidget {
  const ProfileSearchBar({
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onTapFilter,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapFilter;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: 16.w500.copyWith(color: colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: 16.w400.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              fillColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  EventraVectors.searchNormal,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurfaceVariant,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 44),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              suffixIcon: (onTapFilter != null)
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: onTapFilter,
                        borderRadius: BorderRadius.circular(24),
                        child: SvgPicture.asset(
                          EventraVectors.filterIcon,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
