import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hermes/blocs/login.dart';
import 'package:hermes/themes/colors.dart';
import 'package:hermes/themes/spacing.dart';
import 'package:hermes/android/pages/home.dart';
import 'package:hermes/components/page.dart';
import 'package:hermes/components/margin.dart';
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _login(context, bloc) async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final authUser = await bloc.login();

      authUser != null
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AppPage(child: HomePage())),
          )
        : Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário ou senha inválidos!'),
            backgroundColor: ColorsTheme.warning,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context);

    return Consumer<LoginBloc>(builder: (context, loginBloc, widget) {
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: ExactAssetImage('assets/images/logo_white_blue.png'),
              height: 125,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Margin(
                    horizontal: SpacingTheme.pagePadding,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                      decoration: const InputDecoration(
                        hintText: 'CPF',
                      ),
                      validator: bloc.cpfValidator,
                      onSaved: (value) => bloc.username = value,
                    ),
                  ),
                  Margin(
                    vertical: 40.0,
                    horizontal: SpacingTheme.pagePadding,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                      validator: bloc.pwdValidator,
                      onSaved: (value) => bloc.password = value,
                    ),
                  ),
                  Margin(
                    all: SpacingTheme.pagePadding,
                    child: Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: bloc.isLoading
                          ? Container(
                              padding: EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width / 2,
                              child: LinearProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text(
                              'Entrar',
                              style: TextStyle(fontSize: 16.0),
                            ),
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        textColor: Colors.white,
                        color: ColorsTheme.primary,
                        onPressed: () => _login(context, bloc)),
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Não possui uma conta? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Registrar-se',
                    style: TextStyle(
                      color: ColorsTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {}
                  ),
                ]
              ),
            ),
          ],
        ),
      );
    });
  }
}
