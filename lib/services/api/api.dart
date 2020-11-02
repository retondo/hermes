import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hermes/app_config.dart';

class Api {
  final String _apiBaseUrl = AppConfig.get('API_BASE_URL');
  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };
  String path;

  Api([this.path = '']) {
    if (this.path.isNotEmpty && this.path.indexOf('/') != 0) {
      throw('Path should start with slash "/"');
    }
  }

  String get url => this._apiBaseUrl + this.path;

  Future<http.Response> getOne({ String path = '', String id = '' }) {
    final _url = path.isNotEmpty ? _apiBaseUrl + path : url;
    return http.get(_url + id);
  }

  Future<http.Response> post({ String path = '', String data }) {
    final _url = path.isNotEmpty ? _apiBaseUrl + path : url;
    return http.post(_url, headers: _headers, body: data);
  }

  Future<http.Response> put({ String path = '', String id, String data }) {
    final _url = path.isNotEmpty ? _apiBaseUrl + path : url;
    return http.put(_url + id, body: data);
  }
}
