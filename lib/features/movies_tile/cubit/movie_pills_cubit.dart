import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_pills_state.dart';

class MoviePillsCubit extends Cubit<MoviePillsState> {
  MoviePillsCubit() : super(const TopRatedMoviesTab());

  // Getting top rated movies
  getTopRatedMovies() {
    emit(const TopRatedMoviesTab());
  }

  // Getting coming soon movies
  getComingSoonMovies() {
    emit(const ComingSoonMoviesTab());
  }

  // Getting trending movies
  getTrendingMovies() {
    emit(const TrendingMoviesTab());
  }
}
