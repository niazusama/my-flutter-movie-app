import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/features/detail/cubit/detail_cubit.dart';
import 'package:movie_app_ver2/features/detail/widgets/single_bar_pill_widget.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_genre_cubit.dart';

class MyGenreBarPills extends StatelessWidget {
  final List<int> genreIds;
  const MyGenreBarPills({super.key, required this.genreIds});

  @override
  Widget build(BuildContext context) {
    // Accessing the MovieGenreCubit State
    final MovieGenreState movieGenreState =
        context.read<MovieGenreCubit>().state;
    // Accessing the DetailPageCubit
    final DetailPageCubit detailPageCubit = context.read<DetailPageCubit>();
    // Genre names
    List<String> genreNames = [];
    // Accessing the names using Ids
    if (movieGenreState is MovieGenreListState) {
      genreNames = detailPageCubit.getGenreNameList(
          genreIds, movieGenreState.genreNames);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // Total Number of buttons
          itemCount: genreNames.length,
          itemBuilder: (context, index) {
            return SingleBarPill(buttonName: genreNames[index]);
          },
        ),
      ),
    );
  }
}
