import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hermes/android/pages/home.dart';
import 'package:hermes/android/pages/login/login.dart';
import 'package:hermes/blocs/login.dart';
import 'package:hermes/components/page.dart';
import 'package:hermes/services/storage.dart';
import 'package:hermes/themes/colors.dart';
import 'package:provider/provider.dart';

class AndroidApp extends StatelessWidget {
  Future<bool> isLoggedIn() async {
    return await Storage.exists('authenticatedUser');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginBloc>.value(value: LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsTheme.primary,
          accentColor: ColorsTheme.accent,
        ),
        home: FutureBuilder(
          future: isLoggedIn(),
          builder: (context, snapshot) {
            return snapshot.data == true
              ? AppPage(child: HomePage())
              : AppPage(child: LoginPage());
          }
        ),
      ),
    );
  }
}
