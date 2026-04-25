import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class VendorTransferSuccessPage extends StatelessWidget {
  const VendorTransferSuccessPage({
    required this.amount,
    super.key,
  });

  static const String path = '/vendor-transfer-success';
  static const String name = 'vendor-transfer-success';

  final String amount;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            children: [
              140.vertSpacing,
              Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  EventraVectors.goodCheckGreenDottedCircle,
                ),
              ),
              34.vertSpacing,
              Text(
                l10n.vendorTransferSuccessTitle,
                style: 24.w600.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
              24.vertSpacing,
              Text(
                l10n.vendorTransferSuccessMessage(amount),
                style: 16.w500.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.35,
                ),
                textAlign: TextAlign.center,
              ),
              28.vertSpacing,
              Text(
                l10n.vendorTransferSuccessWaitMessage,
                style: 16.w500.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.35,
                ),
                textAlign: TextAlign.center,
              ),
              38.vertSpacing,
              EventraDottedBorder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.vendorTransferSuccessRef,
                      style: 16.w500.copyWith(color: colorScheme.primary),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.homeButton,
                onPressed: () => context.goNamed(
                  HomePage.name,
                  queryParameters: const {'vendor': 'true'},
                ),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
