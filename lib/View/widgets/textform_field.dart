import 'package:carproject/View/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../AppConfig/AppColors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  bool? obsecureText = false;
  IconButton? suffixIcon;
  final ValueChanged<String>? onChanged;
  Function? onEditingComplete;
  GestureTapCallback? onTap;
  bool? enabled = true;
  int? maxLines;
  String? controlllerType;
  String? hintText;
  TextInputType? keyboardType;
  bool? autoFocus;
  Color focusColor;
  Color hinttextColor;
  Color textfillColor;
  double? height;
  double? width;
  int? maxLength;
  double hintfontSize;
  FocusNode? focusNode;
  bool? phoneNumber = false;
  bool? disableborder = false;
  double? borderRadiusCircular;

  ///Constructor
  CustomTextField({
    @required this.controller,
    @required this.label,
    this.obsecureText,
    required this.controlllerType,
    required this.hintfontSize,
    required this.focusColor,
    required this.hinttextColor,
    required this.textfillColor,
    this.onChanged,
    this.suffixIcon,
    this.onEditingComplete,
    this.enabled,
    this.onTap,
    this.maxLines,
    this.hintText,
    this.keyboardType,
    this.autoFocus,
    this.height,
    this.width,
    this.maxLength,
    this.focusNode,
    this.phoneNumber,
    this.disableborder,
    this.borderRadiusCircular,
  });

  String validatePassword(String value) {
    print("found data: ");
    if (!(value.length > 8) && value.isNotEmpty) {
      return "Password should contain more than 8 characters";
    }
    return "";
  }

  String nameValidator(String name) {
    return "";

  }

  String EmailValidator(String email) {
    if (email == "") {
      return "";
    } else {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (emailValid) {
        return "";
      }
      return "Invalid Email";
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    print("Contrller type: " + controlllerType.toString());
    print("${focusNode?.hasFocus} vlaue of tefield");
    return Container(
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          focusNode: focusNode,
          maxLength: maxLength,
          autofocus: autoFocus ?? false,
          keyboardType: keyboardType,
          maxLines: maxLines ?? 1,
          enabled: enabled,
          onTap: onTap,
          onEditingComplete: () {
            onEditingComplete!();
          },
          onChanged: onChanged,
          controller: controller,
          obscureText: obsecureText ?? false,
          cursorColor: focusColor,
          style: phoneNumber ?? false
              ? Styles.phoneNumberTextStyle(Colors.white54)
              : Styles.textFieldTextStyle(Colors.white54),
          decoration: disableborder ?? false
              ? InputDecoration(
                  errorText: validatePassword(controller!.text) == ""
                      ? null
                      : validatePassword(controller!.text),
                  hintText: hintText,
                  suffixIcon: focusNode?.hasFocus == true ? suffixIcon : null,
                  fillColor: textfillColor,
                  filled: true,
                  focusColor: focusColor,
                  hoverColor: focusColor,
                  labelText: label,

                  hintStyle: TextStyle(
                    color: hinttextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: hintfontSize.sp,
                  ),
                  labelStyle: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: hintfontSize.sp,
                      height: 0),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(borderRadiusCircular??25.0),
                  //   borderSide: BorderSide.none,
                  // ),
                )
              : InputDecoration(
                  errorText: controlllerType == "password"
                      ? validatePassword(controller!.text) == ""
                          ? null
                          : validatePassword(controller!.text)
                      : controlllerType == "email"
                          ? EmailValidator(controller!.text) == ""
                              ? null
                              : EmailValidator(controller!.text)
                          : controlllerType == "name"
                              ? nameValidator(controller!.text) == ""
                                  ? null
                                  : nameValidator(controller!.text)
                              : nameValidator(controller!.text) == ""
                                  ? null
                                  : nameValidator(controller!.text),
                  hintText: hintText,
                  suffixIcon: focusNode?.hasFocus == true ? suffixIcon : null,
                  fillColor: textfillColor,
                  filled: true,
                  focusColor: focusColor,
                  hoverColor: focusColor,
                  labelText: label,
                  hintStyle: TextStyle(
                      color: hinttextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: hintfontSize.sp),
                  labelStyle: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: hintfontSize.sp),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: focusColor,
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey)),
                ),
        ),
      ),
    );
  }
}
