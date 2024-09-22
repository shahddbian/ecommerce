import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/utils/custometextfilde.dart';
import 'package:ecommerce/ui/screens/auth/register/cubit/register_screen_viewmodel.dart';
import 'package:ecommerce/ui/screens/auth/register/cubit/register_screen_states.dart';
import 'package:ecommerce/ui/utils/dialogutils.dart';
import 'package:ecommerce/ui/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        bloc: cubit, //bdl el bloc provider
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(
              context: context,
              loadingLabel: 'Loading...',
            );
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: state.errorMessage,
              posActionName: 'Ok',
              title: 'Error',
            );
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: 'Register Successfully.',
              posActionName: 'Ok',
              title: 'Success',
            );
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
        },
        child: Scaffold(
          backgroundColor: MyColors.blueColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/app_logo.png',
                  ),
                  Text(
                    'Full Name',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  CustomTextFormField(
                    label: 'enter your full name',
                    controller: cubit.nameController,
                    validator: (text) {
                      ////trim bt filter spaces 2bl w b3d
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter User Name.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mobile Number',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  CustomTextFormField(
                    label: 'enter your mobile no.',
                    controller: cubit.mobileController,
                    validator: (text) {
                      ////trim bt filter spaces 2bl w b3d
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Mobile number.';
                      }
                      if (text.length < 12) {
                        return 'Mobile no. must be 12 numbers.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'E-mail address',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  CustomTextFormField(
                    label: 'enter your email address',
                    controller: cubit.emailController,
                    validator: (text) {
                      ////trim bt filter spaces 2bl w b3d
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Email.';
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'Please Enter Valid Email.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  CustomTextFormField(
                    label: 'enter your password',
                    controller: cubit.passController,
                    validator: (text) {
                      ////trim bt filter spaces 2bl w b3d
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Password.';
                      }
                      if (text.length < 6) {
                        return 'Password must be at least 6 Characters.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    //>> numbers & letter
                    //keyboardType: TextInputType.number, //numbers only
                    obscureText: !cubit.passwordVisible,
                    //to make it unseen first
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          cubit.passwordVisible = !cubit.passwordVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'RePassword',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColors.whiteColor,
                    ),
                  ),
                  CustomTextFormField(
                    label: 'confirm your password',
                    controller: cubit.repassController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Confirm Password.';
                      }
                      if (text.length < 6) {
                        return 'Password must be at least 6 Characters.';
                      }
                      if (text != cubit.passController.text) {
                        return "Passwords Doesn't match";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    //>> numbers & letter
                    //keyboardType: TextInputType.number, //numbers only
                    obscureText: !cubit.passwordVisible,
                    //to make it unseen first
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          cubit.passwordVisible = !cubit.passwordVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      cubit.register();
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyColors.blueColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(398, 64),
                      backgroundColor: MyColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
