import 'package:flutter/material.dart';
import 'package:meta_track/app/modules/auth/presenter/create_account/controller/create_account_controller.dart';
import 'package:meta_track/app/utils/widgets/auth_base_layout.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';

class CreateAccountView extends StatefulWidget {
  final CreateAccountController controller;
  const CreateAccountView({super.key, required this.controller});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
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
                    'Sign up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                TextFormField(
                  //focusNode: passwordFocus,
                  //onTapOutside: (event) => passwordFocus.unfocus(),
                  //onEditingComplete: () => passwordFocus.unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter with a valid password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        authBottomTextButton: AuthBottomTextButton(
          title: 'Back to sign in',
          onTap: () => widget.controller.navigateToSignIn(),
        ),
      ),
    );
  }
}
