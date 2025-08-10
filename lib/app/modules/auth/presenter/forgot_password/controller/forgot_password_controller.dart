import 'package:bloc/bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordController extends Cubit<ForgotPasswordState> {
  ForgotPasswordController() : super(ForgotPasswordState.initial());
}
