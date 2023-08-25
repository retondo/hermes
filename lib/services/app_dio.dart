import 'package:dio/dio.dart';
import 'package:hermes/app_config.dart';
import 'package:hermes/services/storage.dart';

class AppDio {
  final Dio _dio = Dio();
  final String _baseUrl = AppConfig.get('API_BASE_URL');

  BaseOptions _setOptions() {
    return BaseOptions(
      baseUrl: this._baseUrl,
      validateStatus: (status) => status !< 500,
    );
  }

  AppDio() {
    _dio.options = _setOptions();
  }

  AppDio.withAuthentication() {
    _dio.options = _setOptions();
    _dio.interceptors.add(InterceptorsWrapper(
      onError: _onError,
      onRequest: _onRequest,
      onResponse: _onResponse,
    ));
  }

  Dio get instance => _dio;
  String get baseUrl => _baseUrl;

  void _onError(DioException e, ErrorInterceptorHandler h) {
    print('ERROR: $e');
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler h) async {
    String? authenticatedUser = await Storage.read('authenticatedUser');
    print('authenticatedUser: $authenticatedUser');
  }

  void _onResponse(Response res, ResponseInterceptorHandler h) {
    print('RESPONSE: $res');
  }
}
