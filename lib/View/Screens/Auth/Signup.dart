import 'package:carproject/controller/auth/SignUpProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../AppConfig/AppColors.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/textform_field.dart';
import 'Login.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assests/background.png",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 56.55.w, top: 63.4.w),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (context.watch<SignUpProvider>().error)
                          Container(
                            width: width - 100,
                            height: 80,
                            decoration: BoxDecoration(
                                color: context
                                    .watch<SignUpProvider>()
                                    .errorText ==
                                    "Success"
                                    ? AppColors.sucessColorbackgroun
                                    : AppColors.errorColorbackgroun,
                                border: Border.all(
                                  color: context
                                      .watch<SignUpProvider>()
                                      .errorText ==
                                      "Success"
                                      ? AppColors.successColorbackgrounborder
                                      : AppColors.errorColorbackgrounborder,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                context.watch<SignUpProvider>().errorText ==
                                        "Success"
                                    ? "Success"
                                    : context.watch<SignUpProvider>().errorText,
                                style: TextStyle(
                                    color: context
                                                .watch<SignUpProvider>()
                                                .errorText ==
                                            "Success"
                                        ? AppColors.successColorbackgrounborder
                                        : AppColors.errorColorbackgrounborder,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0.0.w, 40.96.w, 0.w, 0.w),
                          child: Container(
                            // height: 43.h,
                            child: Text(
                              "User Register",
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0.w, 10.w, 0.w, 0.w),
                          child: Container(
                            height: 20.h,
                            child: Text(
                              "Register with us.",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0.w, 25.w, 0.w, 0.w),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0.0.w, 10.w, 0.45.w, 0.w),
                          child: Container(
                            width: 307.w,
                            child: CustomTextField(
                                hinttextColor: Colors.white54,
                                hintfontSize: 14,
                                controlllerType: "name",
                                textfillColor: Colors.transparent,

                                onChanged: (content) {
                                  context.read<SignUpProvider>().changeError();
                                },

                                focusNode: context
                                    .watch<SignUpProvider>()
                                    .NameFocusNode,

                                focusColor: AppColors.white,
                                hintText: "John Doe",
                                controller:
                                    context.watch<SignUpProvider>().NameCtr,
                                suffixIcon: IconButton(
                                  icon: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    color: AppColors.appThemeColor,
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 17.sp,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  // focusNode: emailFocusNode,
                                )),
                          ),

                          // child:  MyFormField(label: "Email", hint: "Enter UserEmail",hintcolor: Colors.black45,hintfontsize: 14,hintfontweight: FontWeight.w400,focusColor: backcolor,backColor: simpleTextColor,),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0.w, 25.w, 0.w, 0.w),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0.w, 10.w, 0.0.w, 0.w),
                          child: Container(
                            width: 307.w,
                            child: CustomTextField(
                                hinttextColor: Colors.white54,
                                hintfontSize: 14,
                                controlllerType: "email",
                                textfillColor: Colors.transparent,
                                onChanged: (content) {
                                  context.read<SignUpProvider>().changeError();
                                },
                                focusNode: context
                                    .watch<SignUpProvider>()
                                    .emailFocusNode,
                                focusColor: AppColors.white,
                                hintText: "time@apple.com",
                                controller:
                                    context.watch<SignUpProvider>().emailCtr,
                                suffixIcon: IconButton(
                                  icon: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    color: AppColors.appThemeColor,
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 17.sp,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  // focusNode: emailFocusNode,
                                )),
                          ),

                          // child:  MyFormField(label: "Email", hint: "Enter UserEmail",hintcolor: Colors.black45,hintfontsize: 14,hintfontweight: FontWeight.w400,focusColor: backcolor,backColor: simpleTextColor,),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0.w, 25.w, 0.w, 0.w),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0.55.w, 10.w, 0.45.w, 0.w),
                          // child: MyFormField(label: "Password", hint: "Enter Password",hintcolor: Colors.black45,hintfontsize: 14,hintfontweight: FontWeight.w400,focusColor: backcolor,backColor: simpleTextColor,),
                          child: Container(
                            width: 307.w,
                            child: CustomTextField(
                                hintfontSize: 14,
                                onChanged: (content) {
                                  context.read<SignUpProvider>().changeError();
                                },
                                hinttextColor: Colors.white54,
                                textfillColor: Colors.transparent,
                                focusNode: context
                                    .watch<SignUpProvider>()
                                    .pwdFocusNode,
                                controlllerType: "password",
                                focusColor: AppColors.white,
                                hintText: "Pick a strong password",
                                controller:
                                    context.watch<SignUpProvider>().passwordCtr,
                                suffixIcon: IconButton(
                                  icon: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    color: AppColors.appThemeColor,
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 17.sp,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  // focusNode: emailFocusNode,
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 35.w, 0.w, 0),
                          child: Container(
                            width: 307.w,
                            height: 54.h,
                            child: MyFormButton(
                              fontweight: FontWeight.w500,
                              ButtonText: "Create Account",
                              fontsize: 14,
                              onCustomButtonPressed: () {
                                if(context.read<SignUpProvider>().NameCtr.text==""){
                                  context.read<SignUpProvider>().NameFocusNode.requestFocus();
                                }
                                if(context.read<SignUpProvider>().emailCtr.text==""){
                                  context.read<SignUpProvider>().emailFocusNode.requestFocus();
                                }
                                if(context.read<SignUpProvider>().passwordCtr.text==""){
                                  context.read<SignUpProvider>().pwdFocusNode.requestFocus();
                                }
                                else{
                                  context.read<SignUpProvider>().registerUSer();
                                }

                             //   context.read<SignUpProvider>().registerUSer();
                              },
                              textfontcolor: Colors.white,
                              BackgroundColor: AppColors.black,
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(0.0.w, 20.w, 0.0.w, 0.w),
                            child: Container(
                              width: 307.w,
                              height: 17.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an Account?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.w,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //  Get.to(const LoginPage());
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      " Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.w,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
