import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/auth/domain/services/auth_service.dart';

part 'forgot_password_state.dart';

class ForgotPasswordController extends Cubit<ForgotPasswordState> {
  final AuthService _authService;
  ForgotPasswordController(this._authService)
      : super(ForgotPasswordState.initial());

  void navigateToSignIn() => Modular.to.navigate('/auth/login');

  Future<void> resetPassword(String email) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    try {
      await _authService.resetPassword(email: email);
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ForgotPasswordStatus.failure));
    }
  }
}
