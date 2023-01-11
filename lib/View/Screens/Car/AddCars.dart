import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:carproject/controller/auth/AddCarProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth/AddCarProvider.dart';
import '../../AppConfig/AppColors.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/textform_field.dart';
class Addcars extends StatelessWidget {
  const Addcars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assests/background.png"),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(left: 56.55.w, top: 153.4.w),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (context.watch<AddCarProvider>().error)
                        Container(
                          width: width - 100,
                          height: 80,
                          decoration: BoxDecoration(
                              color: context.watch<AddCarProvider>().errorText ==
                                  "Success"
                                  ? AppColors.sucessColorbackgroun
                                  : AppColors.errorColorbackgroun,
                              border: Border.all(
                                color: context.watch<AddCarProvider>().errorText ==
                                    "Success"
                                    ? AppColors.successColorbackgrounborder
                                    : AppColors.errorColorbackgrounborder,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              context.watch<AddCarProvider>().errorText ==
                                  "Success"
                                  ? "Congragulations"
                                  : context.watch<AddCarProvider>().errorText,
                              style: TextStyle(
                                  color:
                                  context.watch<AddCarProvider>().errorText ==
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
                          "Add Car",
                          style: TextStyle(
                              fontSize: 35.w,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 10.w, 0.w, 0.w),
                        child: Text(
                          "Add your car.",
                          style: TextStyle(
                              fontSize: 16.w,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 25.w, 0.w, 0.w),
                        child: Text(
                          "Model",
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
                                context.read<AddCarProvider>().changeError();
                              },
                              controlllerType: "model",
                              textfillColor: Colors.transparent,
                              focusNode:
                              context.watch<AddCarProvider>().ModelFocusNode,
                              focusColor: AppColors.white,
                              hintText: "Honda",
                              controller: context.watch<AddCarProvider>().ModelCtr,
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
                                // focusNode: ModelFocusNode,
                              )),
                        ),

                        // child:  MyFormField(l)el: "Email", hint: "Enter UserEmail",hintcolor: Colors.black45,hintfontsize: 14,hintfontweight: FontWeight.w400,focusColor: backcolor,backColor: simpleTextColor,),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                        child: Text(
                          "Make",
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
                              controlllerType: "Make",
                              onChanged: (content) {
                                context.read<AddCarProvider>().changeError();
                              },
                              hinttextColor: Colors.white54,
                              textfillColor: Colors.transparent,
                              focusNode:
                              context.watch<AddCarProvider>().MakeFocusNode,
                              focusColor: AppColors.white,
                              hintText: "2202-2-10",
                              controller:
                              context.watch<AddCarProvider>().MakeCtr,
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
                                // focusNode: ModelFocusNode,
                              )),
                        ),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                        child: Text(
                          "RegistrationNo",
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
                              controlllerType: "RegistrationNo",
                              onChanged: (content) {
                                context.read<AddCarProvider>().changeError();
                              },
                              hinttextColor: Colors.white54,
                              textfillColor: Colors.transparent,
                              focusNode:
                              context.watch<AddCarProvider>().RegistationFocusNode,
                              focusColor: AppColors.white,
                              hintText: "123asd3",
                              controller:
                              context.watch<AddCarProvider>().RegistrationCtr,
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
                                // focusNode: ModelFocusNode,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                        child: Text(
                          "color",
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
                              controlllerType: "color",
                              onChanged: (content) {
                                context.read<AddCarProvider>().changeError();
                              },
                              hinttextColor: Colors.white54,
                              textfillColor: Colors.transparent,
                              focusNode:
                              context.watch<AddCarProvider>().ColorFocusNode,
                              focusColor: AppColors.white,
                              hintText: "red",
                              controller:
                              context.watch<AddCarProvider>().ColorCtr,
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
                                // focusNode: ModelFocusNode,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                        child: Text(
                          "categories",
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
                              controlllerType: "categories",
                              onChanged: (content) {
                                context.read<AddCarProvider>().changeError();
                              },
                              hinttextColor: Colors.white54,
                              textfillColor: Colors.transparent,
                              focusNode:
                              context.watch<AddCarProvider>().CAtegoriesFocusNode,
                              focusColor: AppColors.white,
                              hintText: "Honda",
                              controller:
                              context.watch<AddCarProvider>().CategoriesCtr,
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
                                // focusNode: ModelFocusNode,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 0.w),
                        child: Text(
                          "backgroundImage",
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
                              controlllerType: "backgroundImage",
                              onChanged: (content) {
                                context.read<AddCarProvider>().changeError();
                              },
                              hinttextColor: Colors.white54,
                              textfillColor: Colors.transparent,
                              focusNode:
                              context.watch<AddCarProvider>().backgroundFocusNode,
                              focusColor: AppColors.white,
                              hintText: "Red",
                              controller:
                              context.watch<AddCarProvider>().backgroundCtr,
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
                                // focusNode: ModelFocusNode,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 37.w, 70.w, 0.w),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Upload Image",style: TextStyle(color: Colors.white),),
                            context.watch<AddCarProvider>().isImageUplaoded==true?
                            Container(
                                width: 150.w,
                                child: Text(context.watch<AddCarProvider>().image!.path.toString(),style: TextStyle(color: Colors.white),))
                                :Container(
                              height: 30.h,
                              child: MyFormButton(
                                fontweight: FontWeight.w500,
                                ButtonText: "Upload",
                                fontsize: 14,
                                onCustomButtonPressed: () {
                                  print("sdf");
                                  context.read<AddCarProvider>().pickImage();
                                  // Get.off(MyNavigationBar());
                                },
                                textfontcolor: Colors.white,
                                BackgroundColor: AppColors.appBackground,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 35.w, 0.w, 40),
                        child: Container(
                          width: 307.w,
                          height: 54.h,
                          child: MyFormButton(
                            fontweight: FontWeight.w500,
                            ButtonText: "Add",
                            fontsize: 14,
                            onCustomButtonPressed: () {
                              if (context.read<AddCarProvider>().ModelCtr.text ==
                                  "") {
                                context
                                    .read<AddCarProvider>()
                                    .ModelFocusNode
                                    .requestFocus();
                              }
                              if (context
                                  .read<AddCarProvider>()
                                  .MakeCtr
                                  .text ==
                                  "") {
                                context
                                    .read<AddCarProvider>()
                                    .MakeFocusNode
                                    .requestFocus();
                              }
                              if (context
                                  .read<AddCarProvider>()
                                  .RegistrationCtr
                                  .text ==
                                  "") {
                                context
                                    .read<AddCarProvider>()
                                    .RegistationFocusNode
                                    .requestFocus();
                              }
                              if (context
                                  .read<AddCarProvider>()
                                  .ColorCtr
                                  .text ==
                                  "") {
                                context
                                    .read<AddCarProvider>()
                                    .ColorFocusNode
                                    .requestFocus();
                              }
                              if (context
                                  .read<AddCarProvider>()
                                  .CategoriesCtr
                                  .text ==
                                  "") {
                                context
                                    .read<AddCarProvider>()
                                    .CAtegoriesFocusNode
                                    .requestFocus();
                              }
                              if (context
                                  .read<AddCarProvider>()
                                  .backgroundCtr
                                  .text ==
                                  "") {
                                context
                                    .read<AddCarProvider>()
                                    .backgroundFocusNode
                                    .requestFocus();
                              }
                              else {
                                context.read<AddCarProvider>().AddCar();
                              }

                              // Get.off(MyNavigationBar());
                            },
                            textfontcolor: Colors.white,
                            BackgroundColor: AppColors.appBackground,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
