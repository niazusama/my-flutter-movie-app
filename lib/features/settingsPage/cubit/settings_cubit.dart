import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_ver2/features/global/theme/theme.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  // Initially get the light theme
  SettingsCubit() : super(DarkThemeToggleButton());

  // Get the light theme
  toggleLightTheme() {
    emit(LightThemeToggleButton());
  }

  // Get dark theme
  toggleDarkTheme() {
    emit(DarkThemeToggleButton());
  }
}
