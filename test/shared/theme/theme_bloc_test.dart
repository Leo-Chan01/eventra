import 'package:eventra/shared/theme/theme_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeBloc', () {
    test('loads persisted dark mode on initialization', () async {
      SharedPreferences.setMockInitialValues(const {'theme_mode': 'dark'});
      final prefs = await SharedPreferences.getInstance();

      final bloc = ThemeBloc(preferencesProvider: () async => prefs);
      addTearDown(bloc.close);

      await expectLater(bloc.stream, emits(AppThemeMode.dark));
      expect(bloc.state, AppThemeMode.dark);
    });

    test('persists selected theme mode on change', () async {
      SharedPreferences.setMockInitialValues(const {'theme_mode': 'system'});
      final prefs = await SharedPreferences.getInstance();

      final bloc = ThemeBloc(preferencesProvider: () async => prefs);
      addTearDown(bloc.close);

      bloc.add(const ThemeChanged(AppThemeMode.light));
      await Future<void>.delayed(Duration.zero);

      expect(prefs.getString('theme_mode'), 'light');
      expect(bloc.state, AppThemeMode.light);
    });
  });
}
