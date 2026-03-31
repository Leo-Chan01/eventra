import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EventraButton extends StatefulWidget {
  const EventraButton({
    required this.buttonText,
    this.width,
    this.onPressed,
    this.isOutlined = false,
    this.isLoading = false,
    super.key,
  });

  const EventraButton.outlined({
    required this.buttonText,
    this.width,
    this.onPressed,
    this.isOutlined = true,
    this.isLoading = false,
    super.key,
  });

  final String buttonText;
  final double? width;
  final bool isOutlined;
  final bool isLoading;
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
          child: widget.isLoading
              ? SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    ),
                  ),
                )
              : Text(
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
        onPressed: widget.isLoading ? null : widget.onPressed,
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
        child: widget.isLoading
            ? const SizedBox(
                height: 14,
                width: 14,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              )
            : Text(
                widget.buttonText,
                style: 14.w400,
              ),
      ),
    );
  }
}
