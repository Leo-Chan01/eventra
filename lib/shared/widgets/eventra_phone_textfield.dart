import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class EventraPhoneTextfield extends StatefulWidget {
  const EventraPhoneTextfield({super.key});

  @override
  State<EventraPhoneTextfield> createState() => _EventraPhoneTextfieldState();
}

class _EventraPhoneTextfieldState extends State<EventraPhoneTextfield> {
  @override
  Widget build(BuildContext context) {
    final inputDecoration = Theme.of(context).inputDecorationTheme;
    const directColorScheme = AppColorSchemes.subtitleTextColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: 14.w500.copyWith(color: directColorScheme),
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
          decoration: InputDecoration(
            hintText: '000 0000 0000',
            hintStyle: inputDecoration.hintStyle,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '234',
                      style: 16.w400.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 12),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
            border: inputDecoration.border,
            enabledBorder: inputDecoration.enabledBorder,
            focusedBorder: inputDecoration.focusedBorder,
            errorBorder: inputDecoration.errorBorder,
            disabledBorder: inputDecoration.disabledBorder,
            contentPadding: inputDecoration.contentPadding,
          ),
        ),
      ],
    );
  }
}
