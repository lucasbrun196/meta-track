import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/auth/presenter/forgot_password/controller/forgot_password_controller.dart';
import 'package:meta_track/app/utils/snack_bar.dart';
import 'package:meta_track/app/utils/widgets/auth_base_layout.dart';
import 'package:meta_track/app/utils/widgets/auth_credentials_text_input.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';
import 'package:meta_track/app/utils/widgets/models/text_input_type_enum.dart';

class ForgotPasswordView extends StatefulWidget {
  final ForgotPasswordController controller;
  const ForgotPasswordView({super.key, required this.controller});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late TextEditingController emailController = TextEditingController();
  late FocusNode eamilFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    eamilFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordController, ForgotPasswordState>(
      bloc: widget.controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.failure) {
          CustomSnackBar(context: context)
              .errorSnackBar('Error when send email to reset password');
        } else if (state.status == ForgotPasswordStatus.success) {
          CustomSnackBar(context: context)
              .successSnackBar('An email has sent to you, verify you inbox');
              Modular.to.navigate('/auth/login');
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
                  Text(
                    'Forgot password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      child: AuthCredentialsTextInput(
                        label: 'Email',
                        currentFocus: eamilFocus,
                        controller: emailController,
                        textInputType: TextInputTypeEnum.email,
                      ),
                    ),
                  )
                ],
              ),
              BlocBuilder<ForgotPasswordController, ForgotPasswordState>(
                bloc: widget.controller,
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  if (state.status == ForgotPasswordStatus.loading) {
                    return LinearProgressIndicator();
                  } else {
                    return TextButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(
                          Size(360, 60),
                        ),
                      ),
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                         await widget.controller.resetPassword(emailController.text.trim());
                        }
                      },
                      child: Text(
                        'Send',
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
              onTap: () => widget.controller.navigateToSignIn()),
        ),
      ),
    );
  }
}
