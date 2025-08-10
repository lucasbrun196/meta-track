part of 'create_account_controller.dart';

enum CreateAccountStatus { initial, loading, success, failure }

class CreateAccountState {
  final CreateAccountStatus status;
  CreateAccountState({
    required this.status,
  });

  CreateAccountState.initial()
      : this(
          status: CreateAccountStatus.initial,
        );

  CreateAccountState copyWith({
    CreateAccountStatus? status,
  }) {
    return CreateAccountState(
      status: status ?? this.status,
    );
  }
}
