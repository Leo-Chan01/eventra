import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/models/vendor_edit_profile_page_args.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_edit_profile_body.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class VendorEditProfilePage extends StatelessWidget {
  const VendorEditProfilePage({
    required this.args,
    super.key,
  });

  static const String path = '/vendor-edit-profile';
  static const String name = 'vendor-edit-profile';

  final VendorEditProfilePageArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.vendorEditProfileTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: VendorEditProfileBody(vendor: args.vendor),
    );
  }
}
