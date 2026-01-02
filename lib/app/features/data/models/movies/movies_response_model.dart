import 'package:afectod/app/common/client/network/base/base_response_model.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_response_model.freezed.dart';
part 'movies_response_model.g.dart';

@freezed
class MoviesResponseModel extends BaseResponseModel with _$MoviesResponseModel {
  factory MoviesResponseModel({
    int? page,
    List<MovieModel>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MoviesResponseModel;

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseModelFromJson(json);

  MoviesResponseModel._();

  @override
  MoviesResponseModel fromJson(Map<String, dynamic> json) =>
      MoviesResponseModel.fromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
