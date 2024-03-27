import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
part 'detail_state.dart';

class DetailPageCubit extends Cubit<DetailPageState> {
  DetailPageCubit() : super(DetailInitial());

  // * Required for initial build
  bool isMovieBookmarked({required Movie movie}) {
    // Opening the bookmarks box
    final Box<Movie> bookmarksBox = Hive.box<Movie>("bookmarks");
    emit(BookmarkedMovieIsExist());
    return bookmarksBox.containsKey(movie.id);
  }

  // Add or remove the movie
  void toggleBookmarkButton({required Movie movie}) async {
    // Opening the bookmarks box
    final Box<Movie> bookmarksBox = Hive.box<Movie>("bookmarks");

    // Check either the movie exist
    bool isBookmarked = bookmarksBox.containsKey(movie.id);

    // Delete if exist and add if not
    if (isBookmarked) {
      bookmarksBox.delete(movie.id);
    } else {
      bookmarksBox.put(movie.id, movie);
    }
    isBookmarked = !isBookmarked;

    // Emit the state
    emit(BookmarkButtonClickedState(isBookmarked: isBookmarked));
  }

  // Extracting the names from genresMap against genreIds
  List<String> getGenreNameList(
      List<int> genreIds, Map<int, String> genresMap) {
    // Finding the respective names
    List<String> genreNames = [];
    for (int i = 0; i < genreIds.length; i++) {
      int id = genreIds[i];
      genreNames.add(genresMap[id].toString());
    }
    return genreNames;
  }
}
