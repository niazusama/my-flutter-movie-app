part of 'movie_genre_cubit.dart';

@immutable
sealed class MovieGenreState {}

final class MovieGenreInitial extends MovieGenreState {}

class MovieGenreListState extends MovieGenreState {
  final Map<int, String> genreNames;

  MovieGenreListState({required this.genreNames});
}
