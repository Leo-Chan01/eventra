import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EventraButton extends StatefulWidget {
  const EventraButton({
    required this.buttonText,
    this.width,
    this.onPressed,
    this.isOutlined = false,
    super.key,
  });

  const EventraButton.outlined({
    required this.buttonText,
    this.width,
    this.onPressed,
    this.isOutlined = true,
    super.key,
  });

  final String buttonText;
  final double? width;
  final bool isOutlined;
  final VoidCallback? onPressed;

  @override
  State<EventraButton> createState() => _EventraButtonState();
}

class _EventraButtonState extends State<EventraButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.isOutlined) {
      return SizedBox(
        width: widget.width ?? MediaQuery.sizeOf(context).width,
        height: 53,
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: theme.outlinedButtonTheme.style,
          child: Text(
            widget.buttonText,
            style: 14.w400,
          ),
        ),
      );
    }
    return SizedBox(
      width: widget.width ?? MediaQuery.sizeOf(context).width,
      height: 53,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          disabledBackgroundColor: theme.colorScheme.primary.withValues(
            alpha: 0.5,
          ),
          disabledForegroundColor: theme.colorScheme.onPrimary.withValues(
            alpha: 0.5,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          widget.buttonText,
          style: 14.w400,
        ),
      ),
    );
  }
}
