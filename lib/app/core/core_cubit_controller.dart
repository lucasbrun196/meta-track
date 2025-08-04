import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/core/core_cubit_state.dart';

class CoreCubitController extends Cubit<CoreCubitState> {
  CoreCubitController() : super(CoreCubitState.initial());

  void setCurrentUser(User user) => emit(state.copyWith(currentUser: user));

  User? get getCurretUser => state.currentUser;
}
