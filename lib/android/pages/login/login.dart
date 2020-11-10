import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hermes/android/pages/home.dart';
import 'package:hermes/android/pages/login/banner.dart';
import 'package:hermes/android/pages/login/progress.dart';
import 'package:hermes/android/pages/login/separator.dart';
import 'package:hermes/blocs/login.dart';
import 'package:hermes/themes/colors.dart';
import 'package:hermes/themes/spacing.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _login(context, bloc) async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final authUser = await bloc.login();

      if (authUser == null) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário ou senha inválidos!'),
            backgroundColor: Colors.red,
          ),
        );
      }

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context);

    return Consumer<LoginBloc>(builder: (context, loginBloc, widget) {
      return SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              AppBanner(),
              Container(
                padding: SpacingTheme.pagePadding,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 18.0),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: false),
                            decoration: const InputDecoration(
                              hintText: 'CPF',
                            ),
                            validator: bloc.cpfValidator,
                            onSaved: (value) => bloc.username = value,
                          ),
                          SizedBox(height: 18.0),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              hintText: 'Senha',
                            ),
                            validator: bloc.pwdValidator,
                            onSaved: (value) => bloc.password = value,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 36.0),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: bloc.isLoading
                          ? AppLinearProgress()
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
                    AppSeparator(),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          'Registrar',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        textColor: Colors.white,
                        color: ColorsTheme.accent,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
