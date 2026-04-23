import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorBusinessDescriptionField extends StatefulWidget {
  const VendorBusinessDescriptionField({
    required this.label,
    required this.hint,
    required this.onChanged,
    this.initialValue,
    this.maxLength = 200,
    super.key,
  });

  final String label;
  final String hint;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final int maxLength;

  @override
  State<VendorBusinessDescriptionField> createState() =>
      _VendorBusinessDescriptionFieldState();
}

class _VendorBusinessDescriptionFieldState
    extends State<VendorBusinessDescriptionField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = Theme.of(context).inputDecorationTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textLength = _controller.text.characters.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        8.vertSpacing,
        TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          maxLength: widget.maxLength,
          onChanged: (value) {
            setState(() {});
            widget.onChanged(value);
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: inputDecoration.hintStyle,
            border: inputDecoration.border,
            enabledBorder: inputDecoration.enabledBorder,
            focusedBorder: inputDecoration.focusedBorder,
            errorBorder: inputDecoration.errorBorder,
            disabledBorder: inputDecoration.disabledBorder,
            contentPadding: inputDecoration.contentPadding,
            counterText: '$textLength/${widget.maxLength}',
            counterStyle: 12.w400.copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
