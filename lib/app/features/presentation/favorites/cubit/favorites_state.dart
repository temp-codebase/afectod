import 'package:afectod/app/features/data/models/favorites/favorite_list_model.dart';
import 'package:afectod/app/features/data/models/favorites/favorite_movie_model.dart';
import 'package:equatable/equatable.dart';

enum FavoritesStatus { initial, loading, loaded, error }

class FavoritesState extends Equatable {
  final FavoritesStatus status;
  final List<FavoriteListModel> lists;
  final List<FavoriteMovieModel> movies;
  final FavoriteListModel? selectedList;
  final List<FavoriteMovieModel> selectedListMovies;
  final String? errorMessage;

  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.lists = const [],
    this.movies = const [],
    this.selectedList,
    this.selectedListMovies = const [],
    this.errorMessage,
  });

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<FavoriteListModel>? lists,
    List<FavoriteMovieModel>? movies,
    FavoriteListModel? selectedList,
    List<FavoriteMovieModel>? selectedListMovies,
    String? errorMessage,
    bool clearSelectedList = false,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      lists: lists ?? this.lists,
      movies: movies ?? this.movies,
      selectedList: clearSelectedList ? null : (selectedList ?? this.selectedList),
      selectedListMovies: selectedListMovies ?? this.selectedListMovies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, lists, movies, selectedList, selectedListMovies, errorMessage];
}

