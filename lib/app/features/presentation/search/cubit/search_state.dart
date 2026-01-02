import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/data/models/search/search_history_model.dart';
import 'package:equatable/equatable.dart';

enum SearchStatus { initial, searching, success, error }
enum SortType { alphabetical, year, rating }
enum SortOrder { ascending, descending }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<MovieModel> results;
  final List<MovieModel> filteredResults;
  final List<SearchHistoryModel> history;
  final String? errorMessage;
  final String query;

  final int? minYear;
  final int? maxYear;
  final double? minRating;
  final double? maxRating;

  final SortType sortType;
  final SortOrder sortOrder;

  const SearchState({
    this.status = SearchStatus.initial,
    this.results = const [],
    this.filteredResults = const [],
    this.history = const [],
    this.errorMessage,
    this.query = '',
    this.minYear,
    this.maxYear,
    this.minRating,
    this.maxRating,
    this.sortType = SortType.rating,
    this.sortOrder = SortOrder.descending,
  });

  SearchState copyWith({
    SearchStatus? status,
    List<MovieModel>? results,
    List<MovieModel>? filteredResults,
    List<SearchHistoryModel>? history,
    String? errorMessage,
    String? query,
    int? minYear,
    int? maxYear,
    double? minRating,
    double? maxRating,
    SortType? sortType,
    SortOrder? sortOrder,
    bool clearFilters = false,
  }) {
    return SearchState(
      status: status ?? this.status,
      results: results ?? this.results,
      filteredResults: filteredResults ?? this.filteredResults,
      history: history ?? this.history,
      errorMessage: errorMessage ?? this.errorMessage,
      query: query ?? this.query,
      minYear: clearFilters ? null : (minYear ?? this.minYear),
      maxYear: clearFilters ? null : (maxYear ?? this.maxYear),
      minRating: clearFilters ? null : (minRating ?? this.minRating),
      maxRating: clearFilters ? null : (maxRating ?? this.maxRating),
      sortType: sortType ?? this.sortType,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  bool get hasFilters =>
      minYear != null ||
      maxYear != null ||
      minRating != null ||
      maxRating != null;

  @override
  List<Object?> get props => [
    status,
    results,
    filteredResults,
    history,
    errorMessage,
    query,
    minYear,
    maxYear,
    minRating,
    maxRating,
    sortType,
    sortOrder,
  ];
}
