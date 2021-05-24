part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationDone extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final DefaultUser user;
  Authenticated({@required this.user});
}

class AuthenticationError extends AuthenticationState {
  final message;
  AuthenticationError(this.message);
}
