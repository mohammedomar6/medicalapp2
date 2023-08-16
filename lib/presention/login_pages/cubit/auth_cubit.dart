import 'package:bloc/bloc.dart';

import '../../../domin/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  register(RegisterParams params) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await AuthRepository().register(params);
    result.fold((l) => emit(state.copyWith(status: AuthStatus.failed)),
        (r) => emit(state.copyWith(status: AuthStatus.success)));
  }

  login(LoginParams params) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await AuthRepository().login(params);
    result.fold((l) => emit(state.copyWith(status: AuthStatus.failed)),
        (r) => emit(state.copyWith(status: AuthStatus.success)));
  }
}
