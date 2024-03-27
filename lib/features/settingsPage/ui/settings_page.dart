import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/features/settingsPage/cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Toggle button for theme
                Text(
                  "Select theme",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ToggleButtons(
                    onPressed: (index) {
                      if (index == 0) {
                        context.read<SettingsCubit>().toggleLightTheme();
                      } else {
                        context.read<SettingsCubit>().toggleDarkTheme();
                      }
                    },
                    selectedColor: Theme.of(context).focusColor,
                    disabledColor: Theme.of(context).disabledColor,
                    isSelected: state.isSelected,
                    children: const [
                      // Light mode icon
                      Icon(Icons.light_mode),
                      // Dark mode icon
                      Icon(Icons.dark_mode)
                    ]),
              ],
            ),
          );
        },
      ),
    );
  }
}
