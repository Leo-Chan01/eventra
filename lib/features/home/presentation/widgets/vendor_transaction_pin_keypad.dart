import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transaction_pin_key.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transaction_pin_keypad_row.dart';
import 'package:flutter/material.dart';

class VendorTransactionPinKeypad extends StatelessWidget {
  const VendorTransactionPinKeypad({
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
        VendorTransactionPinKeypadRow(
          children: [
            VendorTransactionPinKey(
              digit: '1',
              letters: '',
              onTap: () => onDigitPressed('1'),
            ),
            VendorTransactionPinKey(
              digit: '2',
              letters: 'ABC',
              onTap: () => onDigitPressed('2'),
            ),
            VendorTransactionPinKey(
              digit: '3',
              letters: 'DEF',
              onTap: () => onDigitPressed('3'),
            ),
          ],
        ),
        12.vertSpacing,
        VendorTransactionPinKeypadRow(
          children: [
            VendorTransactionPinKey(
              digit: '4',
              letters: 'GHI',
              onTap: () => onDigitPressed('4'),
            ),
            VendorTransactionPinKey(
              digit: '5',
              letters: 'JKL',
              onTap: () => onDigitPressed('5'),
            ),
            VendorTransactionPinKey(
              digit: '6',
              letters: 'MNO',
              onTap: () => onDigitPressed('6'),
            ),
          ],
        ),
        12.vertSpacing,
        VendorTransactionPinKeypadRow(
          children: [
            VendorTransactionPinKey(
              digit: '7',
              letters: 'PQRS',
              onTap: () => onDigitPressed('7'),
            ),
            VendorTransactionPinKey(
              digit: '8',
              letters: 'TUV',
              onTap: () => onDigitPressed('8'),
            ),
            VendorTransactionPinKey(
              digit: '9',
              letters: 'WXYZ',
              onTap: () => onDigitPressed('9'),
            ),
          ],
        ),
        12.vertSpacing,
        VendorTransactionPinKeypadRow(
          children: [
            const SizedBox(width: 118, height: 76),
            VendorTransactionPinKey(
              digit: '0',
              letters: '',
              onTap: () => onDigitPressed('0'),
            ),
            GestureDetector(
              onTap: onBackspacePressed,
              child: SizedBox(
                width: 118,
                height: 76,
                child: Icon(
                  Icons.backspace_outlined,
                  color: colorScheme.onSurface,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
