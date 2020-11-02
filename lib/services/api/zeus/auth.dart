import 'dart:convert';
import 'package:hermes/models/users.dart';
import 'package:hermes/services/api/api.dart';

class AuthApi extends Api {
  AuthApi() : super();

  dynamic signIn(username, password) {
    final data = json.encode({
      'username': username,
      'password': password
    });

    return post(path: '/authenticate', data: data)
      .then((response) => User.fromJson(json.decode(response.body)));
  }
}
