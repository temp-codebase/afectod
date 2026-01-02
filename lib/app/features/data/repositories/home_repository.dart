import 'package:afectod/app/common/client/network/base/api_error.dart';
import 'package:afectod/app/common/client/network/base/base_network_type_def.dart';
import 'package:afectod/app/common/client/result/result.dart';
import 'package:afectod/app/features/data/datasources/i_home_remote_datasource.dart';
import 'package:afectod/app/features/data/models/movies/movies_response_model.dart';
import 'package:afectod/app/features/data/repositories/i_home_repository.dart';

class HomeRepositoryImpl extends IHomeRepository {
  final IHomeRemoteDatasource _remoteDatasource;
  HomeRepositoryImpl({required IHomeRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  @override
  ResultDecode<MoviesResponseModel, APIError> discoverMovies({
    required int page,
  }) async {
    final response = await _remoteDatasource.discoverMovies(page: page);
    return response.when(
      success: (data) => Result.success(data),
      failure: (error) => Result.failure(error.handleApiError),
    );
  }

  @override
  ResultDecode<MoviesResponseModel, APIError> searchMovies({
    required int page,
    required String query,
  }) async {
    final response = await _remoteDatasource.searchMovies(
      page: page,
      query: query,
    );
    return response.when(
      success: (data) => Result.success(data),
      failure: (error) => Result.failure(error.handleApiError),
    );
  }
}
