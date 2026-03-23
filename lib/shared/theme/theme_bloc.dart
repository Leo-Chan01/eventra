import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.themeMode);
  final ThemeMode themeMode;
}

/// [ThemeBloc] to manage the application's [ThemeMode].
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.system) {
    on<ThemeChanged>((event, emit) => emit(event.themeMode));
  }
}
