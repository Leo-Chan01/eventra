import 'dart:async';

import 'package:camera/camera.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_confirmation_dialog.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_oval_overlay.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_success_dialog.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycSelfiePage extends StatefulWidget {
  const VendorKycSelfiePage({
    super.key,
    this.cameraControllerFactory,
  });

  static const String path = '/vendor-kyc-selfie';
  static const String name = 'vendor-kyc-selfie';

  final Future<CameraController> Function()? cameraControllerFactory;

  @override
  State<VendorKycSelfiePage> createState() => VendorKycSelfiePageState();
}

class VendorKycSelfiePageState extends State<VendorKycSelfiePage> {
  CameraController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  Timer? _autoCapTimer;

  @override
  void initState() {
    super.initState();
    unawaited(_initCamera());
    _autoCapTimer = Timer(const Duration(seconds: 3), _autoCapture);
  }

  Future<void> _autoCapture() async {
    if (!mounted) return;
    XFile? photo;
    if (_isInitialized && _controller != null) {
      try {
        photo = await _controller!.takePicture();
      } catch (_) {}
    }
    if (!mounted) return;
    await _showConfirmationThenSuccess(photo);
  }

  Future<void> _initCamera() async {
    try {
      if (widget.cameraControllerFactory != null) {
        _controller = await widget.cameraControllerFactory!();
      } else {
        final cameras = await availableCameras();
        if (cameras.isEmpty) {
          if (mounted) setState(() => _hasError = true);
          return;
        }
        final frontCamera = cameras.firstWhere(
          (c) => c.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first,
        );
        _controller = CameraController(
          frontCamera,
          ResolutionPreset.high,
          enableAudio: false,
        );
        await _controller!.initialize();
      }

      if (mounted) setState(() => _isInitialized = true);
    } catch (_) {
      if (mounted) setState(() => _hasError = true);
    }
  }

  Future<void> _onTapCapture() async {
    _autoCapTimer?.cancel();
    XFile? photo;
    if (_isInitialized && _controller != null) {
      try {
        photo = await _controller!.takePicture();
      } catch (_) {}
    }
    if (!mounted) return;
    await _showConfirmationThenSuccess(photo);
  }

  Future<void> _showConfirmationThenSuccess(XFile? photo) async {
    final confirmed = await SelfieConfirmationDialog.show(context, photo);
    if (confirmed != true || !mounted) return;
    await SelfieSuccessDialog.show(context);
    if (!mounted) return;
    context.goNamed(VendorKycPage.name);
  }

  @override
  void dispose() {
    _autoCapTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final scrimColor = colorScheme.scrim;

    return Scaffold(
      backgroundColor: scrimColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_isInitialized && _controller != null)
            CameraPreview(_controller!)
          else if (_hasError)
            Container(color: scrimColor)
          else
            Container(color: scrimColor),
          SelfieOvalOverlay(
            onTap: _onTapCapture,
            moveCloserLabel: l10n.selfieMoveCloser,
            overlayColor: colorScheme.surface.withValues(alpha: 0.7),
            labelColor: colorScheme.onSurface,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: colorScheme.onSurface,
              ),
              onPressed: () => context.pop(),
            ),
          ),
        ],
      ),
    );
  }
}
