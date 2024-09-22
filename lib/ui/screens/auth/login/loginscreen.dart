import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/utils/custometextfilde.dart';
import 'package:ecommerce/ui/screens/auth/login/cubit/login_screen_view_model.dart';
import 'package:ecommerce/ui/screens/auth/login/cubit/login_states.dart';
import 'package:ecommerce/ui/screens/auth/register/register_screen.dart';
import 'package:ecommerce/ui/utils/dialogutils.dart';
import 'package:ecommerce/ui/screens/home/homescreen.dart';
import 'package:ecommerce/ui/utils/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginCubit cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(
            context: context,
            loadingLabel: 'Waiting',
          );
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: 'Login Successfully.',
            title: 'Success',
            posActionName: 'OK',
          );
          mySharedPreferences.saveData(
              key: 'token', value: state.response.token);
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.blueColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/app_logo.png',
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Welcome Back to Route",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColors.whiteColor,
                      ),
                    ),
                    Text(
                      "Please sign in with your mail",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: MyColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.whiteColor,
                      ),
                    ),
                    CustomTextFormField(
                      label: 'enter your email',
                      controller: cubit.emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password",
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
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password.';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 Characters.';
                        }
                        return null;
                      },
                      obscureText: !cubit.passwordVisible,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        cubit.login();
                      },
                      child: Text(
                        'Login',
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
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        "Don't have an account? Create Account",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
