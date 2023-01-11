import 'dart:io';

class Car{
  String? categories;
  String? color;
  String? model; // verified=>green, pending=>yellow, rejected=>red,
  String? registrationNo;
  String? make;
  String? image;
  File? imagefile;
  String? background;
  String? id;
  Car(
      {this.categories, this.color, this.model, this.registrationNo, this.make, this.image, this.background,this.id,this.imagefile});

  Car.fromModel(
      String categories,File Imagefile, String color, String model, String registrationNo,String make,String background,String id) {
    this.categories = categories;
    this.color = color;
    this.id=id;
    this.imagefile=Imagefile;
    this.model = model;
    this.registrationNo = registrationNo;
    this.make = make;
    this.image = image;
    this.background = background;
  }


  factory Car.fromJson(Map<String,dynamic> json){
    Car c=Car();
    c.id=json['_id'];

    c.image=json['image'];
    c.color=json['color'];
    c.background=json['background'];
    c.categories=json['categories'];
    c.make=json['make'];
    c.model=json['model'];
    c.registrationNo=json['registrationNo'];
    return c;
  }
}