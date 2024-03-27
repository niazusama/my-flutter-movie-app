import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final void Function(int)? onTap;
  final int selectedIndex;
  const MyBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 40.0,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        // Menu Bar
        BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
            ),
            label: "More",
            activeIcon: Icon(
              Icons.more_vert,
            )),

        // Movies Page
        BottomNavigationBarItem(
            icon: Icon(
              Icons.videocam_outlined,
            ),
            label: "Movies",
            activeIcon: Icon(
              Icons.videocam,
            )),

        // Bookmarked
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
            activeIcon: Icon(Icons.bookmark))
      ],
    );
  }
}
