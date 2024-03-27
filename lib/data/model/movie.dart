import 'package:hive_flutter/adapters.dart';
// Hive MovieAdapter file
part 'movie.g.dart';

// Creating a Movie Hive datatype
@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final String backdropPath;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String originalTitle;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final String posterPath;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final double voteAverage;
  @HiveField(7)
  final int id;
  @HiveField(8)
  final List<int> genreIds;

  Movie({
    required this.backdropPath,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    required this.genreIds,
  });

  factory Movie.fromMap(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? "",
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? "",
      releaseDate: json['release_date'].toString(),
      voteAverage: json['vote_average'].toDouble(),
      genreIds: List<int>.from(json['genre_ids']),
    );
  }
}
