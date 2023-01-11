import 'package:carproject/controller/auth/DashBoardProvider.dart';
import 'package:carproject/controller/auth/SignUpProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Services/AuthServices.dart';
import '../../AppConfig/Api.dart';
import '../../AppConfig/AppColors.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/count_widget.dart';
import '../Auth/Login.dart';
import '../Car/AddCars.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashProvider dash = new DashProvider();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> catagories = ["Honda", "Suzuki", "Mehran", "Audi", "Cultus"];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: Column(

                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:30.w,right:40.w,bottom: 10.h),
                      child: Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(context.watch<DashProvider>().USerEmai,style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),),

                            Container(
                              height: 40.h,
                              width: 100.w,
                              child: MyFormButton(
                                fontweight: FontWeight.w500,
                                ButtonText: "Logout",
                                fontsize: 14,
                                onCustomButtonPressed: () {
                                    context.read<DashProvider>().deleteAuth();
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                                },
                                textfontcolor: Colors.white,
                                BackgroundColor: AppColors.appBackground,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:30.w,right:40.w,bottom: 10.h),
                      child: Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                            Text("DashBoard",style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),),

                            Container(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addcars()));

                                },
                                child: Row(
                                  children: [


                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: Icon(Icons.add),
                                    ),
                                    Text("Add Car",style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        color: Colors.black),),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<DashProvider>().getCarsData();
                      },
                      child: Container(
                        width: width - 40,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            border: Border.all(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 60.w, right: 60.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Count_data(
                                Name: "Cars",
                                count: context
                                    .watch<DashProvider>()
                                    .totalCars
                                    .toString(),
                              ),
                              Count_data(
                                Name: "Users",
                                count: context
                                    .watch<DashProvider>()
                                    .totalUser
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 10.w),
              child: Container(
                width: width,
                height: 70.h,
                child: ListView.builder(
                  itemCount: catagories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<DashProvider>()
                              .changeSeletcedIndex(position);
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                catagories[position],
                                style: GoogleFonts.montserrat(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                              if (context.watch<DashProvider>().seletecdIndex ==
                                  position)
                                Container(
                                  width: 30,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                        color: Colors.black54,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            context.watch<DashProvider>().recievedData
                ? Padding(
                  padding: EdgeInsets.only(left: 5.w,right: 5.w),
                  child: Container(
                      height: 500.h,
                      child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: (0.7),
                          shrinkWrap: true,
                          mainAxisSpacing: 14.0,
                          children: List.generate(
                              context.watch<DashProvider>().cars.length, (index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black54,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h, right: 10.w),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                border: Border.all(
                                                  color: Colors.black54,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.w, horizontal: 5.h),
                                              child: Text(
                                                "New",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        height: 100,
                                        child: new Image.network(
                                            ApiString.fetchImage + "?Image=" + context
                                                .watch<DashProvider>()
                                                .cars[index]
                                                .image
                                                .toString(),)),
                                            //context.read<DashProvider>().readImage("image-1673160280961.jpg").toString())),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        context
                                            .watch<DashProvider>()
                                            .cars[index]
                                            .make
                                            .toString(),
                                        style:
                                            GoogleFonts.montserrat(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, bottom: 10.h),
                                      child: Text(
                                        context
                                            .read<DashProvider>()
                                            .cars[index]
                                            .categories
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10.h),
                                      child: Container(
                                        child: Center(
                                          child: Container(
                                            height: 40.h,
                                            width: 150.w,
                                            child: MyFormButton(
                                              fontweight: FontWeight.w500,
                                              ButtonText: "Update",
                                              fontsize: 14,
                                              onCustomButtonPressed: () {

                                              },
                                              textfontcolor: Colors.white,
                                              BackgroundColor: AppColors.appBackground,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                )
                : Center(child: CircularProgressIndicator(
              color: AppColors.appBackground,
            )),
          ],
        ),
      ),
    );
  }
}
