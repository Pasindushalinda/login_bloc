import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_bloc/src/blocs/validators.dart';

class Bloc extends Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('$validateEmail -- $validatePassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
