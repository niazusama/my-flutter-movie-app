part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {
  final List<bool> isSelected;
  final ThemeData themeData;
  const SettingsState({required this.isSelected, required this.themeData});
}

// Light theme toggle button
class LightThemeToggleButton extends SettingsState {
  LightThemeToggleButton()
      : super(isSelected: [true, false], themeData: CustomThemeData.lightTheme);
}

// Dark theme toggle button
class DarkThemeToggleButton extends SettingsState {
  DarkThemeToggleButton()
      : super(isSelected: [false, true], themeData: CustomThemeData.darkTheme);
}
