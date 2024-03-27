part of 'home_bloc.dart';

@immutable

// Action state
sealed class HomeState {
  final int tabIndex;

  const HomeState({required this.tabIndex});
}

// Initial Action State
final class HomeInitial extends HomeState {
  const HomeInitial({required super.tabIndex});
}
