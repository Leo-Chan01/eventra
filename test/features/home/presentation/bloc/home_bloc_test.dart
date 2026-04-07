import 'package:bloc_test/bloc_test.dart';
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
  });
}
