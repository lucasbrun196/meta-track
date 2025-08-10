part of 'forgot_password_controller.dart';

enum ForgotPasswordStatus { initial, loading, success, failure }

class ForgotPasswordState {
  final ForgotPasswordStatus status;

  ForgotPasswordState({
    required this.status,
  });

  ForgotPasswordState.initial()
      : this(
          status: ForgotPasswordStatus.initial,
        );

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
    );
  }
}
