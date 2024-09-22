import 'package:ecommerce/ui/screens/auth/login/cubit/login_states.dart';
import 'package:ecommerce/data/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  TextEditingController emailController =
      TextEditingController(text: 'shahd@gmail.com');

  TextEditingController passController = TextEditingController(text: '1151970');

  bool passwordVisible = false;
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
          emailController.text,
          passController.text,
        );
        if (response.statusMsg == 'error') {
          emit(LoginErrorState(errorMessage: response.message!));
        } else {
          emit(LoginSuccessState(response: response));
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
