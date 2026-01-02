import 'package:hive_ce/hive.dart';

part 'favorite_movie_model.g.dart';

@HiveType(typeId: 0)
class FavoriteMovieModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? posterPath;
  @HiveField(3)
  final String? backdropPath;
  @HiveField(4)
  final String? overview;
  @HiveField(5)
  final double? voteAverage;
  @HiveField(6)
  final String? releaseDate;
  @HiveField(7)
  final List<int>? genreIds;
  @HiveField(8)
  final DateTime addedAt;
  @HiveField(9)
  final double? popularity;
  @HiveField(10)
  final int? voteCount;

  FavoriteMovieModel({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.voteAverage,
    this.releaseDate,
    this.genreIds,
    required this.addedAt,
    this.popularity,
    this.voteCount,
  });

  factory FavoriteMovieModel.fromMovieModel({
    required int id,
    required String title,
    String? posterPath,
    String? backdropPath,
    String? overview,
    double? voteAverage,
    String? releaseDate,
    List<int>? genreIds,
    double? popularity,
    int? voteCount,
  }) {
    return FavoriteMovieModel(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      overview: overview,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
      genreIds: genreIds,
      addedAt: DateTime.now(),
      popularity: popularity,
      voteCount: voteCount,
    );
  }

  Map<String, dynamic> toMovieModelJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      'genre_ids': genreIds,
      'adult': false,
      'original_language': 'en',
      'original_title': title,
      'popularity': popularity ?? 0.0,
      'video': false,
      'vote_count': voteCount ?? 0,
    };
  }
}
