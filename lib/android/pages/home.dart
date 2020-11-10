import 'package:flutter/material.dart';
import 'package:hermes/services/storage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Text('Home Page!!!'),
              MaterialButton(
                child: Text('Sair'),
                onPressed: () async {
                  await Storage.remove('authenticatedUser');
                  Navigator.pop(context);
                },
              )
            ],
          )
        ),
      ),
    );
  }
}
