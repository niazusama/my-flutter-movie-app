import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/features/bookmark/ui/bookmark_page.dart';
import 'package:movie_app_ver2/features/home/bloc/home_bloc.dart';
import 'package:movie_app_ver2/features/home/widgets/my_bottom_nav_bar.dart';
import 'package:movie_app_ver2/features/home/widgets/side_drawer.dart';
import 'package:movie_app_ver2/features/morePage/ui/more_page.dart';
import 'package:movie_app_ver2/features/movies_tile/ui/movies_page.dart';
// import 'package:movie_app_ver2/features/movies_tile/ui/movies_page.dart';
// import 'package:movie_app_ver2/features/movies_tile/ui/movies_try.dart';

// List of pages
final List<Widget> _pages = <Widget>[
  const MorePage(),
  const MoviesPage(),
  const BookmarkPage()
];

// Global key for opening drawer
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// Bloc initialization
final HomeBloc homeBloc = HomeBloc();

// Homepage widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              key: _scaffoldKey,
              bottomNavigationBar: MyBottomNavigationBar(
                selectedIndex: state.tabIndex,
                onTap: (index) {
                  // If index == 0 open drawer
                  index == 0 && _scaffoldKey.currentState != null
                      ? _scaffoldKey.currentState!.openDrawer()
                      // Else change the tab index
                      : homeBloc
                          .add(HomeBottomNavBarTabChangeEvent(tabIndex: index));
                },
              ),
              body: _pages[state.tabIndex],
              drawer: const SideDrawer()),
        );
      },
    );
  }
}
