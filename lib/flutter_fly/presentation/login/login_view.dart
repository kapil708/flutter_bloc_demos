import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/flutter_fly/presentation/login/login_cubit.dart';
import '../../common/auth_text_field.dart';
import 'login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);


  Widget loginForm1(context) {
    return  Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _WelcomeText(),
                _EmailInputField(),
                _PasswordInputField(),
                _LoginButton(),
                _SignUpButton(),

              Builder(builder: (context){
                final email= context.select((LoginCubit value) => value.state.email);
                return  Text('----${email.value}');

              }),

                Builder(builder: (context){
                  final email= context.select((LoginCubit value) => value.state.textA);
                  return  Text('----${email}');

                }),

                // BlocConsumer<LoginCubit, LoginState>(
                //   listener: (context, state) {
                //     print("check");
                //     if (state.password == null) {
                //       print('submission failure');
                //     }
                //   },
                //   builder: (context, state) {
                //     return Text("Login:-- ${state.email.value}");
                //   },
                // ),
              ],
            ),
          ),
        ),
        // state.status.isSubmissionInProgress
        //     ? Positioned(
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: CircularProgressIndicator(),
        //   ),
        // ) : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => LoginCubit(),
          child: loginForm1(context),
        ),
      ),
    );
  }


}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to bloc tutorial',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class _EmailInputField extends StatelessWidget {
  const _EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AuthTextField(
          hint: 'Email',
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          // error: state.email.error.name,
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
        );
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  const _PasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AuthTextField(
          padding: EdgeInsets.symmetric(vertical: 20),
          hint: 'Password',
          isPasswordField: true,
          key: const Key('loginForm_passwordInput_textField'),
          keyboardType: TextInputType.text,
          // error: state.password.error.name,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text('Login'),
      onPressed: () {
        // BlocProvider.of<UserBloc>(context).
        context.read<LoginCubit>().logInWithCredentials(context);
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text('Sign Up'),
      onPressed: () {
        context.read<LoginCubit>().logInWithCredentials(context);
      },
    );
  }
}

