part of 'login_controller.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  final LoginStatus status;
  final bool isPasswordVisible;

  LoginState({
    required this.status,
    required this.isPasswordVisible,
  });

  LoginState.initial()
      : this(
          status: LoginStatus.initial,
          isPasswordVisible: false,
        );

  LoginState copyWith({
    LoginStatus? status,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
