import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_ver2/data/model/movie.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial());

  // Return all movies in database in List
  List<Movie> fetchBookmarks() {
    final Box<Movie> bookmarksBox = Hive.box<Movie>("bookmarks");
    final bookmarkList = bookmarksBox.values.toList();
    // emit(BookmarkLoaded(bookmarkList: bookmarkList));
    return bookmarkList;
  }

  // Removes the movie from database
  void removeBookmark({required Movie movie}) {
    final Box<Movie> bookmarkBox = Hive.box<Movie>("bookmarks");
    bookmarkBox.delete(movie.id);
    emit(BookmarkRemove());
  }
}
