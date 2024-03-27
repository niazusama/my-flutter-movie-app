import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_ver2/data/api/api.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/features/detail/cubit/detail_cubit.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_genre_cubit.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_pagination_cubit.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_pills_cubit.dart';
import 'package:movie_app_ver2/features/settingsPage/cubit/settings_cubit.dart';
import 'package:movie_app_ver2/routes/route_generator.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();

  // Opening the "MovieAdapter"
  Hive.registerAdapter(MovieAdapter());

  // Open the "bookmark" database box
  await Hive.openBox<Movie>("bookmarks");

  // Running the main app
  runApp(MyApp(api: Api()));
}

class MyApp extends StatelessWidget {
  final Api api;
  const MyApp({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Settings Cubit for theme change
        BlocProvider(create: (context) => SettingsCubit()),
        // MoviePillsCubit for movie category change
        BlocProvider(
          create: (context) => MoviePillsCubit(),
        ),
        //
        BlocProvider(
          create: (context) => MoviePaginationCubit(movieApi: api),
        ),
        BlocProvider(
          create: (context) => MovieGenreCubit(genreApi: api),
        ),
        BlocProvider(
          create: (context) => DetailPageCubit(),
        )
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            // Initial route HomePage()
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.routeGenerator,
          );
        },
      ),
    );
  }
}
