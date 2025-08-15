part of 'login_controller.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  final LoginStatus status;
  final bool isPasswordVisible;
  final bool isRemeberMe;
  final String? errorMessage;

  LoginState({
    required this.status,
    required this.isPasswordVisible,
    required this.isRemeberMe,
    this.errorMessage,
  });

  LoginState.initial()
      : this(
          status: LoginStatus.initial,
          isPasswordVisible: false,
          isRemeberMe: false,
        );

  LoginState copyWith({
    LoginStatus? status,
    bool? isPasswordVisible,
    bool? isRemeberMe,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isRemeberMe: isRemeberMe ?? this.isRemeberMe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
