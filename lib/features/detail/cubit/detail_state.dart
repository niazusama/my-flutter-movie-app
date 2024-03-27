part of 'detail_cubit.dart';

@immutable
sealed class DetailPageState {}

final class DetailInitial extends DetailPageState {}

// If movie is bookmarked
class BookmarkedMovieIsExist extends DetailPageState {}

// Toggle button
class BookmarkButtonClickedState extends DetailPageState {
  final bool isBookmarked;

  BookmarkButtonClickedState({required this.isBookmarked});
}
