
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../auth_models/email.dart';
import '../../auth_models/password.dart';
class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.textA,
    // this.exceptionError
  });

  final Email email;
  final Password password;
  final String? textA;
  // final FormzSubmissionStatus status;
  // final String? exceptionError;

  @override
  List<dynamic> get props => [email, password, textA];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
     String? error,
    String? textA
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      textA: textA ?? this.textA,
      // status: status ?? this.status,
      // exceptionError: error ?? this.exceptionError,
    );
  }
}