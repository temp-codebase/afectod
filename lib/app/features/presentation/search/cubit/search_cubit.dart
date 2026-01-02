import 'package:afectod/app/common/client/result/result.dart';
import 'package:afectod/app/common/extensions/l10n_extension.dart';
import 'package:afectod/app/features/data/repositories/i_home_repository.dart';
import 'package:afectod/app/features/data/services/search_history_service.dart';
import 'package:afectod/app/features/presentation/search/cubit/search_state.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final IHomeRepository _homeRepository;
  final SearchHistoryService _searchHistoryService;
  late final TextEditingController searchController;

  SearchCubit(this._homeRepository, this._searchHistoryService)
    : super(const SearchState()) {
  _initialize();
  }

  void _initialize() {
    searchController = TextEditingController();
    init();
  }

  Future<void> init() async {
    await _searchHistoryService.init();
    loadHistory();
  }

  void loadHistory() {
    final history = _searchHistoryService.getHistory();
    emit(state.copyWith(history: history));
  }

  Future<void> searchMovies(String query, BuildContext context) async {
    if (query.trim().isEmpty) {
      emit(
        state.copyWith(
          status: SearchStatus.initial,
          results: [],
          filteredResults: [],
          query: '',
        ),
      );
      return;
    }
    emit(state.copyWith(status: SearchStatus.searching, query: query));
    try {
      await _searchHistoryService.addSearch(query);
      loadHistory();
      final response = await _homeRepository.searchMovies(
        page: 1,
        query: query,
      );
      response.map(
        success: (success) {
          final results = success.data.results ?? [];
          final filtered = _applyFiltersAndSort(results);

          emit(
            state.copyWith(
              status: SearchStatus.success,
              results: results,
              filteredResults: filtered,
            ),
          );
        },
        failure: (failure) {
          emit(
            state.copyWith(
              status: SearchStatus.error,
              errorMessage: context.l10n.searchError,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(status: SearchStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void applyFilters({
    int? minYear,
    int? maxYear,
    double? minRating,
    double? maxRating,
  }) {
    emit(
      state.copyWith(
        minYear: minYear,
        maxYear: maxYear,
        minRating: minRating,
        maxRating: maxRating,
      ),
    );
    final filtered = _applyFiltersAndSort(state.results);
    emit(state.copyWith(filteredResults: filtered));
  }

  void clearFilters() {
    emit(state.copyWith(clearFilters: true));
    final filtered = _applyFiltersAndSort(state.results);
    emit(state.copyWith(filteredResults: filtered));
  }

  void changeSortType(SortType sortType) {
    emit(state.copyWith(sortType: sortType));
    final filtered = _applyFiltersAndSort(state.results);
    emit(state.copyWith(filteredResults: filtered));
  }

  void toggleSortOrder() {
    final newOrder = state.sortOrder == SortOrder.ascending
        ? SortOrder.descending
        : SortOrder.ascending;
    emit(state.copyWith(sortOrder: newOrder));
    final filtered = _applyFiltersAndSort(state.results);
    emit(state.copyWith(filteredResults: filtered));
  }

  List<MovieModel> _applyFiltersAndSort(List<MovieModel> movies) {
    var filtered = movies.where((movie) {
      if (state.minYear != null || state.maxYear != null) {
        final year = _extractYear(movie.releaseDate);
        if (year != null) {
          if (state.minYear != null && year < state.minYear!) return false;
          if (state.maxYear != null && year > state.maxYear!) return false;
        }
      }
      if (state.minRating != null || state.maxRating != null) {
        final rating = movie.voteAverage ?? 0.0;
        if (state.minRating != null && rating < state.minRating!) return false;
        if (state.maxRating != null && rating > state.maxRating!) return false;
      }
      return true;
    }).toList();
    filtered.sort((a, b) {
      int comparison = 0;
      switch (state.sortType) {
        case SortType.alphabetical:
          comparison = (a.title ?? '').compareTo(b.title ?? '');
          break;
        case SortType.year:
          final yearA = _extractYear(a.releaseDate) ?? 0;
          final yearB = _extractYear(b.releaseDate) ?? 0;
          comparison = yearA.compareTo(yearB);
          break;
        case SortType.rating:
          final ratingA = a.voteAverage ?? 0.0;
          final ratingB = b.voteAverage ?? 0.0;
          comparison = ratingA.compareTo(ratingB);
          break;
      }
      return state.sortOrder == SortOrder.ascending ? comparison : -comparison;
    });
    return filtered;
  }

  int? _extractYear(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return int.parse(dateString.split('-')[0]);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSearchHistory(String keyword) async {
    await _searchHistoryService.deleteSearch(keyword);
    loadHistory();
  }

  Future<void> clearSearchHistory() async {
    await _searchHistoryService.clearAll();
    loadHistory();
  }

  void clearSearch() {
    searchController.clear();
    emit(const SearchState());
    loadHistory();
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
