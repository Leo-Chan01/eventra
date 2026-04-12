import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_section_title.dart';
import 'package:eventra/features/home/presentation/widgets/profile_expandable_action_tile.dart';
import 'package:eventra/features/home/presentation/widgets/profile_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/profile_support_option_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHelpSupportPage extends StatefulWidget {
  const ProfileHelpSupportPage({super.key});

  static const String path = '/profile-help-support';
  static const String name = 'profile-help-support';

  @override
  State<ProfileHelpSupportPage> createState() => _ProfileHelpSupportPageState();
}

class _ProfileHelpSupportPageState extends State<ProfileHelpSupportPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          icon: SvgPicture.asset(
            EventraVectors.angleRight,
            width: 18,
            height: 18,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          l10n.profileHelpTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSearchBar(
              controller: _searchController,
              hintText: l10n.profileHelpSearchHint,
            ),
            16.vertSpacing,
            Row(
              children: [
                ProfileSupportOptionCard(
                  iconPath: EventraVectors.chatBubbleIcon,
                  label: l10n.profileHelpChatLabel,
                  onTap: () {
                    GlobalSnackBar.showInfo(l10n.profileHelpChatFeedback);
                  },
                ),
                12.horizSpacing,
                ProfileSupportOptionCard(
                  iconPath: EventraVectors.messageMailIcon,
                  label: l10n.profileHelpEmailLabel,
                  onTap: () {
                    GlobalSnackBar.showInfo(l10n.profileHelpEmailFeedback);
                  },
                ),
                12.horizSpacing,
                ProfileSupportOptionCard(
                  iconPath: EventraVectors.callIcon,
                  label: l10n.profileHelpCallLabel,
                  onTap: () {
                    GlobalSnackBar.showInfo(l10n.profileHelpCallFeedback);
                  },
                ),
              ],
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              backgroundColor: colorScheme.primaryContainer.withValues(
                alpha: 0.4,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    EventraVectors.pendingIconOrgange,
                    height: 24,
                    width: 24,
                  ),
                  10.horizSpacing,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.profileHelpSupportHoursTitle,
                        style: 16.w700.copyWith(color: colorScheme.primary),
                      ),
                      10.vertSpacing,
                      Text(
                        l10n.profileHelpSupportHoursWeekdays,
                        style: 14.w500.copyWith(
                          color: colorScheme.primary,
                          height: 1.4,
                        ),
                      ),
                      4.vertSpacing,
                      Text(
                        l10n.profileHelpSupportHoursWeekends,
                        style: 14.w500.copyWith(
                          color: colorScheme.primary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            20.vertSpacing,
            Text(
              l10n.profileHelpFaqTitle,
              style: 18.w700.copyWith(color: colorScheme.onSurface),
            ),
            18.vertSpacing,
            HomeProfileSectionTitle(title: l10n.profileHelpBookingSection),
            10.vertSpacing,
            ProfileSurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpBookingQuestion1,
                    content: l10n.profileHelpBookingAnswer1,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpBookingQuestion2,
                    content: l10n.profileHelpBookingAnswer2,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpBookingQuestion3,
                    content: l10n.profileHelpBookingAnswer3,
                  ),
                ],
              ),
            ),
            18.vertSpacing,
            HomeProfileSectionTitle(title: l10n.profileHelpAccountSection),
            10.vertSpacing,
            ProfileSurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpAccountQuestion1,
                    content: l10n.profileHelpAccountAnswer1,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpAccountQuestion2,
                    content: l10n.profileHelpAccountAnswer2,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpAccountQuestion3,
                    content: l10n.profileHelpAccountAnswer3,
                  ),
                ],
              ),
            ),
            18.vertSpacing,
            HomeProfileSectionTitle(title: l10n.profileHelpPaymentsSection),
            10.vertSpacing,
            ProfileSurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpPaymentsQuestion1,
                    content: l10n.profileHelpPaymentsAnswer1,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpPaymentsQuestion2,
                    content: l10n.profileHelpPaymentsAnswer2,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpPaymentsQuestion3,
                    content: l10n.profileHelpPaymentsAnswer3,
                  ),
                ],
              ),
            ),
            18.vertSpacing,
            HomeProfileSectionTitle(title: l10n.profileHelpVendorsSection),
            10.vertSpacing,
            ProfileSurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpVendorsQuestion1,
                    content: l10n.profileHelpVendorsAnswer1,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpVendorsQuestion2,
                    content: l10n.profileHelpVendorsAnswer2,
                  ),
                  standardDividerUtil(context),
                  ProfileExpandableActionTile(
                    title: l10n.profileHelpVendorsQuestion3,
                    content: l10n.profileHelpVendorsAnswer3,
                  ),
                ],
              ),
            ),
            26.vertSpacing,
            ProfileSurfaceCard(
              backgroundColor: colorScheme.primaryContainer.withValues(
                alpha: 0.2,
              ),
              borderColor: colorScheme.primary.withValues(
                alpha: 0.8,
              ),
              child: Column(
                children: [
                  Text(
                    l10n.profileHelpStillNeedHelpTitle,
                    style: 18.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.profileHelpStillNeedHelpSubtitle,
                    textAlign: TextAlign.center,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                  18.vertSpacing,
                  EventraButton(
                    buttonText: l10n.profileHelpContactSupportButton,
                    width: 176,
                    onPressed: () {
                      GlobalSnackBar.showInfo(
                        l10n.profileHelpContactSupportFeedback,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
