import 'package:afectod/app/common/client/network/base/api_error.dart';
import 'package:afectod/app/common/client/result/result.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/data/models/movies/movies_response_model.dart';
import 'package:afectod/app/features/data/repositories/i_home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final IHomeRepository _homeRepository;

  DiscoverCubit({required IHomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(const DiscoverState()) {
    discoverMovies();
  }

  void _handleError(String baseErrorMessage, dynamic error) {
    final errorMessage = '$baseErrorMessage${error.toString()}';
    emit(
      state.copyWith(status: DiscoverStatus.error, errorMessage: errorMessage),
    );
  }

  void _handleSuccess({
    MoviesResponseModel? movies,
    bool isPagination = false,
  }) {
    final newMovies = movies?.results ?? [];
    final allMovies = isPagination
        ? [...state.allMovies, ...newMovies]
        : newMovies;

    final hasReachedMax = movies?.page == movies?.totalPages;

    emit(
      state.copyWith(
        status: DiscoverStatus.success,
        movies: movies ?? state.movies,
        errorMessage: null,
        allMovies: allMovies,
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
        currentPage: movies?.page ?? state.currentPage,
      ),
    );
  }

  Future<T?> _executeApiCall<T>(
    Future<Result<T, APIError>> Function() apiCall,
    String errorMessage,
  ) async {
    try {
      final result = await apiCall();
      return result.when(
        success: (data) => data,
        failure: (error) {
          _handleError(errorMessage, error);
          return null;
        },
      );
    } catch (e) {
      _handleError('', e);
      return null;
    }
  }

  Future<void> discoverMovies() async {
    emit(state.copyWith(status: DiscoverStatus.loading));
    final movies = await _executeApiCall(
      () async => await _homeRepository.discoverMovies(page: 1),
      '',
    );
    if (movies != null) {
      _handleSuccess(movies: movies, isPagination: false);
    }
  }

  Future<void> loadMoreMovies() async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    emit(state.copyWith(isLoadingMore: true));
    final nextPage = state.currentPage + 1;
    final movies = await _executeApiCall(
      () async => await _homeRepository.discoverMovies(page: nextPage),
      'Error loading more movies',
    );
    if (movies != null) {
      _handleSuccess(movies: movies, isPagination: true);
    } else {
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  Future<void> loadHomeData() async {
    emit(state.copyWith(status: DiscoverStatus.loading));
    try {
      final results = await Future.wait([
        _homeRepository.discoverMovies(page: 1),
      ]);
      final movies = results[0].when(
        success: (data) => data,
        failure: (error) {
          _handleError('', error);
          return null;
        },
      );
      if (movies != null) {
        _handleSuccess(movies: movies);
      } else {
        emit(state.copyWith(status: DiscoverStatus.error, errorMessage: ''));
      }
    } catch (e) {
      _handleError('', e);
    }
  }

  void resetState() {
    emit(const DiscoverState());
  }
}
