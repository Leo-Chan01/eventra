import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/review_submitted_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/review_star_selector.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SendReviewBottomSheet extends StatefulWidget {
  const SendReviewBottomSheet({
    required this.vendorName,
    required this.vendorImage,
    super.key,
  });

  final String vendorName;
  final String vendorImage;

  static Future<void> show(
    BuildContext context, {
    required String vendorName,
    required String vendorImage,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (sheetContext) {
        return SendReviewBottomSheet(
          vendorName: vendorName,
          vendorImage: vendorImage,
        );
      },
    );
  }

  @override
  State<SendReviewBottomSheet> createState() => _SendReviewBottomSheetState();
}

class _SendReviewBottomSheetState extends State<SendReviewBottomSheet> {
  final TextEditingController _reviewController = TextEditingController();
  int _rating = 0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final viewInsets = MediaQuery.viewInsetsOf(context);

    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          12.vertSpacing,
          Container(
            width: 120,
            height: 8,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  l10n.completedEnquiryReviewSheetTitle,
                  style: 22.w500.copyWith(color: colorScheme.onSurface),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close_rounded,
                    size: 36,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          20.vertSpacing,
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.asset(
              widget.vendorImage,
              width: 132,
              height: 132,
              fit: BoxFit.cover,
            ),
          ),
          26.vertSpacing,
          Text(
            widget.vendorName,
            style: 18.w700.copyWith(color: colorScheme.onSurface),
          ),
          30.vertSpacing,
          ReviewStarSelector(
            rating: _rating,
            onRatingChanged: (value) {
              setState(() {
                _rating = value;
              });
            },
          ),
          34.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _reviewController,
              maxLines: 6,
              minLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: l10n.completedEnquiryWriteReviewHint,
                alignLabelWithHint: true,
              ),
            ),
          ),
          22.vertSpacing,
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: EventraButton(
              buttonText: l10n.completedEnquirySendReviewButton,
              onPressed: () => _onSendPressed(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSendPressed(BuildContext context) async {
    final l10n = context.l10n;
    if (_rating == 0 || _reviewController.text.trim().isEmpty) {
      GlobalSnackBar.showInfo(l10n.completedEnquiryReviewValidation);
      return;
    }

    Navigator.of(context).pop();
    await context.pushNamed(ReviewSubmittedPage.name);
  }
}
