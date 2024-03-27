part of 'movie_pagination_cubit.dart';

@immutable
sealed class MoviePaginationState {}

final class MoviePaginationUpdatedInitial extends MoviePaginationState {}

// While movies is in loading state
class MoviesLoadingState extends MoviePaginationState {
  final bool isFirstFetch;

  MoviesLoadingState({required this.isFirstFetch});
}

// When movies is loaded state
class MoviesLoadedState extends MoviePaginationState {
  final List<Movie> moviesList;

  MoviesLoadedState({required this.moviesList});
}
