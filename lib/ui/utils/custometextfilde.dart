import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  MyValidator validator;
  Widget? suffixIcon;

  CustomTextFormField(
      {required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      required this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: MyColors.blueColor),
            // Sets the label color to blue
            filled: true,
            // Enables the filled background
            fillColor: Colors.white,
            // Sets the fill color to white
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: MyColors.blueColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: MyColors.whiteColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: MyColors.redColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: MyColors.redColor)),
            suffixIcon: suffixIcon,
            errorMaxLines: 2 //el error at most 2 lines
            ),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
