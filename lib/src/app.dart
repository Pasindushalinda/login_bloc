import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return Provider(
        child: MaterialApp(
      title: 'Log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    ));
  }
}
