import 'package:firebase_auth/firebase_auth.dart';

class CoreCubitState {
  final User? currentUser;

  CoreCubitState({
    this.currentUser,
  });

  CoreCubitState.initial() : this();

  CoreCubitState copyWith({
    User? currentUser,
  }) {
    return CoreCubitState(
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
