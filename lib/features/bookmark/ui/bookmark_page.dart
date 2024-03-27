import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/features/bookmark/cubit/bookmark_cubit.dart';
import 'package:movie_app_ver2/features/bookmark/widgets/bookmark_tile.dart';
import 'package:movie_app_ver2/features/detail/cubit/detail_cubit.dart';

final BookmarkCubit bookmarkCubit = BookmarkCubit();

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailPageCubit, DetailPageState>(
      bloc: context.read<DetailPageCubit>(),
      buildWhen: (previous, current) => current is BookmarkButtonClickedState,
      builder: (context, state) {
        return BlocConsumer<BookmarkCubit, BookmarkState>(
          bloc: bookmarkCubit,
          listener: (context, state) {
            // * If movie is removed from bookmark database
            if (state is BookmarkRemove) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bookmark Removed!'),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          builder: (context, state) {
            // List of movies in bookmark database
            final bookmarkList = bookmarkCubit.fetchBookmarks();
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 80,
                  title: Text(
                    "Bookmarked Movies",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookmarkList.length,
                    itemBuilder: (context, index) {
                      return BookmarkTile(
                        movie: bookmarkList[index],
                        bookmarkCubit: bookmarkCubit,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
