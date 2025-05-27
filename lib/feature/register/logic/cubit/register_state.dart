part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterChaingeValdator extends RegisterState {}

final class RegisterChaingeBoolean_EmailT extends RegisterState {}

final class RegisterChaingeBoolean_EmailF extends RegisterState {}

final class RegisterChaingeBoolean_PasswordT extends RegisterState {}

final class RegisterChaingeBoolean_PasswordF extends RegisterState {}
