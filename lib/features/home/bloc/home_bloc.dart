import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Setting the tabIndex to 1
  HomeBloc() : super(const HomeInitial(tabIndex: 1)) {
    // Bottom Navigation bar tab change event
    on<HomeBottomNavBarTabChangeEvent>(homeBottomNavBarTabChangeEvent);
  }

  // Bottom Navigation bar tab change event
  FutureOr<void> homeBottomNavBarTabChangeEvent(
      HomeBottomNavBarTabChangeEvent event, Emitter<HomeState> emit) {
    emit(HomeInitial(tabIndex: event.tabIndex));
  }
}
