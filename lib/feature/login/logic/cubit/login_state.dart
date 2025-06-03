part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginChaingeBoolean_EmailT extends LoginState {}

final class LoginChaingeBoolean_EmailF extends LoginState {}

final class LoginChaingeBoolean_PasswordT extends LoginState {}

final class LoginChaingeBoolean_PasswordF extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSecces extends LoginState {}

final class LoginError extends LoginState {}
