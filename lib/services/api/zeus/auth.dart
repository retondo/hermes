import 'dart:convert';
import 'package:hermes/app_config.dart';
import 'package:hermes/models/users.dart';
import 'package:hermes/services/app_dio.dart';
import 'package:hermes/services/storage.dart';

class AuthApi {
  final _dio = AppDio().instance;
  final String _apiBaseUrl = AppConfig.get('API_BASE_URL');

  Future<dynamic> signIn(String username, String password) async {
    final data = json.encode({
      'username': username,
      'password': password
    });

    try {
      final response = await _dio.post('$_apiBaseUrl/authenticate', data: data);
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        await Storage.set('authenticatedUser', user.toString());
        return user;
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  Future<dynamic> signUp(User user) async {
    final encodedUser = json.encode(user);

    try {
      final response = await _dio.post('$_apiBaseUrl/register', data: encodedUser);
      if (response.statusCode == 201) {
        final authenticatedUser = User.fromJson(response.data);
        await Storage.set('authenticatedUser', authenticatedUser.toString());
        return authenticatedUser;
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  void logout() async {
    await Storage.remove('authenticatedUser');
  }
}
