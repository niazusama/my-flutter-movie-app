part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

// Following are the events can take place in the app

// Bottom navigation bar tab change
class HomeBottomNavBarTabChangeEvent extends HomeEvent {
  final int tabIndex;

  HomeBottomNavBarTabChangeEvent({required this.tabIndex});
}
