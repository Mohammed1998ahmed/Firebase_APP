import 'package:firebase_app/core/helper/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/routes.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit getObject(context) => BlocProvider.of(context);
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_password = TextEditingController();

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

  void createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      context.pushNamed(Routes.home_page);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The password provided is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('he account already exists for that email.')),
        );
      }
    } catch (e) {
      print(e);
    }
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
