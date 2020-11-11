import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hermes/models/user.dart';
import 'package:hermes/services/app_dio.dart';
import 'package:hermes/services/storage.dart';

class AuthApi {
  final _dio = AppDio().instance;

  Future<dynamic> login(String username, String password) async {
    final data = json.encode({
      'username': username,
      'password': password
    });

    try {
      Response<Map<String, dynamic>> response = await _dio.post('/authenticate', data: data);
      if (response.statusCode == 200) {
        await Storage.write('authenticatedUser', response.data.toString());
        return User.fromJson(response.data);
      }
      return null;
    } catch (err) {
      print('Erro do AuthApi.login: $err');
      return null;
    }
  }

  Future<dynamic> register(User user) async {
    try {
      Map<String, dynamic> encodedUser = user.toJson();
      Response response = await _dio.post('/register', data: encodedUser);
      if (response.statusCode == 201) {
        await Storage.write('authenticatedUser', response.data.toString());
        return User.fromJson(response.data);
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
