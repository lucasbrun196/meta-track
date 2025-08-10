import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_track/app/modules/auth/presenter/login/controller/login_controller.dart';
import 'package:meta_track/app/utils/widgets/auth_base_layout.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';

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
        title: 'META TRACK',
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
                      TextFormField(
                        focusNode: emailFocus,
                        onTapOutside: (event) => emailFocus.unfocus(),
                        onEditingComplete: () {
                          emailFocus.unfocus();
                          passwordFocus.requestFocus();
                        },
                        validator: (value) {
                          if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value ?? '')) {
                            return 'Enter with a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<LoginController, LoginState>(
                        bloc: widget.controller,
                        buildWhen: (previous, current) =>
                            previous.isPasswordVisible !=
                            current.isPasswordVisible,
                        builder: (context, state) {
                          return TextFormField(
                            focusNode: passwordFocus,
                            onTapOutside: (event) => passwordFocus.unfocus(),
                            onEditingComplete: () => passwordFocus.unfocus(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter with a valid password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !state.isPasswordVisible,
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => widget.controller
                                    .changePasswordVisibility(),
                                icon: Icon(
                                  state.isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              label: Text('Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
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
