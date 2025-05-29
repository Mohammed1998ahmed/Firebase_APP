import 'package:bloc/bloc.dart';
import 'package:firebase_app/core/helper/extension.dart';
import 'package:firebase_app/core/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit getObject(context) => BlocProvider.of(context);
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_password = TextEditingController();

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

  signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // الحصول على UID الخاص بالمستخدم
      String userId = credential.user!.uid;
      print("User ID*****************************: $userId");
      context.pushNamed(Routes.home_page);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that email.')),
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong password provided for that user.')),
        );
        print('Wrong password provided for that user.');
      }
    }
  }
}
