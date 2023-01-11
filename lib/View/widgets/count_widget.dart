import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Count_data extends StatelessWidget {
  String count;
  String Name;
  Count_data({Key? key,required this.Name,required this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(this.count,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w500),),
        Text(this.Name,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.w700),),
      ],
    );
  }
}
