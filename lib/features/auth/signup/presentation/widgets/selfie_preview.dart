import 'dart:io';

import 'package:camera/camera.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class SelfiePreview extends StatelessWidget {
  const SelfiePreview({required this.photo, super.key});

  final XFile? photo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (photo != null) {
      return ClipOval(
        child: Image.file(
          File(photo!.path),
          width: 180,
          height: 220,
          fit: BoxFit.cover,
        ),
      );
    }

    return ClipOval(
      child: SizedBox(
        width: 180,
        height: 220,
        child: ColoredBox(
          color: colorScheme.surfaceContainerHighest,
          child: Image.asset(
            EventraImages.kycDummyImagePreview,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
