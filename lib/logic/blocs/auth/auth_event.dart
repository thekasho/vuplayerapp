part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthRegister extends AuthEvent {
  final String username;
  final String password;
  final String domain;

  AuthRegister(this.username, this.password, this.domain);
}

class AuthGetUser extends AuthEvent {}

class AuthLogOut extends AuthEvent {}
