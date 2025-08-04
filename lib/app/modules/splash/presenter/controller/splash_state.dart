part of 'splash_controller.dart';

enum SplashStatus { initial, loading, isLogged, isNotLogged }

class SplashState {
  final SplashStatus status;

  const SplashState({
    required this.status,
  });
  const SplashState.initial()
      : this(
          status: SplashStatus.initial,
        );

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }
}
