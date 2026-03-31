import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  static const String path = '/terms-and-conditions';
  static const String name = 'terms-and-conditions';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          l10n.termsAndConditionsTitle,
          style: 20.bold.copyWith(color: colorScheme.onSurface),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LastUpdatedBanner(l10n: l10n),
              24.vertSpacing,
              Text(
                'Welcome to Eventra. By accessing or using the Eventra mobile '
                'application or website ("Platform"), you agree to be bound by '
                'these Terms and Conditions ("Terms"). If you do not agree, '
                'please do not use the Platform.',
                style: 14.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              32.vertSpacing,
              _Section(
                title: l10n.termsDefinitionsTitle,
                content: l10n.termsDefinitionsContent,
              ),
              32.vertSpacing,
              _Section(
                title: l10n.termsRoleTitle,
                content: l10n.termsRoleContent,
              ),
              16.vertSpacing,
              _ImportantNotice(l10n: l10n),
              32.vertSpacing,
              _Section(
                title: l10n.termsEligibilityTitle,
                content: l10n.termsEligibilityContent,
                items: [
                  l10n.termsEligibilityItem1,
                  l10n.termsEligibilityItem2,
                  l10n.termsEligibilityItem3,
                ],
                itemIcon: Icons.check,
                iconColor: const Color(0xFF39C07A),
              ),
              32.vertSpacing,
              _Section(
                title: l10n.termsVendorTitle,
                content: l10n.termsVendorContent,
                items: [
                  l10n.termsVendorItem1,
                  l10n.termsVendorItem2,
                  l10n.termsVendorItem3,
                ],
                itemIcon: Icons.circle,
                iconSize: 8,
                iconColor: const Color(0xFFFF5F21),
              ),
              32.vertSpacing,
              _Section(
                title: l10n.termsClientTitle,
                content: l10n.termsClientContent,
                items: [
                  l10n.termsClientItem1,
                  l10n.termsClientItem2,
                  l10n.termsClientItem3,
                ],
                itemIcon: Icons.circle,
                iconSize: 8,
                iconColor: const Color(0xFF39C07A),
              ),
              32.vertSpacing,
              _Section(
                title: l10n.termsBookingTitle,
                content: l10n.termsBookingContent,
              ),
              32.vertSpacing,
              _Section(
                title: l10n.termsDisputeTitle,
                items: [
                  l10n.termsDisputeItem1,
                  l10n.termsDisputeItem2,
                ],
                itemIcon: Icons.circle,
                iconSize: 8,
                iconColor: const Color(0xFFFF5F21),
              ),
              42.vertSpacing,
              _ContactBox(l10n: l10n),
              42.vertSpacing,
              _AcceptanceSection(l10n: l10n),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}

class _LastUpdatedBanner extends StatelessWidget {
  const _LastUpdatedBanner({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF5FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF7CB9FF).withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info, size: 16, color: Color(0xFF0078FF)),
              8.horizSpacing,
              Text(
                l10n.lastUpdated,
                style: 12.bold.copyWith(color: const Color(0xFF0078FF)),
              ),
            ],
          ),
          4.vertSpacing,
          Text(
            l10n.lastUpdatedDate,
            style: 14.w500.copyWith(color: const Color(0xFF0078FF)),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    this.content,
    this.items,
    this.itemIcon,
    this.iconSize,
    this.iconColor,
  });

  final String title;
  final String? content;
  final List<String>? items;
  final IconData? itemIcon;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: 16.bold.copyWith(color: colorScheme.onSurface),
        ),
        if (content != null) ...[
          12.vertSpacing,
          Text(
            content!,
            style: 14.regular.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
        if (items != null) ...[
          12.vertSpacing,
          ...items!.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(
                      itemIcon,
                      size: iconSize ?? 16,
                      color: iconColor ?? colorScheme.onSurfaceVariant,
                    ),
                  ),
                  12.horizSpacing,
                  Expanded(
                    child: Text(
                      item,
                      style: 14.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ImportantNotice extends StatelessWidget {
  const _ImportantNotice({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 18,
                color: Color(0xFFFF5F21),
              ),
              8.horizSpacing,
              Text(
                l10n.termsNoticeTitle,
                style: 14.bold.copyWith(color: const Color(0xFFFF5F21)),
              ),
            ],
          ),
          12.vertSpacing,
          _NoticeItem(text: l10n.termsNoticeLine1),
          _NoticeItem(text: l10n.termsNoticeLine2),
          _NoticeItem(text: l10n.termsNoticeLine3),
        ],
      ),
    );
  }
}

class _NoticeItem extends StatelessWidget {
  const _NoticeItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: 14.bold.copyWith(color: const Color(0xFFFF5F21)),
          ),
          8.horizSpacing,
          Expanded(
            child: Text(
              text,
              style: 13.w500.copyWith(
                color: const Color(0xFFFF5F21),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactBox extends StatelessWidget {
  const _ContactBox({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFF5F21),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.mail_outline, color: Colors.white, size: 24),
          12.vertSpacing,
          Text(
            l10n.contactInfoTitle,
            style: 18.bold.copyWith(color: Colors.white),
          ),
          4.vertSpacing,
          Text(
            l10n.contactInfoSubtitle,
            style: 14.regular.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          16.vertSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email_outlined, color: Colors.white, size: 16),
              8.horizSpacing,
              Text(
                l10n.contactEmail,
                style: 14.w500.copyWith(color: Colors.white),
              ),
            ],
          ),
          8.vertSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 16,
              ),
              8.horizSpacing,
              Text(
                l10n.contactEntity,
                style: 14.w500.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AcceptanceSection extends StatelessWidget {
  const _AcceptanceSection({required this.l10n});

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
            style: 14.w500.copyWith(
              color: const Color(0xFF0078FF),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
