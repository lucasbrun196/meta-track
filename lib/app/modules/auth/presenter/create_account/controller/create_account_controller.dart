import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';
import 'package:meta_track/app/modules/auth/domain/services/auth_service.dart';
import 'package:meta_track/app/utils/exceptions/firebase_auth_exception_handler.dart';

part 'create_account_state.dart';

class CreateAccountController extends Cubit<CreateAccountState> {
  final AuthService _authService;
  CreateAccountController(this._authService)
      : super(CreateAccountState.initial());

  void navigateToSignIn() => Modular.to.navigate('/auth/login');

  void changePasswordVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  void changeConfirmPasswordVisibility() => emit(state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible));

  Future<void> signUp(String name, String email, String password) async {
    emit(state.copyWith(status: CreateAccountStatus.loading));
    try {
      final createdUser = await _authService.signUp(
          name: name, email: email, password: password);
      final user = UserCredentialsSignUp(
          name: name, email: email, password: password, uid: createdUser);
      await _authService.createUser(user);
      emit(state.copyWith(status: CreateAccountStatus.success));
    } catch (e) {
      if (e is FirebaseAuthExceptionHandler) {
        emit(state.copyWith(errorMessage: e.message));
      }
      emit(state.copyWith(status: CreateAccountStatus.failure));
    }
  }
}
