import 'package:carproject/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:sembast/sembast.dart';

import '../../Services/AuthServices.dart';
import '../../database/sqlite.dart';

class LoginProvider extends ChangeNotifier {
  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();
  var pwdFocusNode = FocusNode();
  var emailFocusNode = FocusNode();

  bool error = false;

  String errorText = "";

  String get EmailData => emailCtr.text;

  String get PasswordData => passwordCtr.text;

  TextEditingController get emailController => emailCtr;

  TextEditingController get PasswordController => passwordCtr;

  void changeError() {
    error = false;
    notifyListeners();
  }

  void mantainSession() async {
    Database db =
        await LiteSolution.dbFactory.openDatabase(LiteSolution.dbPath);
    // dynamically typed store
    var User = StoreRef.main();
    await User.record('Email').put(db, emailCtr.text);

    String title = await User.record('Email').get(db) as String;
    print("saved data is ${title}");
  }

  Future<bool> LoginUser() async {
    //creating user
    User user = new User(
        Name: "",
        Email: this.emailCtr.text,
        Password: this.passwordCtr.text,
        UserName: "");

    //using apis
    String msg = await Services.Login(user);

    print(msg);
    // Returnig responce from api
    if (msg.toLowerCase() == "congragulations") {
      error = true;
      mantainSession();
      errorText = "Success";
    } else {
      print("msg ya ha ${msg}");
      error = true;
      errorText = msg;
    }

    //Clearing all the textEditiors
    this.passwordCtr.clear();
    this.emailCtr.clear();

    notifyListeners();
    return true;
  }
}
