import 'package:ecommerce/ui/screens/auth/register/cubit/register_screen_states.dart';
import 'package:ecommerce/data/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  //Hold data , handle logic
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool passwordVisible = false;

  Future<void> register() async {
    try {
      emit(RegisterLoadingState());
      var response = await ApiManager.register(
        nameController.text,
        emailController.text,
        passController.text,
        mobileController.text,
        repassController.text,
      );
      if (response.statusMsg == 'fail') {
        emit(RegisterErrorState(errorMessage: response.message!));
      } else {
        emit(RegisterSuccessState(response: response));
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
