import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InvoiceReadyPage extends StatelessWidget {
  const InvoiceReadyPage({super.key});

  static const String path = '/invoice-ready';
  static const String name = 'invoice-ready';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                EventraVectors.goodCheckGreenDottedCircle,
                width: 116,
                height: 116,
              ),
              42.vertSpacing,
              Text(
                l10n.invoiceReadyTitle,
                style: 20.w500.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
              12.vertSpacing,
              Text(
                l10n.invoiceReadySubtitle,
                style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: EventraButton(
          buttonText: l10n.sendInvoiceButton,
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
