import 'package:ecommerce/data/models/response/LoginResponse.dart';

abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  LoginResponse response;

  LoginSuccessState({required this.response});
}
