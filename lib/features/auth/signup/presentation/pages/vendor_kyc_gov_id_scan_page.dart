import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_preview_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_gov_id_scan_corner.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycGovIdScanPage extends StatefulWidget {
  const VendorKycGovIdScanPage({super.key});

  static const String path = '/vendor-kyc-government-id-scan';
  static const String name = 'vendor-kyc-government-id-scan';

  @override
  State<VendorKycGovIdScanPage> createState() => VendorKycGovIdScanPageState();
}

class VendorKycGovIdScanPageState extends State<VendorKycGovIdScanPage> {
  bool isNavigating = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface.withValues(alpha: 0.2),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 12,
              left: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.16),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: colorScheme.surface,
                    size: 18,
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
              child: Column(
                children: [
                  Text(
                    l10n.vendorGovIdScanTitle,
                    style: 16.w400.copyWith(color: colorScheme.surface),
                  ),
                  72.vertSpacing,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        EventraImages.idCardDummy,
                        width: 320,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        top: 0,
                        left: 0,
                        child: VendorGovIdScanCorner(isTop: true, isLeft: true),
                      ),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: VendorGovIdScanCorner(
                          isTop: true,
                          isLeft: false,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        child: VendorGovIdScanCorner(
                          isTop: false,
                          isLeft: true,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: VendorGovIdScanCorner(
                          isTop: false,
                          isLeft: false,
                        ),
                      ),
                    ],
                  ),
                  78.vertSpacing,
                  Text(
                    l10n.vendorGovIdScanInstruction,
                    style: 16.w400.copyWith(color: colorScheme.surface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.vendorGovIdScanHint,
                    textAlign: TextAlign.center,
                    style: 14.w400.copyWith(
                      color: colorScheme.surface.withValues(alpha: 0.9),
                      height: 1.4,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _goToPreview,
                        child: Container(
                          width: 96,
                          height: 44,
                          decoration: BoxDecoration(
                            color: colorScheme.scrim.withValues(alpha: 0.55),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            l10n.vendorGovIdScanAction,
                            style: 16.w500.copyWith(color: colorScheme.surface),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _goToPreview,
                        child: Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.surface,
                          ),
                          alignment: Alignment.center,
                          child: Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorScheme.scrim,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _goToPreview,
                        child: SizedBox(
                          width: 96,
                          height: 44,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              l10n.vendorGovIdUploadAction,
                              style: 16.w500.copyWith(
                                color: colorScheme.surface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.vertSpacing,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToPreview() {
    if (isNavigating) {
      return;
    }
    isNavigating = true;
    unawaited(context.pushNamed(VendorKycGovIdPreviewPage.name));
  }
}
