import 'dart:convert';
import 'dart:io';

import 'package:carproject/model/Car.dart';

import '../View/AppConfig/Api.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
class Services {
  static Future<String> requestRegister(User user) async {
    //String body = json.encode(user);
    Map data = {
      'Name': user.Name,
      'Email': user.Email,
      'Password': user.Password,
      'UserName': user.UserName,
    };
    var map = new Map<String, dynamic>();
    map['Name'] = user.Name;
    map['Email'] = user.Email;
    map['Password'] = user.Password;
    map['UserName'] = user.UserName;

    //encode Map to JSON
    var body = json.encode(data);

    //sending responce post
    http.Response response =
        await http.post(Uri.parse(ApiString.Register), body: map);

    //decoding the responce
    Map<String, dynamic> mapnew =
        jsonDecode(response.body); // import 'dart:convert';

    String name = mapnew['Responce'];
    print(name);
    return name;
  }

  static Future<String> tryAddCar(Car car) async{
    var postUri =  Uri.parse(ApiString.addCars);

    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);


    var stream =
    new http.ByteStream(DelegatingStream.typed(car.imagefile!.openRead()));
    // get file length

    var length = await car.imagefile!.length();
    http.MultipartFile multipartFile = await new http.MultipartFile('image', stream,length,
        filename: basename(car.imagefile!.path));

    request.files.add(multipartFile);

    request.fields['model'] = car.model.toString();
    request.fields['make'] = car.make.toString();
    request.fields['RegistrationNo'] = car.registrationNo.toString();
    request.fields['color'] = car.color.toString();
    request.fields['categories'] = car.categories.toString();
    request.fields['New'] = "0";
    request.fields['backgroundImage'] = car.background.toString();
  print(request);
    http.StreamedResponse response = await request.send();
    print(response.statusCode.toString());

    if(response.statusCode==200){
      return "success";
    }else{
      return "Failed";
    }

  }
   static Future<String> AddCar(Car car) async {
    //String body = json.encode(user);

    var stream =
    new http.ByteStream(DelegatingStream.typed(car.imagefile!.openRead()));
    // get file length
    var length = await car.imagefile!.length();

    var uri = Uri.parse(ApiString.addCars);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    print(basename(car.imagefile!.path));
    // multipart that takes file
    var multipartFileSign = new http.MultipartFile('Image', stream, length,
        filename: basename(car.imagefile!.path));

    // add file to multipart
    request.files.add(multipartFileSign);


    //adding params
    request.fields['model'] = car.model.toString();
    request.fields['make'] = car.make.toString();
    request.fields['RegistrationNo'] = car.registrationNo.toString();
    request.fields['color'] = car.color.toString();
    request.fields['categories'] = car.categories.toString();
    request.fields['backgroundImage'] = car.background.toString();
    // request.fields['lastName'] = 'efg';

    // send
    var response = await request.send();




    // var map = new Map<String, dynamic>();
    // map['model'] = car.model;
    // map['make'] = car.make;
    // map['RegistrationNo'] = car.registrationNo;
    // map['color'] = car.color;
    // map['categories'] = car.categories;
    // map['backgroundImage'] = car.background;
    // map['image'] = car.imagefile;
    //
    //
    // //sending responce post
    // http.Response response =
    // await http.post(Uri.parse(ApiString.addCars), body: map);

    print("add data: "+response.toString());
    //decoding the responce
    // Map<String, dynamic> mapnew =
    // jsonDecode(response.body); // import 'dart:convert';

    String name = "sdf";
    print(name);
    return name;
  }

  static Future<String> Login(User user) async {
    //String body = json.encode(user);
    Map data = {
      'Name': user.Name,
      'Email': user.Email,
      'Password': user.Password,
      'UserName': user.UserName,
    };

    var map = new Map<String, dynamic>();
    map['Email'] = user.Email;
    map['Password'] = user.Password;

    //encode Map to JSON
    var body = json.encode(data);

    //sending responce post
    http.Response response =
        await http.post(Uri.parse(ApiString.SignIn), body: map);

    //decoding the responce
    Map<String, dynamic> mapnew =
        jsonDecode(response.body); // import 'dart:convert';

    String name = mapnew['Responce'];

    print(name);

    return name;
  }

  static Future<String> FetchImage(String ImagePath) async {
    //String body = json.encode(user);
    final queryParameters = {
      'Image': ImagePath,
    };

    final uri = Uri.parse(ApiString.fetchImage + "?Image=" + ImagePath);
    final response = await http.get(uri);
    print("result " + response.body);
    return response.body;
  }

  static Future<List<Car>> FetchCarDetails() async {
    //String body = json.encode(user);
    List<Car> cars=[];
    final uri = Uri.parse(ApiString.fetchCarsDetails);
    final response = await http.get(uri);

    Map<String,dynamic> data=jsonDecode(response.body);
    List<dynamic> list=data["Responce"] as List;
    print("size "+list.length.toString());
    for(int i=0;i<list.length;i++){
      Car c=Car.fromJson(data["Responce"][i]);
      cars.add(c);
    }

    return cars;
  }

  static Future<String> FetchTotalUser() async {
    //String body = json.encode(user);

    print(ApiString.fetchTotalUser);
    final uri = Uri.parse(ApiString.fetchTotalUser);
    final response = await http.get(uri);

    Map<String, dynamic> mapnew =
        jsonDecode(response.body); // import 'dart:convert';

    int name = mapnew['count'];
    print("result " + name.toString());
    return name.toString();
  }

  static Future<String> FetchTotalCar() async {
    //String body = json.encode(user);


    final uri = Uri.parse(ApiString.fetchTotalCars);
    final response = await http.get(uri);

    Map<String, dynamic> mapnew =
    jsonDecode(response.body); // import 'dart:convert';

    int name = mapnew['count'];
    print("result " + name.toString());
    return name.toString();
  }
}
