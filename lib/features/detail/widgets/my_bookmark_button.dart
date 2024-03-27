import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/features/detail/cubit/detail_cubit.dart';

class MyBookmarkButton extends StatelessWidget {
  const MyBookmarkButton({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // Accessing the Detail Page Cubit
    DetailPageCubit detailPageCubit = context.read<DetailPageCubit>();
    // Checking whether movie is bookmarked
    bool isBookmarked = detailPageCubit.isMovieBookmarked(movie: movie);
    return BlocConsumer<DetailPageCubit, DetailPageState>(
      bloc: detailPageCubit,
      listener: (context, state) {
        if (state is BookmarkButtonClickedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Bookmark ${state.isBookmarked ? "Added" : "Removed"}!'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is BookmarkButtonClickedState) {
          isBookmarked = state.isBookmarked;
        }
        return IconButton(
          icon: Icon(
            // If bookmarked
            isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
          ),
          // * Add or remove the movie from hive
          onPressed: () => detailPageCubit.toggleBookmarkButton(movie: movie),
        );
      },
    );
  }
}
