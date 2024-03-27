import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        half: const Icon(Icons.star_half, color: Colors.amber),
        empty: const Icon(Icons.star_outline, color: Colors.amber),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      ignoreGestures: true,
      onRatingUpdate: (rating) {},
    );
  }
}
