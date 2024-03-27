import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/features/bookmark/cubit/bookmark_cubit.dart';
import 'package:movie_app_ver2/features/detail/widgets/rating_star_widget.dart';
import 'package:movie_app_ver2/util/constants.dart';

class BookmarkTile extends StatelessWidget {
  final Movie movie;
  final BookmarkCubit bookmarkCubit;
  const BookmarkTile({
    super.key,
    required this.movie,
    required this.bookmarkCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      // * Center is used to control the width of the container
      child: Center(
        // Bookmark tile
        // * When clicked -> details page
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            width: 320,
            height: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(28)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Movie image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(27),
                      topLeft: Radius.circular(27)),
                  child: SizedBox(
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: "${Constants.imagePath}${movie.posterPath}",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Inserting the Title, rating and bookmark button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Title
                      Flexible(
                        child: SizedBox(
                          width: 150,
                          child: Text(
                            movie.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      // Spacer
                      const SizedBox(
                        height: 5,
                      ),
                      // Rating
                      RatingStars(rating: movie.voteAverage / 2)
                    ],
                  ),
                ),
                // Bookmark button
                IconButton(
                    // * Removes the movie from Hive database
                    onPressed: () => bookmarkCubit.removeBookmark(movie: movie),
                    icon: const Icon(
                      Icons.bookmark,
                    ))
              ],
            ),
          ),
          // * Navigate to details page
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: movie);
          },
        ),
      ),
    );
  }
}
