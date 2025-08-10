import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'create_account_state.dart';

class CreateAccountController extends Cubit<CreateAccountState> {
  CreateAccountController() : super(CreateAccountState.initial());

  void navigateToSignIn() => Modular.to.navigate('/auth/login');
}
