import 'package:afectod/app/common/client/client.dart';
import 'package:afectod/app/common/client/network/base/base_network_error_type.dart';
import 'package:afectod/app/common/client/network/base/base_network_type_def.dart';
import 'package:afectod/app/common/client/network/enum/request_method_enum.dart';
import 'package:afectod/app/features/data/datasources/i_home_remote_datasource.dart';
import 'package:afectod/app/features/data/models/movies/movies_response_model.dart';

final class HomeRemoteDatasourceImpl extends IHomeRemoteDatasource {
  @override
  ResultDecode<MoviesResponseModel, BaseNetworkErrorType> discoverMovies({
    required int page,
  }) async {
    final client = AfectodNetworkClient.client();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: "/3/discover/movie?page=$page")
        .execute<MoviesResponseModel, MoviesResponseModel>(
          MoviesResponseModel(),
        );
    return response;
  }

  @override
  ResultDecode<MoviesResponseModel, BaseNetworkErrorType> searchMovies({
    required int page,
    required String query,
  }) async {
    final client = AfectodNetworkClient.client();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(
          path: "/3/search/movie?query=$query&include_adult=false&page=$page",
        )
        .execute<MoviesResponseModel, MoviesResponseModel>(
          MoviesResponseModel(),
        );
    return response;
  }
}
