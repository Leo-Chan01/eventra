import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventraSocialButton extends StatefulWidget {
  const EventraSocialButton({
    required this.buttonText,
    required this.vectorAsset,
    this.width,
    this.onPressed,
    super.key,
  });

  final String buttonText;
  final String vectorAsset;
  final double? width;
  final VoidCallback? onPressed;

  @override
  State<EventraSocialButton> createState() => _EventraSocialButtonState();
}

class _EventraSocialButtonState extends State<EventraSocialButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: widget.width ?? MediaQuery.sizeOf(context).width,
      height: 60,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.vectorAsset,
              height: 24,
              width: 24,
            ),
            12.horizSpacing,
            Text(
              widget.buttonText,
              style: 16.w500,
            ),
          ],
        ),
      ),
    );
  }
}
