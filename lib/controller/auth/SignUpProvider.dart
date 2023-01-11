import 'package:carproject/model/user.dart';
import 'package:flutter/cupertino.dart';

import '../../Services/AuthServices.dart';

class SignUpProvider extends ChangeNotifier {
  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();
  var NameCtr = TextEditingController();
  var pwdFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  var NameFocusNode = FocusNode();




  bool error = false;
  String errorText = "";

  String get EmailData => emailCtr.text;

  String get PasswordData => passwordCtr.text;

  TextEditingController get emailController => emailCtr;

  TextEditingController get PasswordController => passwordCtr;

  //changing error type
  void changeError() {
    error = false;
    notifyListeners();
  }

  Future<bool> registerUSer() async {
    //creating user
    User user = new User(
        Name: this.NameCtr.text,
        Email: this.emailCtr.text,
        Password: this.passwordCtr.text,
        UserName: this.NameCtr.text);

    //using apis
    String msg = await Services.requestRegister(user);
    print(msg);
    // Returnig responce from api
    if (msg.toLowerCase() == "success") {
      error = true;
      errorText = "Success";
    } else {
      error = true;
      errorText = msg;
    }

    //Clearing all the textEditiors
    this.passwordCtr.clear();
    this.emailCtr.clear();
    this.NameCtr.clear();

    notifyListeners();
    return true;
  }
}
