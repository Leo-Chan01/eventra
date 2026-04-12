import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/notice_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImportantNotice extends StatelessWidget {
  const ImportantNotice({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
        border: Border.all(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                EventraVectors.cautionSignOrange,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              8.horizSpacing,
              Text(
                l10n.termsNoticeTitle,
                style: 14.bold.copyWith(color: colorScheme.onSurface),
              ),
            ],
          ),
          12.vertSpacing,
          NoticeItem(text: l10n.termsNoticeLine1),
          NoticeItem(text: l10n.termsNoticeLine2),
          NoticeItem(text: l10n.termsNoticeLine3),
        ],
      ),
    );
  }
}
