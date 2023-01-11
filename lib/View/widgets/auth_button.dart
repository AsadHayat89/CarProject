import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyFormButton extends StatefulWidget {

  final String ButtonText;
  final double fontsize;
  final Color textfontcolor;
  final Color BackgroundColor;
  final  VoidCallback onCustomButtonPressed;
  final FontWeight fontweight;
  MyFormButton({Key? key, required this.ButtonText, required this.fontsize, required this.textfontcolor, required this.BackgroundColor, required this.fontweight, required this.onCustomButtonPressed}) : super(key: key);

  @override
  State<MyFormButton> createState() => _MyFormButtonState();
}

class _MyFormButtonState extends State<MyFormButton> {

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.BackgroundColor),
            // padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: widget.fontsize, color: widget.textfontcolor))),
        onPressed: widget.onCustomButtonPressed,

        child:Text(widget.ButtonText,style: TextStyle(color: widget.textfontcolor,fontSize: widget.fontsize.w,fontWeight: widget.fontweight),));
  }
}
