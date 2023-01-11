import 'package:carproject/controller/auth/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../AppConfig/AppColors.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/textform_field.dart';
import 'Signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final LoginStore loginStore=LoginStore();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assests/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: 56.55.w, top: 153.4.w),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (context.watch<LoginProvider>().error)
                      Container(
                        width: width - 100,
                        height: 80,
                        decoration: BoxDecoration(
                            color: context.watch<LoginProvider>().errorText ==
                                    "Success"
                                ? AppColors.sucessColorbackgroun
                                : AppColors.errorColorbackgroun,
                            border: Border.all(
                              color: context.watch<LoginProvider>().errorText ==
                                      "Success"
                                  ? AppColors.successColorbackgrounborder
                                  : AppColors.errorColorbackgrounborder,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            context.watch<LoginProvider>().errorText ==
                                    "Success"
                                ? "Congragulations"
                                : context.watch<LoginProvider>().errorText,
                            style: TextStyle(
                                color:
                                    context.watch<LoginProvider>().errorText ==
                                            "Success"
                                        ? AppColors.successColorbackgrounborder
                                        : AppColors.errorColorbackgrounborder,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 49.w, 0.w, 0.w),
                      child: Text(
                        "User Login",
                        style: TextStyle(
                            fontSize: 35.w,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 10.w, 0.w, 0.w),
                      child: Text(
                        "Login with one of the following options.",
                        style: TextStyle(
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 25.w, 0.w, 0.w),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 7.w, 0.w, 0.w),
                      child: Container(
                        width: 307.w,
                        child: CustomTextField(
                            hinttextColor: Colors.white54,
                            hintfontSize: 14,
                            onChanged: (content) {
                              context.read<LoginProvider>().changeError();
                            },
                            controlllerType: "email",
                            textfillColor: Colors.transparent,
                            focusNode:
                                context.watch<LoginProvider>().emailFocusNode,
                            focusColor: AppColors.white,
                            hintText: "time@apple.com",
                            controller: context.watch<LoginProvider>().emailCtr,
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
                      padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 7.w, 0.w, 0.w),
                      // child: MyFormField(label: "Password", hint: "Enter Password",hintcolor: Colors.black45,hintfontsize: 14,hintfontweight: FontWeight.w400,focusColor: backcolor,backColor: simpleTextColor,),
                      child: Container(
                        width: 307.w,
                        child: CustomTextField(
                            hintfontSize: 14,
                            controlllerType: "password",
                            onChanged: (content) {
                              context.read<LoginProvider>().changeError();
                            },
                            hinttextColor: Colors.white54,
                            textfillColor: Colors.transparent,
                            focusNode:
                                context.watch<LoginProvider>().pwdFocusNode,
                            focusColor: AppColors.white,
                            hintText: "Pick a strong password",
                            controller:
                                context.watch<LoginProvider>().passwordCtr,
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
                          ButtonText: "Login",
                          fontsize: 14,
                          onCustomButtonPressed: () {
                            if (context.read<LoginProvider>().emailCtr.text ==
                                "") {
                              context
                                  .read<LoginProvider>()
                                  .emailFocusNode
                                  .requestFocus();
                            }
                            if (context
                                    .read<LoginProvider>()
                                    .passwordCtr
                                    .text ==
                                "") {
                              context
                                  .read<LoginProvider>()
                                  .pwdFocusNode
                                  .requestFocus();
                            } else {
                              context.read<LoginProvider>().LoginUser();
                            }

                            // Get.off(MyNavigationBar());
                          },
                          textfontcolor: Colors.white,
                          BackgroundColor: AppColors.appBackground,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                        child: Container(
                          width: 307.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dont have an account?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(SignUpPage());
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                                },
                                child: Text(
                                  " SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.w,
                                      fontWeight: FontWeight.w800),
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
      ),
    );
  }
}
