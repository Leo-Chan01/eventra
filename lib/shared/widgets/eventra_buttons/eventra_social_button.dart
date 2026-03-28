import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EventraSocialButton extends StatefulWidget {
  const EventraSocialButton({required this.buttonText, this.width, super.key});

  final String buttonText;
  final double? width;

  @override
  State<EventraSocialButton> createState() => _EventraSocialButtonState();
}

class _EventraSocialButtonState extends State<EventraSocialButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: widget.width ?? MediaQuery.sizeOf(context).width,
      height: 53,
      child: ElevatedButton(
        onPressed: () {},
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
          'Button',
          style: 14.w400,
        ),
      ),
    );
  }
}
