import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/features/detail/cubit/detail_cubit.dart';
import 'package:movie_app_ver2/features/detail/widgets/my_bookmark_button.dart';
import 'package:movie_app_ver2/util/constants.dart';
import 'package:movie_app_ver2/features/detail/widgets/my_genre_bar_pill_widget.dart';
import 'package:movie_app_ver2/features/detail/widgets/rating_star_widget.dart';

// * Opening the DetailCubit
final DetailPageCubit detailCubit = DetailPageCubit();

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(children: [
                // If we did'nt receive backdropPath
                movie.backdropPath.isEmpty
                    // Show 404 image
                    ? Image.asset(
                        'assets/404_error.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      )
                    // Else show the backropPath image
                    : CachedNetworkImage(
                        imageUrl: "${Constants.imagePath}${movie.backdropPath}",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back and bookmark button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Add back button
                          const BackButton(),

                          // Add bookmark button
                          MyBookmarkButton(movie: movie)
                        ],
                      ),
                      // Add overview
                      Text("Overview",
                          style: Theme.of(context).textTheme.displayMedium)
                    ],
                  ),
                )
              ]),
            ),

            // Add the title and date
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 16.0),
              child: RichText(
                text: TextSpan(children: [
                  // Adding the title
                  TextSpan(
                      text: movie.title,
                      style: Theme.of(context).textTheme.headlineLarge),
                  // Adding the date
                  TextSpan(
                      text: " (${DateTime.parse(movie.releaseDate).year})",
                      style: Theme.of(context).textTheme.headlineLarge),
                ]),
              ),
            ),

            // Add the Rating bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: RatingStars(rating: movie.voteAverage / 2),
            ),

            // Add genres
            MyGenreBarPills(
              genreIds: movie.genreIds,
            ),

            // Add the description

            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Storyline",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            // Add the description text
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 16.0, bottom: 16.0),
                    child: Text(movie.overview,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
