import 'package:ecommerce/ui/screens/auth/login/loginscreen.dart';
import 'package:ecommerce/ui/utils/custometextfilde.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:ecommerce/ui/utils/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final mobileController = TextEditingController();
    final addressController = TextEditingController();

    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: _buildProfileInfo('Welcome ,Shahd', 'shahd@gmail.com'),
          ),
          _buildFieldSection("Your Full Name", nameController, (value) {
            return (value == null || value.isEmpty)
                ? 'Please enter your full name'
                : null;
          }),
          _buildFieldSection("Your E-mail", emailController, (value) {
            return (value == null || value.isEmpty)
                ? 'Please enter your email'
                : null;
          }, keyboardType: TextInputType.emailAddress),
          _buildFieldSection("Your password", passwordController, (value) {
            return (value == null || value.isEmpty)
                ? 'Please enter your password'
                : null;
          }, obscureText: true),
          _buildFieldSection("Your mobile number", mobileController, (value) {
            return (value == null || value.isEmpty)
                ? 'Please enter your mobile number'
                : null;
          }, keyboardType: TextInputType.phone),
          _buildFieldSection("Your Address", addressController, (value) {
            return (value == null || value.isEmpty)
                ? 'Please enter your address'
                : null;
          }),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Image.asset('assets/images/app_bar_logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 20),
          child: IconButton(
            onPressed: () {
              mySharedPreferences.removeData(key: 'token');
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, (route) => false);
            },
            icon: Icon(Icons.logout, color: MyColors.blueColor),
          ),
        )
      ],
    );
  }

  Widget _buildProfileInfo(String name, String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyColors.darkColor,
          ),
        ),
        Text(
          email,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: MyColors.darkColor,
          ),
        ),
      ],
    );
  }

  Widget _buildFieldSection(String label, TextEditingController controller,
      String? Function(String?) validator,
      {bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: MyColors.darkColor,
            ),
          ),
          CustomTextFormField(
            label: '',
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            keyboardType: keyboardType,
            suffixIcon: Icon(Icons.edit, color: MyColors.blueColor),
          ),
        ],
      ),
    );
  }
}
