import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit getObject(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  bool valdatorTextEmail = false;
  void chaingeBoolean_EmailT() {
    valdatorTextEmail = true;
    emit(RegisterChaingeBoolean_EmailT());
  }

  void chaingeBoolean_EmailF() {
    valdatorTextEmail = false;
    emit(RegisterChaingeBoolean_EmailF());
  }

  bool valdatorTextPassword = false;
  void chaingeBoolean_PasswprdT() {
    valdatorTextPassword = true;
    emit(RegisterChaingeBoolean_PasswordT());
  }

  void chaingeBoolean_PasswordF() {
    valdatorTextPassword = false;
    emit(RegisterChaingeBoolean_PasswordF());
  }
}
