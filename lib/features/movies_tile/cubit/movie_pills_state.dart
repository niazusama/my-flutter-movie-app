part of 'movie_pills_cubit.dart';

@immutable
sealed class MoviePillsState {
  final int index;
  const MoviePillsState({required this.index});
}

// Top rated Movies
class TopRatedMoviesTab extends MoviePillsState {
  const TopRatedMoviesTab({super.index = 0});
}

// Coming soon Movies
class ComingSoonMoviesTab extends MoviePillsState {
  const ComingSoonMoviesTab({super.index = 1});
}

// Trending Movies
class TrendingMoviesTab extends MoviePillsState {
  const TrendingMoviesTab({super.index = 2});
}
