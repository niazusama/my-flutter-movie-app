import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_ver2/data/api/api.dart';
import 'package:movie_app_ver2/data/model/movie.dart';

part 'movie_pagination_state.dart';

class MoviePaginationCubit extends Cubit<MoviePaginationState> {
  MoviePaginationCubit({required this.movieApi})
      : super(MoviePaginationUpdatedInitial());

  // Always start with 1st page whenever the app starts
  int page = 1;
  // List of movies to be shown
  List<Movie> movies = [];
  final Api movieApi;

  void resetMovies() {
    page = 1;
    movies = [];
    emit(MoviesLoadedState(moviesList: movies));
  }

  void loadMovies(int index) {
    // To avoid multiple calls when Movies are loading
    if (state is MoviesLoadingState) return;

    final currentState = state;
    // Old movies from the previous state
    if (currentState is MoviesLoadedState) {
      // Storing the movies in the previous state
      movies = currentState.moviesList;
    }

    // Emiting the MoviesLoadingState
    emit(MoviesLoadingState(isFirstFetch: page == 1));
    switch (index) {
      // Top rated movies
      case 0:
        movieApi.getTopRatedMovies(page: page).then((newMovies) {
          // For each load
          page++;
          // Storing new movies in the old movies list
          movies.addAll(newMovies);
          // Emiting old plus new movies in the new state
          emit(MoviesLoadedState(moviesList: movies));
        });
      // Comingsoon movies
      case 1:
        movieApi.getUpComingMovies(page: page).then((newMovies) {
          // For each load
          page++;
          // Storing new movies in the old movies list
          movies.addAll(newMovies);
          // Emiting old plus new movies in the new state
          emit(MoviesLoadedState(moviesList: movies));
        });
      // Trending movies
      case 2:
        movieApi.getTrendingMovies(page: page).then((newMovies) {
          // For each load
          page++;
          // Storing new movies in the old movies list
          movies.addAll(newMovies);
          // Emiting old plus new movies in the new state
          emit(MoviesLoadedState(moviesList: movies));
        });
      default:
        movieApi.getTopRatedMovies(page: page).then((newMovies) {
          // For each load
          page++;
          // Storing new movies in the old movies list
          movies.addAll(newMovies);
          // Emiting old plus new movies in the new state
          emit(MoviesLoadedState(moviesList: movies));
        });
    }
  }
}
