import 'package:dio/dio.dart';
import 'package:hermes/services/storage.dart';

class AppDio {
  Dio _dio;

  AppDio() {
    _dio = Dio();
    _dio.options = BaseOptions(
      validateStatus: (status) => status < 500,
    );
  }

  AppDio.withAuthentication() {
    _dio = Dio();
    _dio.options = BaseOptions(
      validateStatus: (status) => status < 500,
    );
    _dio.interceptors.add(InterceptorsWrapper(
      onError: _onError,
      onRequest: _onRequest,
      onResponse: _onResponse,
    ));
  }

  Dio get instance => _dio;

  _onError(DioError e) {
    print('ERROR: $e');
    return e;
  }

  _onRequest(RequestOptions options) async {
    String authenticatedUser = await Storage.get('authenticatedUser');
    print('authenticatedUser: $authenticatedUser');
  }

  _onResponse(Response e) {
    print('RESPONSE: $e');
    return e;
  }
}
