import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionAmountText extends StatelessWidget {
  const TransactionAmountText({
    required this.amountLabel,
    this.style,
    this.nairaSize,
    super.key,
  });

  final String amountLabel;
  final TextStyle? style;
  final double? nairaSize;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;
    final amountColor =
        effectiveStyle.color ?? Theme.of(context).colorScheme.onSurface;
    final trimmedAmount = amountLabel.trim();
    final prefix = trimmedAmount.startsWith('+')
        ? '+'
        : trimmedAmount.startsWith('-')
        ? '-'
        : '';
    final numericAmount = trimmedAmount
        .replaceFirst(RegExp('^[+-]'), '')
        .replaceAll('₦', '')
        .trim();

    return RichText(
      text: TextSpan(
        style: effectiveStyle,
        children: [
          if (prefix.isNotEmpty) TextSpan(text: prefix),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: SvgPicture.asset(
                EventraVectors.nairaSymbol,
                width: nairaSize ?? ((effectiveStyle.fontSize ?? 14) * 0.7),
                height: nairaSize ?? ((effectiveStyle.fontSize ?? 14) * 0.7),
                colorFilter: ColorFilter.mode(amountColor, BlendMode.srcIn),
              ),
            ),
          ),
          TextSpan(text: numericAmount),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
