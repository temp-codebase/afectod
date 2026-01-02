part of 'discover_cubit.dart';

enum DiscoverStatus { initial, loading, success, error }

final class DiscoverState extends Equatable {
  final DiscoverStatus status;
  final MoviesResponseModel? movies;
  final String? errorMessage;
  final int currentPage;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final List<MovieModel> allMovies;

  const DiscoverState({
    this.status = DiscoverStatus.initial,
    this.movies,
    this.errorMessage,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.allMovies = const [],
  });

  DiscoverState copyWith({
    DiscoverStatus? status,
    MoviesResponseModel? movies,
    String? errorMessage,
    int? currentPage,
    bool? hasReachedMax,
    bool? isLoadingMore,
    List<MovieModel>? allMovies,
  }) {
    return DiscoverState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      allMovies: allMovies ?? this.allMovies,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movies,
        errorMessage,
        currentPage,
        hasReachedMax,
        isLoadingMore,
        allMovies,
      ];
}
