import 'package:equatable/equatable.dart';

enum HomeNotificationPreferenceType {
  pushNotifications,
  emailNotifications,
  smsNotifications,
  bookingUpdates,
  messages,
  eventReminders,
  promotionsAndOffers,
  newVendors,
}

enum HomeNotificationPreferenceSection {
  general,
  activity,
  marketing,
}

class HomeNotificationPreference extends Equatable {
  const HomeNotificationPreference({
    required this.type,
    required this.section,
    required this.isEnabled,
  });

  final HomeNotificationPreferenceType type;
  final HomeNotificationPreferenceSection section;
  final bool isEnabled;

  HomeNotificationPreference copyWith({
    HomeNotificationPreferenceType? type,
    HomeNotificationPreferenceSection? section,
    bool? isEnabled,
  }) {
    return HomeNotificationPreference(
      type: type ?? this.type,
      section: section ?? this.section,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  List<Object?> get props => [type, section, isEnabled];
}
