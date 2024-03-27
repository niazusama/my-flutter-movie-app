import 'package:flutter/material.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/features/detail/ui/detail_page.dart';
import 'package:movie_app_ver2/features/home/ui/home_page.dart';
import 'package:movie_app_ver2/features/settingsPage/ui/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    // Argument to be passed to route
    final args = settings.arguments;

    switch (settings.name) {
      // For HomePage
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      // For detailPage
      case '/detail':
        if (args is Movie) {
          return MaterialPageRoute(
            builder: (context) => DetailPage(movie: args),
          );
        } else {
          return _errorRoute(
              error:
                  'Wrong argument type for detail page: ${args.runtimeType}.');
        }
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      // Error if no such route exist
      default:
        return _errorRoute(
            error: 'No such route exist. Route Name: ${settings.name}.');
    }
  }

  // Error page
  static Route<dynamic> _errorRoute({required String error}) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error Page'),
          ),
          body: Center(child: Text(error)),
        );
      },
    );
  }
}
