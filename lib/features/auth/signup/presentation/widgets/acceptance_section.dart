import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AcceptanceSection extends StatelessWidget {
  const AcceptanceSection({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF3FAFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7CB9FF).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            l10n.acceptanceTitle,
            style: 16.bold.copyWith(color: const Color(0xFF0078FF)),
          ),
          12.vertSpacing,
          Text(
            l10n.acceptanceContent,
            textAlign: TextAlign.center,
            style: 14.w400.copyWith(
              color: const Color(0xFF0078FF),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
