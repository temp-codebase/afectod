import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/data/services/favorites_service.dart';
import 'package:afectod/app/features/presentation/favorites/cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesService _favoritesService;

  FavoritesCubit(this._favoritesService) : super(const FavoritesState());

  Future<void> init(BuildContext context) async {
    emit(state.copyWith(status: FavoritesStatus.loading));
    try {
      final l10n = context.l10n;
      await _favoritesService.init(
        defaultListName: l10n.favoritesAllFavorites,
        defaultListDescription: l10n.favoritesAllFavoritesDescription,
      );
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadData() async {
    try {
      final lists = _favoritesService.getAllLists();
      final movies = _favoritesService.getAllMovies();
      FavoriteListModel? newSelectedList = state.selectedList;
      if (newSelectedList == null ||
          !lists.any((l) => l.id == newSelectedList?.id)) {
        newSelectedList = lists.isNotEmpty ? lists.first : null;
      }
      final selectedListMovies = newSelectedList != null
          ? _favoritesService.getMoviesInList(newSelectedList.id)
          : <FavoriteMovieModel>[];
      emit(
        state.copyWith(
          status: FavoritesStatus.loaded,
          lists: lists,
          movies: movies,
          selectedList: newSelectedList,
          selectedListMovies: selectedListMovies,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> toggleFavorite(MovieModel movie) async {
    try {
      if (isMovieFavorite(movie.id ?? 0)) {
        await removeFavorite(movie.id ?? 0);
      } else {
        await addFavorite(movie);
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> addFavorite(MovieModel movie) async {
    try {
      final favoriteMovie = FavoriteMovieModel.fromMovieModel(
        id: movie.id ?? 0,
        title: movie.title ?? '',
        posterPath: movie.posterPath,
        backdropPath: movie.backdropPath,
        overview: movie.overview,
        voteAverage: movie.voteAverage,
        releaseDate: movie.releaseDate,
        genreIds: movie.genreIds,
        popularity: movie.popularity,
        voteCount: movie.voteCount,
      );
      await _favoritesService.addMovieToFavorites(favoriteMovie);
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> removeFavorite(int movieId) async {
    try {
      await _favoritesService.removeMovieFromFavorites(movieId);
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  bool isMovieFavorite(int movieId) {
    return _favoritesService.isMovieFavorite(movieId);
  }

  List<int> getAllFavoriteIds() {
    return _favoritesService.getAllFavoriteIds();
  }

  Future<void> createList(String name, String? description) async {
    try {
      final list = FavoriteListModel.create(
        name: name,
        description: description,
      );
      await _favoritesService.createList(list);
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteList(String listId) async {
    try {
      await _favoritesService.deleteList(listId);
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateList(FavoriteListModel list) async {
    try {
      await _favoritesService.updateList(list);
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void selectList(FavoriteListModel? list) {
    final selectedListMovies = list != null
        ? _favoritesService.getMoviesInList(list.id)
        : <FavoriteMovieModel>[];

    emit(
      state.copyWith(
        selectedList: list,
        selectedListMovies: selectedListMovies,
      ),
    );
  }

  List<FavoriteMovieModel> getMoviesInSelectedList() {
    return state.selectedListMovies;
  }

  Future<void> addMovieToList(String listId, int movieId) async {
    try {
      await _favoritesService.addMovieToList(listId, movieId);
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> removeMovieFromList(String listId, int movieId) async {
    try {
      if (listId == 'default_list') {
        await _favoritesService.removeMovieFromFavorites(movieId);
      } else {
        await _favoritesService.removeMovieFromList(listId, movieId);
      }
      await loadData();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
