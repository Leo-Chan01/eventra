import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/home/domain/models/home_app_toggle_type.dart';
import 'package:eventra/features/home/domain/models/home_notification_preference.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeBloc', () {
    test('seeds discovery data after construction', () {
      final bloc = HomeBloc();
      addTearDown(bloc.close);

      expect(bloc.state.categories, isNotEmpty);
      expect(bloc.state.vendors, isNotEmpty);
      expect(bloc.state.selectedAddress, isNotEmpty);
    });

    blocTest<HomeBloc, HomeState>(
      'updates current tab when HomeTabChanged is added',
      build: HomeBloc.new,
      act: (bloc) => bloc.add(const HomeTabChanged(2)),
      expect: () => [
        isA<HomeState>().having(
          (state) => state.currentIndex,
          'currentIndex',
          2,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'updates location query and selected address',
      build: HomeBloc.new,
      act: (bloc) => bloc
        ..add(const HomeLocationQueryChanged('Lekki'))
        ..add(const HomeLocationSelected('Lekki Phase 1, Lagos')),
      expect: () => [
        isA<HomeState>()
            .having((state) => state.locationQuery, 'locationQuery', 'Lekki')
            .having(
              (state) => state.locationSuggestions.isNotEmpty,
              'locationSuggestions',
              true,
            ),
        isA<HomeState>().having(
          (state) => state.selectedAddress,
          'selectedAddress',
          'Lekki Phase 1, Lagos',
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'toggles notification preferences',
      build: HomeBloc.new,
      act: (bloc) => bloc.add(
        const HomeNotificationPreferenceToggled(
          type: HomeNotificationPreferenceType.smsNotifications,
          isEnabled: true,
        ),
      ),
      expect: () => [
        isA<HomeState>().having(
          (state) => state.notificationPreferences
              .firstWhere(
                (preference) =>
                    preference.type ==
                    HomeNotificationPreferenceType.smsNotifications,
              )
              .isEnabled,
          'smsNotificationsEnabled',
          true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'toggles client app settings',
      build: HomeBloc.new,
      act: (bloc) => bloc.add(
        const HomeAppToggleChanged(
          type: HomeAppToggleType.offlineMode,
          isEnabled: true,
        ),
      ),
      expect: () => [
        isA<HomeState>().having(
          (state) => state.offlineModeEnabled,
          'offlineModeEnabled',
          true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'removes a vendor from favourites',
      build: HomeBloc.new,
      act: (bloc) => bloc.add(const HomeFavoriteVendorRemoved('favorite-001')),
      expect: () => [
        isA<HomeState>().having(
          (state) => state.favoriteVendors.any(
            (vendor) => vendor.id == 'favorite-001',
          ),
          'favoriteRemoved',
          false,
        ),
      ],
    );
  });
}
