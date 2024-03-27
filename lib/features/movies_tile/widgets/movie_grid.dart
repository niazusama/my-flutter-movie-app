import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_pagination_cubit.dart';
import 'package:movie_app_ver2/features/movies_tile/widgets/movie_tile.dart';
import 'package:movie_app_ver2/features/movies_tile/widgets/my_circular_loading_indicator.dart';

class MoviesGrid extends StatelessWidget {
  final int categoryIndex;
  MoviesGrid({
    super.key,
    required this.categoryIndex,
    // this.data,
  });

  // Scroll controller
  final ScrollController scrollController = ScrollController();
  // Load more movies
  void setupScrollController(
      MoviePaginationCubit moviePaginationUpdatedCubit, int index) {
    scrollController.addListener(() {
      // If current position is at the maximum position
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        moviePaginationUpdatedCubit.loadMovies(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Accessing the moviePaginationUpdatedCubit
    final moviePaginationUpdatedCubit = context.read<MoviePaginationCubit>();
    // * Resetting the state
    moviePaginationUpdatedCubit.resetMovies();
    // * Fetching the movies
    moviePaginationUpdatedCubit.loadMovies(categoryIndex);
    // List of movies to display
    List<Movie> moviesList = [];
    // If Movies are still loading
    bool isLoading = false;
    // When the scroll to bottom
    setupScrollController(moviePaginationUpdatedCubit, categoryIndex);
    // Building the App
    return BlocBuilder<MoviePaginationCubit, MoviePaginationState>(
      builder: (context, state) {
        // When the it is the first page
        if (state is MoviesLoadingState && state.isFirstFetch) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).indicatorColor,
          ));
          // If movies are loading
        } else if (state is MoviesLoadingState) {
          isLoading = true;
        } else if (state is MoviesLoadedState) {
          moviesList = state.moviesList;
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              controller: scrollController,
              itemCount: moviesList.length + (isLoading ? 1 : 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                if (index < moviesList.length) {
                  return MovieTile(
                    movie: moviesList[index],
                  );
                } else {
                  return const MyCircularLoadingIndicator();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
