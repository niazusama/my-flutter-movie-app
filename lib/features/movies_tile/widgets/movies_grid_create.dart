import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_genre_cubit.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_pills_cubit.dart';
import 'package:movie_app_ver2/features/movies_tile/widgets/movie_grid.dart';

class MoviesGridCreate extends StatelessWidget {
  const MoviesGridCreate({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing MovieGenreCubit
    MovieGenreCubit movieGenreCubit = context.read<MovieGenreCubit>();
    // Fetching and parsing the names of genres
    movieGenreCubit.getGenresName();
    // Map of genres
    return BlocBuilder<MovieGenreCubit, MovieGenreState>(
      builder: (context, state) {
        return BlocBuilder<MoviePillsCubit, MoviePillsState>(
          builder: (context, state) {
            return MoviesGrid(categoryIndex: state.index);
          },
        );
      },
    );
  }
}
