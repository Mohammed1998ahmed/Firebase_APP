import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit getObject(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  bool valdatorTextEmail = false;
  void chaingeBoolean_EmailT() {
    valdatorTextEmail = true;
    emit(LoginChaingeBoolean_EmailT());
  }

  void chaingeBoolean_EmailF() {
    valdatorTextEmail = false;
    emit(LoginChaingeBoolean_EmailF());
  }

  bool valdatorTextPassword = false;
  void chaingeBoolean_PasswprdT() {
    valdatorTextPassword = true;
    emit(LoginChaingeBoolean_PasswordT());
  }

  void chaingeBoolean_PasswordF() {
    valdatorTextPassword = false;
    emit(LoginChaingeBoolean_PasswordF());
  }
}
