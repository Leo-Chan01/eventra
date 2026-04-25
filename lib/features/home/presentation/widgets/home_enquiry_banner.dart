import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeEnquiryBanner extends StatelessWidget {
  const HomeEnquiryBanner({
    required this.message,
    this.isDottedBorder = false,
    super.key,
  });

  final String message;
  final bool isDottedBorder;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isDottedBorder) {
      return EventraDottedBorder(
        color: colorScheme.primary,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                EventraVectors.infoIconOrange,
                height: 20,
                width: 20,
              ),
              12.horizSpacing,
              Expanded(
                child: Text(
                  message,
                  style: 16.w500.copyWith(
                    color: colorScheme.primary,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            EventraVectors.infoIconOrange,
            height: 20,
            width: 20,
          ),
          12.horizSpacing,
          Expanded(
            child: Text(
              message,
              style: 16.w500.copyWith(
                color: colorScheme.primary,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
