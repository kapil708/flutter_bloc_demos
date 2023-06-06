import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/flutter_fly/auth_models/email.dart';
import 'package:flutter_bloc_demos/flutter_fly/auth_models/password.dart';
import 'package:flutter_bloc_demos/flutter_fly/blocs/app_blocs.dart';
import 'package:formz/formz.dart';

import '../../blocs/app_events.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      password: state.password
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
     email: state.email
    ));
  }

  Future<void> logInWithCredentials(context) async {
    // if (!state.status.isValidated) return;
    // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    BlocProvider.of<UserBloc>(context).add(LoadUserEvent());
    emit(state.copyWith(textA: 'asdsa'));
    try {
      await Future.delayed(Duration(milliseconds: 500));
      print("Store");
      emit(state.copyWith(email : state.email, password: state.password));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure, error: e.toString()));
    }
  }
}