import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_controller.dart';
import 'package:meta_track/app/modules/auth/domain/services/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;
  final CoreCubitController _coreCubitController;
  LoginController(this._authService, this._coreCubitController)
      : super(LoginState.initial());

  void changePasswordVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  void changeRememberMeStatus(bool value) =>
      emit(state.copyWith(isRemeberMe: value));

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final user = await _authService.signIn(email: email, password: password);
      _coreCubitController.setCurrentUser(user);

      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  void navigateToForgotPassword() =>
      Modular.to.navigate('/auth/forgotpassword');

  void navigateToCreateAccount() => Modular.to.navigate('/auth/createaccount');
}
