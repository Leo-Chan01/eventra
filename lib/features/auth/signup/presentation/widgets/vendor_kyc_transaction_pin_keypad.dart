import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_pin_key.dart';
import 'package:flutter/material.dart';

class VendorKycTransactionPinKeypad extends StatelessWidget {
  const VendorKycTransactionPinKeypad({
    required this.onDigitPressed,
    required this.onBackspacePressed,
    super.key,
  });

  final ValueChanged<String> onDigitPressed;
  final VoidCallback onBackspacePressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VendorKycPinKey(
              onTap: () => onDigitPressed('1'),
              child: Text(
                '1',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('2'),
              child: Text(
                '2',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('3'),
              child: Text(
                '3',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
        16.vertSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VendorKycPinKey(
              onTap: () => onDigitPressed('4'),
              child: Text(
                '4',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('5'),
              child: Text(
                '5',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('6'),
              child: Text(
                '6',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
        16.vertSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VendorKycPinKey(
              onTap: () => onDigitPressed('7'),
              child: Text(
                '7',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('8'),
              child: Text(
                '8',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('9'),
              child: Text(
                '9',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
        16.vertSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VendorKycPinKey(
              onTap: () {},
              child: Icon(
                Icons.qr_code_scanner_rounded,
                color: colorScheme.onSurface,
                size: 22,
              ),
            ),
            VendorKycPinKey(
              onTap: () => onDigitPressed('0'),
              child: Text(
                '0',
                style: 32.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            VendorKycPinKey(
              onTap: onBackspacePressed,
              child: Icon(
                Icons.backspace_outlined,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
