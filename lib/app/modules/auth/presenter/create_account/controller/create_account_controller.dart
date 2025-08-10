import 'package:bloc/bloc.dart';

part 'create_account_state.dart';

class CreateAccountController extends Cubit<CreateAccountState> {
  CreateAccountController() : super(CreateAccountState.initial());
}
