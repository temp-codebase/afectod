import 'dart:developer';
import 'dart:io';
import 'package:afectod/app/common/client/result/result.dart';
import 'package:dio/dio.dart';
import '../base/base_network_error_type.dart';
import '../base/base_network_type_def.dart';
import '../base/base_response_model.dart';
import '../enum/request_content_type_enum.dart';
import '../enum/request_method_enum.dart';
import '../layer/network_connectivty.dart';
import '../layer/network_decoding.dart';
import 'network_manager_protocol.dart';

class NetworkManager extends NetworkManagerProtocol {
  final Dio _dio = Dio();
  final String? baseURL;
  final int? sendTimeOut;
  final int? reciveTimeOut;
  final int? connectionTimeOut;
  final String? authToken;
  Map<String, dynamic>? _queryParameter;
  Map<String, dynamic>? _bodyJson;
  Map<String, dynamic>? _header;
  RequestContentTypeEnum? _contentTypeEnum;
  String? _funcionName;
  FormData? _formData;
  RequestMethodEnum? _requestMethodEnum;
  String? _path;
  ResponseType? _responseType;

  NetworkManager({
    required this.authToken,
    required this.baseURL,
    this.reciveTimeOut,
    this.sendTimeOut,
    this.connectionTimeOut,
  });

  @override
  NetworkManagerProtocol setContentType({
    required RequestContentTypeEnum contentTypeEnum,
  }) {
    _contentTypeEnum = contentTypeEnum;
    return this;
  }

  @override
  NetworkManagerProtocol setPath({required String path}) {
    _path = path;
    return this;
  }

  @override
  NetworkManagerProtocol setRequestMethod({
    required RequestMethodEnum requestMethodEnum,
  }) {
    _requestMethodEnum = requestMethodEnum;
    return this;
  }

  @override
  ResultResponse<Response, BaseNetworkErrorType> executeResponse() async {
    final chekcNetwork = await NetworkConnectivty.status;
    if (chekcNetwork) {
      try {
        final headers = _header ?? {};
        if (authToken != null) {
          headers['Authorization'] = 'Bearer $authToken';
        }
        headers['Accept'] = 'application/json';
        final response = await _dio.fetch(
          RequestOptions(
            path: _path ?? '',
            method: _requestMethodEnum?.rawValue,
            baseUrl: baseURL,
            data: _formData ?? _bodyJson,
            contentType: _contentTypeEnum?.rawValue,
            responseType: _responseType,
            headers: headers,
            queryParameters: _queryParameter,
            validateStatus: (statusCode) =>
                statusCode! >= HttpStatus.ok &&
                statusCode <= HttpStatus.multipleChoices,
          ),
        );
        log('BaseURL ${response.realUri}');
        return Result.success(response);
      } on DioException catch (dioError) {
        log('${Result.failure(BaseNetworkErrorType.request(error: dioError))}');
        return Result.failure(BaseNetworkErrorType.request(error: dioError));
      } on TypeError catch (typeError) {
        log(
          '${Result.failure(BaseNetworkErrorType.type(error: typeError.toString()))}',
        );
        return Result.failure(
          BaseNetworkErrorType.type(error: typeError.toString()),
        );
      }
    } else {
      log(
        '${const Result.failure(BaseNetworkErrorType.connectivity(error: 'No Internet Connection'))}',
      );
      return const Result.failure(
        BaseNetworkErrorType.connectivity(error: 'No Internet Connection'),
      );
    }
  }

  @override
  NetworkManagerProtocol setQueryParameters({
    required Map<String, dynamic> queryParameters,
  }) {
    _queryParameter = queryParameters;
    return this;
  }

  @override
  NetworkManagerProtocol setBody({required Map<String, dynamic>? bodyJson}) {
    _bodyJson = bodyJson;
    return this;
  }

  @override
  NetworkManagerProtocol setBodyFormData({FormData? formData}) {
    _formData = formData;
    return this;
  }

  @override
  NetworkManagerProtocol setInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          request.headers['Authorization'] = 'Bearer $authToken';
          request.headers['Accept'] = 'application/json, text/plain, */*';
          request.headers['Content-Type'] = 'application/json';
          handler.next(request);
        },
      ),
    );
    return this;
  }

  @override
  NetworkManagerProtocol setHeaders({required Map<String, dynamic> header}) {
    _header = header;
    return this;
  }

  @override
  NetworkManagerProtocol setFunctionName({required String? functionName}) {
    _funcionName = functionName;
    return this;
  }

  @override
  NetworkManagerProtocol setResponseTYPE({required ResponseType responseType}) {
    _responseType = responseType;
    return this;
  }

  @override
  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseResponseModel, K>(
    T responseModel,
  ) async {
    try {
      final headers = _header ?? {};
      if (authToken != null) {
        headers['Authorization'] = 'Bearer $authToken';
      }
      headers['Accept'] = 'application/json';
      final response = await _dio.fetch(
        RequestOptions(
          path: _path ?? '',
          method: _requestMethodEnum?.rawValue,
          baseUrl: baseURL,
          data: _formData ?? _bodyJson,
          contentType: _contentTypeEnum?.rawValue,
          headers: headers,
          responseType: _responseType ?? ResponseType.json,
          queryParameters: _queryParameter,
          validateStatus: (statusCode) =>
              statusCode! >= HttpStatus.ok &&
              statusCode <= HttpStatus.multipleChoices,
        ),
      );
      log('BaseURL $_funcionName ${response.realUri}');
      final decodeResponse = NetworkDecoding.decode<T, K>(
        response: response,
        responseModel: responseModel,
      );
      return Result.success(decodeResponse);
    } on DioException catch (dioError) {
      log('${Result.failure(BaseNetworkErrorType.request(error: dioError))}');
      return Result.failure(BaseNetworkErrorType.request(error: dioError));
    } on TypeError catch (typeError) {
      log(
        '${Result.failure(BaseNetworkErrorType.type(error: typeError.toString()))}',
      );
      return Result.failure(
        BaseNetworkErrorType.type(error: typeError.toString()),
      );
    }
  }
}
