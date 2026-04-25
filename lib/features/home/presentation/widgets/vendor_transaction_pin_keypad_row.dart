import 'package:flutter/material.dart';

class VendorTransactionPinKeypadRow extends StatelessWidget {
  const VendorTransactionPinKeypadRow({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
