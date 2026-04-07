import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EventraButton extends StatefulWidget {
  const EventraButton({
    required this.buttonText,
    this.isWithIcon = false,
    this.icon,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.borderRadius,
    this.isSmallBorderRadius = false,
    this.isOutlined = false,
    this.isLoading = false,
    super.key,
  });

  const EventraButton.outlined({
    required this.buttonText,
    this.isWithIcon = false,
    this.icon,
    this.width,
    this.padding,
    this.onPressed,
    this.height,
    this.isSmallBorderRadius = false,
    this.borderRadius,
    this.isOutlined = true,
    this.isLoading = false,
    super.key,
  });

  const EventraButton.smallBorder({
    required this.buttonText,
    this.isWithIcon = false,
    this.icon,
    this.width,
    this.padding,
    this.onPressed,
    this.height,
    this.isSmallBorderRadius = true,
    this.borderRadius,
    this.isOutlined = false,
    this.isLoading = false,
    super.key,
  });

  const EventraButton.withIcon({
    required this.buttonText,
    required this.icon,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.borderRadius,
    this.isSmallBorderRadius = false,
    this.isWithIcon = true,
    this.isOutlined = false,
    this.isLoading = false,
    super.key,
  });

  final String buttonText;
  final double? width;
  final double? height;
  final bool isOutlined;
  final bool isWithIcon;
  final bool isLoading;
  final EdgeInsets? padding;
  final bool isSmallBorderRadius;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final String? icon;

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
        height: widget.height ?? 53,
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

    if (widget.isSmallBorderRadius) {
      return SizedBox(
        width: widget.width ?? MediaQuery.sizeOf(context).width,
        height: widget.height ?? 40,
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
            padding:
                widget.padding ?? const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            ),
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
          padding:
              widget.padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.isSmallBorderRadius
                  ? (widget.borderRadius ?? 8)
                  : (widget.borderRadius ?? 24),
            ),
          ),
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
