import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_ver2/data/api/api.dart';

part 'movie_genre_state.dart';

class MovieGenreCubit extends Cubit<MovieGenreState> {
  MovieGenreCubit({required this.genreApi}) : super(MovieGenreInitial());
  // API instance
  final Api genreApi;

  // Get Genres Name
  void getGenresName() {
    // Getting the Genres Ids and Names
    genreApi.getGenreList().then((genreList) {
      // Storing the Genre Maps
      Map<int, String> genresMap = {};
      for (int i = 0; i < genreList.length; i++) {
        int id = genreList[i]['id'];
        String name = genreList[i]['name'];
        genresMap.addAll({id: name});
      }
      emit(MovieGenreListState(genreNames: genresMap));
    });
  }
}
