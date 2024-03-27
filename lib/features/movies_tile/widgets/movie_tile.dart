import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/util/constants.dart';
import 'package:movie_app_ver2/features/detail/widgets/rating_star_widget.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  const MovieTile({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {
        // Navigating to DetailPage()
        Navigator.pushNamed(context, '/detail', arguments: movie);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            /*
        
               Movie Poster Image
              
              */
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child:
                  // If we did'nt receive posterPath
                  movie.posterPath.isEmpty
                      // Show 404 image
                      ? Image.asset(
                          'assets/404_error.jpg',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        )
                      // Else show the posterPath image
                      : CachedNetworkImage(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          // Loading the image from URL
                          imageUrl: "${Constants.imagePath}${movie.posterPath}",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
            ),
            /*
              
              Movie Details
        
              */
            Column(
              children: [
                Expanded(child: Container()),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(24)),
                    color: Theme.of(context).primaryColor,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      // Release year
                      Text(
                        "(${DateTime.parse(movie.releaseDate).year})",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      // Rating
                      RatingStars(rating: movie.voteAverage / 2),
                      // Description
                      Text(
                        movie.overview,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
