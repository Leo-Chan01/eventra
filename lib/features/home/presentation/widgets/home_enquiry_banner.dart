import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeEnquiryBanner extends StatelessWidget {
  const HomeEnquiryBanner({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            EventraVectors.infoIconOrange,
            height: 36,
            width: 36,
          ),
          14.horizSpacing,
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