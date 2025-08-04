import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_track/app/modules/auth/presenter/login/controller/login_controller.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'META TRACK',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'Playfairdisplay',
                  fontSize: 48,
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(150, 0, 0, 0),
                      offset: Offset(0, 20),
                      blurRadius: 45,
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
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
                      cursorWidth: 1,
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
                          cursorWidth: 1,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !state.isPasswordVisible,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  widget.controller.changePasswordVisibility(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Text('Keep logged'),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            print('presss');
                          },
                          child: Text('Forgot password'),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('logaaar');
                        }
                      },
                      child: Text('Text'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
