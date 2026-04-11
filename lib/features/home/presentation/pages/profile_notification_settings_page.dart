import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_notification_preference.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_notification_note_card.dart';
import 'package:eventra/features/home/presentation/widgets/home_notification_preference_tile.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_section_title.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileNotificationSettingsPage extends StatelessWidget {
  const ProfileNotificationSettingsPage({super.key});

  static const String path = '/profile-notification-settings';
  static const String name = 'profile-notification-settings';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final generalPreferences = state.notificationPreferences
            .where(
              (preference) =>
                  preference.section ==
                  HomeNotificationPreferenceSection.general,
            )
            .toList();
        final activityPreferences = state.notificationPreferences
            .where(
              (preference) =>
                  preference.section ==
                  HomeNotificationPreferenceSection.activity,
            )
            .toList();
        final marketingPreferences = state.notificationPreferences
            .where(
              (preference) =>
                  preference.section ==
                  HomeNotificationPreferenceSection.marketing,
            )
            .toList();

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
              l10n.notificationsTitle,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeProfileSectionTitle(title: l10n.homeProfileGeneralLabel),
                12.vertSpacing,
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: boxShadowLight,
                  ),
                  child: Column(
                    children: [
                      ...generalPreferences.asMap().entries.map((entry) {
                        final index = entry.key;
                        final preference = entry.value;
                        return Column(
                          children: [
                            HomeNotificationPreferenceTile(
                              title: _titleFor(l10n, preference.type),
                              subtitle: _subtitleFor(l10n, preference.type),
                              value: preference.isEnabled,
                              onChanged: (value) {
                                context.read<HomeBloc>().add(
                                  HomeNotificationPreferenceToggled(
                                    type: preference.type,
                                    isEnabled: value,
                                  ),
                                );
                              },
                            ),
                            if (index != generalPreferences.length - 1)
                              standardDividerUtil(context),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                28.vertSpacing,
                HomeProfileSectionTitle(title: l10n.homeProfileActivityLabel),
                12.vertSpacing,
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: boxShadowLight,
                  ),
                  child: Column(
                    children: [
                      ...activityPreferences.asMap().entries.map((entry) {
                        final index = entry.key;
                        final preference = entry.value;
                        return Column(
                          children: [
                            HomeNotificationPreferenceTile(
                              title: _titleFor(l10n, preference.type),
                              subtitle: _subtitleFor(l10n, preference.type),
                              value: preference.isEnabled,
                              onChanged: (value) {
                                context.read<HomeBloc>().add(
                                  HomeNotificationPreferenceToggled(
                                    type: preference.type,
                                    isEnabled: value,
                                  ),
                                );
                              },
                            ),
                            if (index != activityPreferences.length - 1)
                              standardDividerUtil(context),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                28.vertSpacing,
                HomeProfileSectionTitle(title: l10n.homeProfileMarketingLabel),
                12.vertSpacing,
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: boxShadowLight,
                  ),
                  child: Column(
                    children: [
                      ...marketingPreferences.asMap().entries.map((entry) {
                        final index = entry.key;
                        final preference = entry.value;
                        return Column(
                          children: [
                            HomeNotificationPreferenceTile(
                              title: _titleFor(l10n, preference.type),
                              subtitle: _subtitleFor(l10n, preference.type),
                              value: preference.isEnabled,
                              onChanged: (value) {
                                context.read<HomeBloc>().add(
                                  HomeNotificationPreferenceToggled(
                                    type: preference.type,
                                    isEnabled: value,
                                  ),
                                );
                              },
                            ),
                            if (index != marketingPreferences.length - 1)
                              standardDividerUtil(context),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                28.vertSpacing,
                HomeNotificationNoteCard(
                  message: l10n.homeProfileNotificationsNote,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _titleFor(
    AppLocalizations l10n,
    HomeNotificationPreferenceType type,
  ) {
    return switch (type) {
      HomeNotificationPreferenceType.pushNotifications =>
        l10n.homeProfilePushNotificationsTitle,
      HomeNotificationPreferenceType.emailNotifications =>
        l10n.homeProfileEmailNotificationsTitle,
      HomeNotificationPreferenceType.smsNotifications =>
        l10n.homeProfileSmsNotificationsTitle,
      HomeNotificationPreferenceType.bookingUpdates =>
        l10n.homeProfileBookingUpdatesTitle,
      HomeNotificationPreferenceType.messages => l10n.homeProfileMessagesTitle,
      HomeNotificationPreferenceType.eventReminders =>
        l10n.homeProfileEventRemindersTitle,
      HomeNotificationPreferenceType.promotionsAndOffers =>
        l10n.homeProfilePromotionsTitle,
      HomeNotificationPreferenceType.newVendors =>
        l10n.homeProfileNewVendorsTitle,
    };
  }

  String _subtitleFor(
    AppLocalizations l10n,
    HomeNotificationPreferenceType type,
  ) {
    return switch (type) {
      HomeNotificationPreferenceType.pushNotifications =>
        l10n.homeProfilePushNotificationsSubtitle,
      HomeNotificationPreferenceType.emailNotifications =>
        l10n.homeProfileEmailNotificationsSubtitle,
      HomeNotificationPreferenceType.smsNotifications =>
        l10n.homeProfileSmsNotificationsSubtitle,
      HomeNotificationPreferenceType.bookingUpdates =>
        l10n.homeProfileBookingUpdatesSubtitle,
      HomeNotificationPreferenceType.messages =>
        l10n.homeProfileMessagesSubtitle,
      HomeNotificationPreferenceType.eventReminders =>
        l10n.homeProfileEventRemindersSubtitle,
      HomeNotificationPreferenceType.promotionsAndOffers =>
        l10n.homeProfilePromotionsSubtitle,
      HomeNotificationPreferenceType.newVendors =>
        l10n.homeProfileNewVendorsSubtitle,
    };
  }
}
