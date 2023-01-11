import 'package:flutter/material.dart';

import '../AppConfig/AppColors.dart';


class Styles{

  static TextStyle textFieldlabelTextStyle(){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: AppColors.pink
    );
  }
  static TextStyle textFieldTextStyle(Color TextColor){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: TextColor,
    );
  }
  static TextStyle labelTextStyle(){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.pink
    );
  }
  static TextStyle homeScreenListItemTextStyle(){
    return TextStyle(
        color: Colors.blue[700],
        fontSize: 15,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle phoneNumberTextStyle(Color textColor){
    return TextStyle(
          color: textColor,
        fontSize: 20,
        letterSpacing: 3
      // fontWeight: FontWeight.bold
    );
  }

}