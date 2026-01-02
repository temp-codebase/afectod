import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:hive_ce/hive.dart';

class FavoritesService {
  static const String _moviesBoxName = 'favorite_movies';
  static const String _listsBoxName = 'favorite_lists';
  static const String _defaultListId = 'default_list';

  Box<FavoriteMovieModel>? _moviesBox;
  Box<FavoriteListModel>? _listsBox;

  Future<void> init({
    String defaultListName = 'All Favorites',
    String defaultListDescription = 'All your favorite movies',
  }) async {
    _moviesBox = await Hive.openBox<FavoriteMovieModel>(_moviesBoxName);
    _listsBox = await Hive.openBox<FavoriteListModel>(_listsBoxName);

    if (_listsBox!.get(_defaultListId) == null) {
      final now = DateTime.now();
      final defaultList = FavoriteListModel(
        id: _defaultListId,
        name: defaultListName,
        description: defaultListDescription,
        movieIds: [],
        createdAt: now,
        updatedAt: now,
      );
      await _listsBox!.put(_defaultListId, defaultList);
    } else {
      final existingList = _listsBox!.get(_defaultListId);
      if (existingList != null) {
        final updatedList = FavoriteListModel(
          id: _defaultListId,
          name: defaultListName,
          description: defaultListDescription,
          movieIds: existingList.movieIds,
          createdAt: existingList.createdAt,
          updatedAt: existingList.updatedAt,
        );
        await _listsBox!.put(_defaultListId, updatedList);
      }
    }

    for (var list in _listsBox!.values) {
      if (list.id != _defaultListId &&
          (list.name == 'Tüm Favoriler' ||
              list.name == 'All Favorites' ||
              list.name == defaultListName)) {
        await _listsBox!.delete(list.id);
        final migratedList = FavoriteListModel(
          id: _defaultListId,
          name: defaultListName,
          description: defaultListDescription,
          movieIds: list.movieIds,
          createdAt: list.createdAt,
          updatedAt: DateTime.now(),
        );
        await _listsBox!.put(_defaultListId, migratedList);
        break;
      }
    }
  }

  Future<void> addMovieToFavorites(FavoriteMovieModel movie) async {
    if (_moviesBox == null || _listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    await _moviesBox!.put(movie.id, movie);
    final defaultList = _listsBox!.get(_defaultListId);
    if (defaultList != null && !defaultList.containsMovie(movie.id)) {
      defaultList.movieIds.add(movie.id);
      defaultList.updatedAt = DateTime.now();
      await _listsBox!.put(_defaultListId, defaultList);
    }
  }

  Future<void> removeMovieFromFavorites(int movieId) async {
    if (_moviesBox == null || _listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    await _moviesBox!.delete(movieId);
    for (var list in _listsBox!.values) {
      if (list.containsMovie(movieId)) {
        list.movieIds.remove(movieId);
        list.updatedAt = DateTime.now();
        await _listsBox!.put(list.id, list);
      }
    }
  }

  bool isMovieFavorite(int movieId) {
    if (_moviesBox == null) return false;
    return _moviesBox!.containsKey(movieId);
  }

  FavoriteMovieModel? getMovie(int movieId) {
    if (_moviesBox == null) return null;
    return _moviesBox!.get(movieId);
  }

  List<FavoriteMovieModel> getAllMovies() {
    if (_moviesBox == null) return [];
    return _moviesBox!.values.toList();
  }

  List<int> getAllFavoriteIds() {
    if (_moviesBox == null) return [];
    return _moviesBox!.keys.cast<int>().toList();
  }

  Future<void> createList(FavoriteListModel list) async {
    if (_listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    await _listsBox!.put(list.id, list);
  }

  Future<void> deleteList(String listId) async {
    if (_listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    if (listId == _defaultListId) {
      throw Exception('Varsayılan liste silinemez');
    }
    await _listsBox!.delete(listId);
  }

  Future<void> updateList(FavoriteListModel list) async {
    if (_listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    list.updatedAt = DateTime.now();
    await list.save();
  }

  FavoriteListModel? getList(String listId) {
    if (_listsBox == null) return null;
    return _listsBox!.get(listId);
  }

  List<FavoriteListModel> getAllLists() {
    if (_listsBox == null) return [];
    final allLists = _listsBox!.values.toList();

    allLists.sort((a, b) {
      if (a.id == _defaultListId) return -1;
      if (b.id == _defaultListId) return 1;
      return b.createdAt.compareTo(a.createdAt);
    });

    return allLists;
  }

  List<FavoriteListModel> getListsContainingMovie(int movieId) {
    if (_listsBox == null) return [];
    return _listsBox!.values
        .where((list) => list.containsMovie(movieId))
        .toList();
  }

  Future<void> addMovieToList(String listId, int movieId) async {
    if (_listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    final list = _listsBox!.get(listId);
    if (list != null && !list.containsMovie(movieId)) {
      list.movieIds.add(movieId);
      list.updatedAt = DateTime.now();
      await _listsBox!.put(listId, list);
    }
  }

  Future<void> removeMovieFromList(String listId, int movieId) async {
    if (_listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    final list = _listsBox!.get(listId);
    if (list != null) {
      list.movieIds.remove(movieId);
      list.updatedAt = DateTime.now();
      await _listsBox!.put(listId, list);
    }
  }

  List<FavoriteMovieModel> getMoviesInList(String listId) {
    if (_listsBox == null || _moviesBox == null) return [];
    final list = _listsBox!.get(listId);
    if (list == null) return [];
    final movies = <FavoriteMovieModel>[];
    for (var id in list.movieIds) {
      final movie = _moviesBox!.get(id);
      if (movie != null) {
        movies.add(movie);
      }
    }
    return movies;
  }

  Future<void> clearAll() async {
    if (_moviesBox == null || _listsBox == null) {
      throw Exception('FavoritesService not initialized. Call init() first.');
    }
    await _moviesBox!.clear();
    await _listsBox!.clear();
  }
}
