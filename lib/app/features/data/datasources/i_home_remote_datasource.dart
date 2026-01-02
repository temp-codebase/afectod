import 'package:afectod/app/common/client/network/base/base_network_error_type.dart';
import 'package:afectod/app/common/client/network/base/base_network_type_def.dart';
import 'package:afectod/app/features/data/models/movies/movies_response_model.dart';

abstract class IHomeRemoteDatasource {
  ResultDecode<MoviesResponseModel, BaseNetworkErrorType> discoverMovies({
    required int page,
  });
  ResultDecode<MoviesResponseModel, BaseNetworkErrorType> searchMovies({
    required int page,
    required String query,
  });
}
