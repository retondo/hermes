import 'package:flutter/widgets.dart';
import 'package:cpfcnpj/cpfcnpj.dart' show CPF;
import 'package:hermes/services/api/zeus/auth.dart';

class LoginBloc extends ChangeNotifier {
  final authApi = AuthApi();
  String username, password;
  bool isLoading = false;

  Future<dynamic> login() async {
    try {
      isLoading = true;
      notifyListeners();
      return await authApi.login(username, password);
    } catch (err) {
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String cpfValidator(String value) {
    if (value.isEmpty) {
      return 'Por favor, insira seu CPF';
    } else if (!CPF.isValid(value)) {
      return 'CPF é inválido';
    }
    return null;
  }

  String pwdValidator(String value) {
    if (value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    // TODO: validate pwd strenght
    return null;
  }
}