part of 'bookmark_cubit.dart';

@immutable
sealed class BookmarkState {}

final class BookmarkInitial extends BookmarkState {}

// When movie is unbookmarked
class BookmarkRemove extends BookmarkState {}
