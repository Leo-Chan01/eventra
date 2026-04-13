import 'package:eventra/core/utils/boxshadow_util.dart';
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
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
            20.vertSpacing,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: Colors.transparent,
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.johndoesecond,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: Colors.transparent,
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.janeDoe,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: Colors.transparent,
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.johndoethree,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'John Doe Eze',
                    backgroundColor: Colors.transparent,
                    onTap: () => _share(context),
                    child: ClipOval(
                      child: Image.asset(
                        EventraImages.johnDoeFour,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            24.vertSpacing,
            standardDividerUtil(context),
            24.vertSpacing,
            Text(
              l10n.vendorDetailShareTo,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
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
                    child: Image.asset(
                      EventraImages.whatsappLogo,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'Twitter',
                    backgroundColor: const Color(0xFF1D9BF0),
                    onTap: () => _share(context),
                    child: Image.asset(
                      EventraImages.twitterLogo,
                      width: 52,
                      height: 52,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'Instagram',
                    backgroundColor: const Color(0xFFE91E63),
                    onTap: () => _share(context),
                    child: Image.asset(
                      EventraImages.instagramLogo,
                      width: 52,
                      height: 52,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ShareOptionItem(
                    label: 'LinkedIn',
                    backgroundColor: const Color(0xFF0A66C2),
                    onTap: () => _share(context),
                    child: Image.asset(
                      EventraImages.linkedinLogo,
                      width: 52,
                      height: 52,
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
