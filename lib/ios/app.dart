import 'package:flutter/cupertino.dart';
import 'package:hermes/ios/pages/home.dart';
import 'package:hermes/ios/pages/login.dart';
import 'package:hermes/services/storage.dart';

class IOSApp extends StatelessWidget {
  Future<bool> isLoggedIn() async {
    return await Storage.exists('authenticatedUser');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: FutureBuilder(
        future: isLoggedIn(),
        builder: (context, snapshot) =>
          snapshot.data == true ? HomePage() : LoginPage()
      ),
    );
  }
}