import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_track/app/modules/auth/presenter/create_account/controller/create_account_controller.dart';
import 'package:meta_track/app/utils/widgets/auth_base_layout.dart';
import 'package:meta_track/app/utils/widgets/auth_credentials_text_input.dart';
import 'package:meta_track/app/utils/widgets/custom_snack_bar.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';
import 'package:meta_track/app/utils/widgets/models/text_input_type_enum.dart';

class CreateAccountView extends StatefulWidget {
  final CreateAccountController controller;
  const CreateAccountView({super.key, required this.controller});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    nameFocus.dispose();
    confirmPasswordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<CreateAccountController, CreateAccountState>(
      bloc: widget.controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CreateAccountStatus.success) {
          CustomSnackBar.success(context, 'User created successfully');
          widget.controller.navigateToSignIn();
        }
        if (state.status == CreateAccountStatus.failure) {
          CustomSnackBar.error(
              context, state.errorMessage ?? 'Create user error');
        }
      },
      child: Scaffold(
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
                      'Sign up',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      height: screenSize.height * 0.250,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            spacing: 20,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                focusNode: nameFocus,
                                onTapOutside: (event) => nameFocus.unfocus(),
                                controller: nameController,
                                onEditingComplete: () {
                                  nameFocus.unfocus();
                                  emailFocus.requestFocus();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter with a valid name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Name'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              AuthCredentialsTextInput(
                                label: 'Email',
                                  textInputType: TextInputTypeEnum.email,
                                  currentFocus: emailFocus,
                                  nextFocus: passwordFocus,
                                  controller: emailController),
                              BlocBuilder<CreateAccountController,
                                  CreateAccountState>(
                                bloc: widget.controller,
                                buildWhen: (previous, current) =>
                                    previous.isPasswordVisible !=
                                    current.isPasswordVisible,
                                builder: (context, state) {
                                  return AuthCredentialsTextInput(
                                    label: 'Password',
                                    nextFocus: confirmPasswordFocus,
                                    customValidation: (p0) {
                                      if (p0 == null || p0.length < 8) {
                                        return 'Password must contain at least 8 characters';
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputTypeEnum.password,
                                    currentFocus: passwordFocus,
                                    controller: passwordController,
                                    obscureText: !state.isPasswordVisible,
                                    suffixIcon: IconButton(
                                      onPressed: () => widget.controller
                                          .changePasswordVisibility(),
                                      icon: Icon(
                                        state.isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              BlocBuilder<CreateAccountController,
                                  CreateAccountState>(
                                bloc: widget.controller,
                                buildWhen: (previous, current) =>
                                    previous.isConfirmPasswordVisible !=
                                    current.isConfirmPasswordVisible,
                                builder: (context, state) {
                                  return AuthCredentialsTextInput(
                                    label: 'Confirm password',
                                    customValidation: (p0) {
                                      if(p0 == null || p0.isEmpty){
                                        return 'This field is required';
                                      }
                                      if (p0 != passwordController.text) {
                                        return 'Incorrect password';
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputTypeEnum.password,
                                    currentFocus: confirmPasswordFocus,
                                    controller: confirmPasswordController,
                                    obscureText:
                                        !state.isConfirmPasswordVisible,
                                    suffixIcon: IconButton(
                                      onPressed: () => widget.controller
                                          .changeConfirmPasswordVisibility(),
                                      icon: Icon(
                                        state.isConfirmPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<CreateAccountController, CreateAccountState>(
                bloc: widget.controller,
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  if (state.status == CreateAccountStatus.loading) {
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
                          final name = nameController.text;
                          await widget.controller.signUp(name, email, password);
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          authBottomTextButton: AuthBottomTextButton(
            title: 'Back to sign in',
            onTap: () => widget.controller.navigateToSignIn(),
          ),
        ),
      ),
    );
  }
}
