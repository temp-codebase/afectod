import 'package:hive_ce/hive.dart';

part 'favorite_list_model.g.dart';

@HiveType(typeId: 1)
class FavoriteListModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  List<int> movieIds;
  @HiveField(4)
  final DateTime createdAt;
  @HiveField(5)
  DateTime updatedAt;

  FavoriteListModel({
    required this.id,
    required this.name,
    this.description,
    required this.movieIds,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FavoriteListModel.create({
    required String name,
    String? description,
  }) {
    final now = DateTime.now();
    return FavoriteListModel(
      id: now.millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      movieIds: [],
      createdAt: now,
      updatedAt: now,
    );
  }

  void addMovie(int movieId) {
    if (!movieIds.contains(movieId)) {
      movieIds.add(movieId);
      updatedAt = DateTime.now();
      save();
    }
  }

  void removeMovie(int movieId) {
    movieIds.remove(movieId);
    updatedAt = DateTime.now();
    save();
  }

  bool containsMovie(int movieId) {
    return movieIds.contains(movieId);
  }
}

