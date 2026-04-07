import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class HomeJoinAsVendorCTA extends StatelessWidget {
  const HomeJoinAsVendorCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return EventraButton(
      buttonText: context.l10n.homeJoinAsVendor,
      onPressed: () {},
    );
  }
}
