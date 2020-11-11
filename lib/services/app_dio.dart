import 'package:dio/dio.dart';
import 'package:hermes/app_config.dart';
import 'package:hermes/services/storage.dart';

class AppDio {
  final Dio _dio = Dio();
  final String _baseUrl = AppConfig.get('API_BASE_URL');

  BaseOptions _setOptions() {
    return BaseOptions(
      baseUrl: this._baseUrl,
      validateStatus: (status) => status < 500,
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

  _onError(DioError e) {
    print('ERROR: $e');
    return e;
  }

  _onRequest(RequestOptions options) async {
    String authenticatedUser = await Storage.read('authenticatedUser');
    print('authenticatedUser: $authenticatedUser');
  }

  _onResponse(Response e) {
    print('RESPONSE: $e');
    return e;
  }
}
