import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_selfie_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_hint_item.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_permission_dialog.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class VendorKycFacialVerificationPage extends StatelessWidget {
  const VendorKycFacialVerificationPage({super.key});

  static const String path = '/vendor-kyc-facial-verification';
  static const String name = 'vendor-kyc-facial-verification';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vertSpacing,
              Text(
                l10n.selfieTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              8.vertSpacing,
              Text(
                l10n.selfieSubtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              32.vertSpacing,
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      EventraVectors.selfieIllustration,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelfieHintItem(
                      iconPath: EventraVectors.uncoveredFaceIcon,
                      label: l10n.selfieUncoveredFace,
                    ),
                    SelfieHintItem(
                      iconPath: EventraVectors.goodLighteningIcon,
                      label: l10n.selfieGoodLighting,
                    ),
                  ],
                ),
              ),
              32.vertSpacing,
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: () => _onContinue(context),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onContinue(BuildContext context) async {
    final allowed = await SelfiePermissionDialog.show(context);
    if (allowed != true) return;

    if (!context.mounted) return;

    final status = await Permission.camera.request();
    if (!context.mounted) return;

    // if (status.isGranted) {
    //   await context.pushNamed(VendorKycSelfiePage.name);
    // }

    await context.pushNamed(VendorKycSelfiePage.name);
  }
}
