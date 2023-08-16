part of 'auth_cubit.dart';

enum AuthStatus { loading, success, failed, init }

class AuthState {
  final AuthStatus status;
  AuthState({this.status = AuthStatus.init});

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}
