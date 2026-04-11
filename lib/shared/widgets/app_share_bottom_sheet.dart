import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/share_copy_action_tile.dart';
import 'package:eventra/shared/widgets/share_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class AppShareBottomSheet extends StatelessWidget {
  const AppShareBottomSheet({
    required this.shareText,
    super.key,
  });

  final String shareText;

  static Future<void> show(
    BuildContext context, {
    required String shareText,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => AppShareBottomSheet(shareText: shareText),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          12,
          24,
          MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 82,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            28.vertSpacing,
            Text(
              l10n.vendorDetailShareTitle,
              style: 24.w500.copyWith(color: colorScheme.onSurface),
            ),
            20.vertSpacing,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: const Color(0xFFEFC992),
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.profileDummy,
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: const Color(0xFFD7CCFF),
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.profileDummy,
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: const Color(0xFFBFE6FF),
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.profileDummy,
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: const Color(0xFFF6B8B8),
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.profileDummy,
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            24.vertSpacing,
            Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
            24.vertSpacing,
            Text(
              l10n.vendorDetailShareTo,
              style: 24.w500.copyWith(color: colorScheme.onSurface),
            ),
            20.vertSpacing,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShareOptionItem(
                    label: 'WhatsApp',
                    backgroundColor: const Color(0xFF25D366),
                    onTap: () => _share(context),
                    child: Icon(
                      Icons.call_rounded,
                      color: colorScheme.onPrimary,
                      size: 34,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'Twitter',
                    backgroundColor: const Color(0xFF1D9BF0),
                    onTap: () => _share(context),
                    child: Icon(
                      Icons.flutter_dash_rounded,
                      color: colorScheme.onPrimary,
                      size: 36,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'Instagram',
                    backgroundColor: const Color(0xFFE91E63),
                    onTap: () => _share(context),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: colorScheme.onPrimary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'LinkedIn',
                    backgroundColor: const Color(0xFF0A66C2),
                    onTap: () => _share(context),
                    child: Text(
                      'in',
                      style: 32.w700.copyWith(color: colorScheme.onPrimary),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'Instagram',
                    backgroundColor: const Color(0xFFE91E63),
                    onTap: () => _share(context),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: colorScheme.onPrimary,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            28.vertSpacing,
            ShareCopyActionTile(
              label: l10n.vendorDetailCopyLink,
              onTap: () => _copyLink(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _share(BuildContext context) async {
    Navigator.of(context).pop();
    await SharePlus.instance.share(
      ShareParams(
        text: shareText,
      ),
    );
  }

  Future<void> _copyLink(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: shareText));
    if (context.mounted) {
      Navigator.of(context).pop();
      GlobalSnackBar.showSuccess(context.l10n.vendorDetailLinkCopied);
    }
  }
}
