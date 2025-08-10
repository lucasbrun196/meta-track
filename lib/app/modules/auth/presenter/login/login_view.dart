import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_track/app/modules/auth/presenter/login/controller/login_controller.dart';
import 'package:meta_track/app/utils/widgets/auth_base_layout.dart';
import 'package:meta_track/app/utils/widgets/auth_credentials_text_input.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';
import 'package:meta_track/app/utils/widgets/models/text_input_type_enum.dart';

class LoginView extends StatefulWidget {
  final LoginController controller;
  const LoginView({super.key, required this.controller});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailFocus.dispose();
    emailController.dispose();
    passwordFocus.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AuthBaseLayout(
        cardContent: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 20,
              children: [
                Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 30,
                    children: [
                      AuthCredentialsTextInput(
                        textInputType: TextInputTypeEnum.email,
                        currentFocus: emailFocus,
                        nextFocus: passwordFocus,
                        controller: emailController,
                      ),
                      BlocBuilder<LoginController, LoginState>(
                        bloc: widget.controller,
                        buildWhen: (previous, current) =>
                            previous.isPasswordVisible !=
                            current.isPasswordVisible,
                        builder: (context, state) {
                          return AuthCredentialsTextInput(
                            textInputType: TextInputTypeEnum.password,
                            currentFocus: passwordFocus,
                            controller: passwordController,
                            obscureText: !state.isPasswordVisible,
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  widget.controller.changePasswordVisibility(),
                              icon: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          overlayColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          onTap: () =>
                              widget.controller.navigateToForgotPassword(),
                          child: Text(
                            'Forgot password?',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BlocBuilder<LoginController, LoginState>(
              bloc: widget.controller,
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                if (state.status == LoginStatus.loading) {
                  return LinearProgressIndicator();
                } else {
                  return TextButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        Size(360, 60),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;
                        await widget.controller.signIn(email, password);
                      }
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        authBottomTextButton: AuthBottomTextButton(
          title: 'Sign up',
          onTap: () => widget.controller.navigateToCreateAccount(),
        ),
      ),
    );
  }
}
