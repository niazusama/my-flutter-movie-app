import 'package:flutter/material.dart';
import 'package:movie_app_ver2/util/constants.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        // backgroundColor: Colors.grey.shade900,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountName: const Text("Random person"),
              accountEmail: const Text("movies@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "${Constants.imagePath}/9mrSx9MVmNOOlvcPxDTdf1APzud.jpg"),
              ),
            ),
            ListTile(
              title: Text(
                'Accounts',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: const Icon(Icons.account_box_rounded),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: const Icon(Icons.settings),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            ListTile(
              title: Text(
                'Hot Choices 🔥',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: const Icon(Icons.favorite),
            )
          ],
        ),
      ),
    );
  }
}
