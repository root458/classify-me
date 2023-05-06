import 'dart:io';

import 'package:classifyme/models/errors.dart';
import 'package:classifyme/utils/constants.dart';
import 'package:dio/dio.dart';

class NetworkUtil {
  factory NetworkUtil() => _networkUtil;

  NetworkUtil.internal();

  static final NetworkUtil _networkUtil = NetworkUtil.internal();

  static String _getBearerToken() {
    return '';
  }

  Dio _getHttpClient() {
    final _dio = Dio(
      BaseOptions(
        baseUrl: ClassifyMeConfig.instance!.values.baseDomain,
        contentType: 'application/json',
        headers: <String, dynamic>{'Accept': 'application/json'},
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${_getBearerToken()}';
          return handler.next(options);
        },
      ),
    );
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true);
    // };
    return _dio;
  }

  Future<Map<String, dynamic>> getReq(String url) async {
    try {
      final _response = await _getHttpClient().get<dynamic>(
        url,
      );
      final _responseBody = _response.data as Map<String, dynamic>;
      if (_responseBody.isEmpty) return <String, dynamic>{};
      return _responseBody;
    } on DioError catch (err) {
      if (DioErrorType.response == err.type) {
        if (err.response?.statusCode == 422) {
          final _errors = ClassifyMeValidationError.fromJson(
              err.response?.data as Map<String, dynamic>);
          throw Failure(errors: _errors.errors, message: 'Validation failed');
        }

        if (err.response?.statusCode == 403) {
          final _data = err.response!.data as Map<String, dynamic>;
          throw Failure(
            message: err.response!.statusMessage!,
            errors: [
              ClassifyMeFieldValidationError(
                  'pin', [_data['message'] as String])
            ],
          );
        }

        if (err.response?.statusCode == 401) {
          throw Failure(message: 'Unauthenticated');
        }
      } else if (DioErrorType.connectTimeout == err.type) {
        throw const SocketException('No internet connection');
      }
      throw Failure(message: 'Server error');
    }
  }

  Future<Map<String, dynamic>> postReq(
    String url, {
    required String body,
  }) async {
    try {
      final _response = await _getHttpClient().post<dynamic>(
        url,
        data: body,
      );

      final _responseBody = _response.data as Map<String, dynamic>;
      if (_responseBody.isEmpty) return <String, dynamic>{};
      return _responseBody;
    } on DioError catch (err) {
      if (DioErrorType.response == err.type) {
        if (err.response?.statusCode == 422) {
          final _errors = ClassifyMeValidationError.fromJson(
              err.response?.data as Map<String, dynamic>);
          throw Failure(errors: _errors.errors, message: 'Validation failed');
        }

        if (err.response?.statusCode == 403) {
          final _data = err.response!.data as Map<String, dynamic>;
          throw Failure(
            message: err.response!.statusMessage!,
            errors: [
              ClassifyMeFieldValidationError(
                  'pin', [_data['message'] as String])
            ],
          );
        }

        if (err.response?.statusCode == 401) {
          throw Failure(message: 'Unauthenticated');
        }
      } else if (DioErrorType.connectTimeout == err.type) {
        throw Failure(message: 'No internet connection');
      }
      throw Failure(message: 'Server error');
    }
  }
}
