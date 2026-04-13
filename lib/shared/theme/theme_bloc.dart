import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, dark, system }

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeInitialized extends ThemeEvent {
  const ThemeInitialized();
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.themeMode);
  final AppThemeMode themeMode;
}

typedef SharedPreferencesProvider = Future<SharedPreferences> Function();

/// [ThemeBloc] to manage the application's selected theme mode.
class ThemeBloc extends Bloc<ThemeEvent, AppThemeMode> {
  ThemeBloc({
    SharedPreferencesProvider preferencesProvider =
        SharedPreferences.getInstance,
  }) : _preferencesProvider = preferencesProvider,
       super(AppThemeMode.system) {
    on<ThemeInitialized>(_onInitialized);
    on<ThemeChanged>(_onThemeChanged);

    add(const ThemeInitialized());
  }

  static const String _themeModeKey = 'theme_mode';

  final SharedPreferencesProvider _preferencesProvider;

  Future<void> _onInitialized(
    ThemeInitialized event,
    Emitter<AppThemeMode> emit,
  ) async {
    final preferences = await _preferencesProvider();
    final savedThemeMode = preferences.getString(_themeModeKey);

    emit(_fromStorageValue(savedThemeMode));
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<AppThemeMode> emit,
  ) async {
    emit(event.themeMode);

    final preferences = await _preferencesProvider();
    await preferences.setString(
      _themeModeKey,
      _toStorageValue(event.themeMode),
    );
  }

  AppThemeMode _fromStorageValue(String? value) {
    switch (value) {
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      default:
        return AppThemeMode.system;
    }
  }

  String _toStorageValue(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'light';
      case AppThemeMode.dark:
        return 'dark';
      case AppThemeMode.system:
        return 'system';
    }
  }
}
