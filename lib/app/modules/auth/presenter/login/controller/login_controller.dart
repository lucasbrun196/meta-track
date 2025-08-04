import 'package:bloc/bloc.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(LoginState.initial());

  void changePasswordVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
}
