import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../Services/AuthServices.dart';
import '../../model/Car.dart';

class AddCarProvider extends ChangeNotifier{
  var ModelCtr = TextEditingController();
  var MakeCtr = TextEditingController();
  var RegistrationCtr = TextEditingController();
  var ColorCtr = TextEditingController();
  var CategoriesCtr = TextEditingController();
  var backgroundCtr = TextEditingController();

  var ModelFocusNode = FocusNode();
  var MakeFocusNode = FocusNode();
  var RegistationFocusNode = FocusNode();
  var ColorFocusNode = FocusNode();
  var CAtegoriesFocusNode = FocusNode();
  var backgroundFocusNode = FocusNode();

  void uploaddata(Car car){
    this.ColorCtr.text=car.color.toString();
    this.backgroundCtr.text=car.background.toString();
    this.ModelCtr.text=car.model.toString();
    this.MakeCtr.text=car.make.toString();
    this.CategoriesCtr.text=car.categories.toString();
    this.ColorCtr.text=car.color.toString();
    image=car.imagefile;
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      this.image=imageTemp;
      this.isImageUplaoded=true;
      notifyListeners();
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }



  bool isImageUplaoded=false;

  bool error = false;

  String errorText = "";

  void changeError() {
    error = false;
    notifyListeners();
  }


  Future<bool> AddCar() async {
    //creating user
    Car user = new Car(
      make: this.MakeCtr.text,
      model: this.ModelCtr.text,
      categories: this.CategoriesCtr.text,
      registrationNo: this.RegistrationCtr.text,
      background: this.backgroundCtr.text,
      color: this.ColorCtr.text,

        imagefile: this.image
    );

    //using apis
    String msg = await Services.tryAddCar(user);

    // // Returnig responce from api
    if (msg.toLowerCase() == "success") {
      error = true;
      errorText = "Success";
      return true;
    } else {
      error = true;
      errorText = "Failed";
    }

    // //Clearing all the textEditiors
    this.ColorCtr.clear();
    this.backgroundCtr.clear();
    this.ModelCtr.clear();
    this.MakeCtr.clear();
    this.CategoriesCtr.clear();
    this.ColorCtr.clear();

    notifyListeners();
    return false;
  }
}