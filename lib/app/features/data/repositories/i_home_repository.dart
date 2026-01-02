import 'package:afectod/app/common/client/network/base/api_error.dart';
import 'package:afectod/app/common/client/network/base/base_network_type_def.dart';
import 'package:afectod/app/features/data/models/movies/movies_response_model.dart';

abstract class IHomeRepository {
  ResultDecode<MoviesResponseModel, APIError> discoverMovies({
    required int page,
  });
  ResultDecode<MoviesResponseModel, APIError> searchMovies({
    required int page,
    required String query,
  });
}
