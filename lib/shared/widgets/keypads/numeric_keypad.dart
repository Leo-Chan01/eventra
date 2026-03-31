import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class NumericKeypad extends StatelessWidget {
  const NumericKeypad({
    required this.onDigitPressed,
    required this.onBackspacePressed,
    this.leftActionIcon,
    this.onLeftActionPressed,
    super.key,
  });

  final ValueChanged<String> onDigitPressed;
  final VoidCallback onBackspacePressed;
  final IconData? leftActionIcon;
  final VoidCallback? onLeftActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(['1', '2', '3']),
        24.vertSpacing,
        _buildRow(['4', '5', '6']),
        24.vertSpacing,
        _buildRow(['7', '8', '9']),
        24.vertSpacing,
        _buildLastRow(),
      ],
    );
  }

  Widget _buildRow(List<String> digits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: digits.map(_buildKey).toList(),
    );
  }

  Widget _buildLastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionKey(
          icon: leftActionIcon ?? Icons.face,
          onPressed: onLeftActionPressed ?? () {},
          isHidden: leftActionIcon == null && onLeftActionPressed == null,
        ),
        _buildKey('0'),
        _buildActionKey(
          icon: Icons.backspace_outlined,
          onPressed: onBackspacePressed,
        ),
      ],
    );
  }

  Widget _buildKey(String digit) {
    return _KeyButton(
      child: Text(
        digit,
        style: 24.bold,
      ),
      onPressed: () => onDigitPressed(digit),
    );
  }

  Widget _buildActionKey({
    required IconData icon,
    required VoidCallback onPressed,
    bool isHidden = false,
  }) {
    if (isHidden) {
      return const SizedBox(width: 80, height: 80);
    }
    return _KeyButton(
      onPressed: onPressed,
      child: Icon(icon, size: 28),
    );
  }
}

class _KeyButton extends StatelessWidget {
  const _KeyButton({
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(40),
        child: Center(child: child),
      ),
    );
  }
}
