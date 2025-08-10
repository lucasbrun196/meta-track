import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_binds.dart';
import 'package:meta_track/app/modules/auth/auth_module_binds.dart';
import 'package:meta_track/app/modules/auth/presenter/create_account/controller/create_account_controller.dart';
import 'package:meta_track/app/modules/auth/presenter/create_account/create_account_view.dart';
import 'package:meta_track/app/modules/auth/presenter/forgot_password/controller/forgot_password_controller.dart';
import 'package:meta_track/app/modules/auth/presenter/forgot_password/forgot_password_view.dart';
import 'package:meta_track/app/modules/auth/presenter/login/controller/login_controller.dart';
import 'package:meta_track/app/modules/auth/presenter/login/login_view.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AuthModuleBinds(),
        CoreCubitModuleBinds(),
      ];
  @override
  void binds(i) {
    i.addLazySingleton(LoginController.new);
    i.addLazySingleton(ForgotPasswordController.new);
    i.addLazySingleton(CreateAccountController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/login',
      child: (contex) => LoginView(
        controller: Modular.get(),
      ),
    );
    r.child(
      '/forgotpassword',
      child: (context) => ForgotPasswordView(
        controller: Modular.get(),
      ),
    );
    r.child(
      '/createaccount',
      child: (context) => CreateAccountView(
        controller: Modular.get(),
      ),
    );
  }
}
