import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ReviewSubmittedPage extends StatelessWidget {
  const ReviewSubmittedPage({super.key});

  static const String path = '/review-submitted';
  static const String name = 'review-submitted';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: 164,
                height: 164,
                child: Center(
                  child: SvgPicture.asset(
                    EventraVectors.goodCheckGreenDottedCircle,
                  ),
                ),
              ),
              44.vertSpacing,
              Text(
                l10n.completedEnquiryThankYouTitle,
                style: 24.w700.copyWith(color: colorScheme.onSurface),
              ),
              14.vertSpacing,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.2,
                ),
                child: Text(
                  l10n.completedEnquiryThankYouMessage,
                  textAlign: TextAlign.center,
                  style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ),
              const Spacer(flex: 3),
              EventraButton(
                buttonText: l10n.completedEnquiryBackHome,
                onPressed: () => context.goNamed(HomePage.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
