part of 'create_account_controller.dart';

enum CreateAccountStatus { initial, loading, success, failure }

class CreateAccountState {
  final CreateAccountStatus status;
  final bool isPasswordVisible, isConfirmPasswordVisible;
  final String? errorMessage;
  CreateAccountState({
    required this.status,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
    this.errorMessage,
  });

  CreateAccountState.initial()
      : this(
          status: CreateAccountStatus.initial,
          isPasswordVisible: false,
          isConfirmPasswordVisible: false,
        );

  CreateAccountState copyWith({
    CreateAccountStatus? status,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    String? errorMessage,
  }) {
    return CreateAccountState(
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
