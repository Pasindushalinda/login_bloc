import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailTextField(bloc),
          passwordTextField(bloc),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailTextField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'you@example.com',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget passwordTextField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.hasError ? snapshot.error.toString() : null),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: ((context, snapshot) {
          return ElevatedButton(
              onPressed: !snapshot.hasData ? null : bloc.submit,
              child: Text('Submit'));
        }));
  }
}
