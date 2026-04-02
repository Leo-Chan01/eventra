import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/acceptance_section.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/contact_box.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/important_notice.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/last_updated_banner.dart'
    show LastUpdatedBanner;
import 'package:eventra/features/auth/signup/presentation/widgets/section_widget.dart';
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
              LastUpdatedBanner(l10n: l10n),
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
              Section(
                title: l10n.termsDefinitionsTitle,
                content: l10n.termsDefinitionsContent,
              ),
              32.vertSpacing,
              Section(
                title: l10n.termsRoleTitle,
                content: l10n.termsRoleContent,
                widgetChild: ImportantNotice(l10n: l10n),
              ),
              32.vertSpacing,
              Section(
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
              Section(
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
              Section(
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
              Section(
                title: l10n.termsBookingTitle,
                content: l10n.termsBookingContent,
              ),
              32.vertSpacing,
              Section(
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
              ContactBox(l10n: l10n),
              42.vertSpacing,
              AcceptanceSection(l10n: l10n),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
